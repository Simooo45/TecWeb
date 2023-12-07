package esame;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

/** 
 * Chiedo scusa per eventuali imprecisioni o sviste ma questa è la soluzione 
 * migliore che mi sia venuta in mente per la sincronizzazione delle variabili 
 * con scope application, in particolare per le modifiche set e get Attribute 
 * che avvengono nel ServletContext.
 * 
 * @author Simone Elia
 */



/*  
 * La classe permette l'utilizzo di una Proxy in SyncHttpServlet che serve a sincronizzare i
 * metodi del contesto.
*/
class SyncContext implements InvocationHandler{
    private final ServletContext context;
    private ReentrantReadWriteLock lockMap;
    private Map<String, ReentrantReadWriteLock> locks;

    // Costruttore
    public SyncContext(ServletContext context) {
        this.context = context;
        this.lockMap = new ReentrantReadWriteLock();
        this.locks = new HashMap<String, ReentrantReadWriteLock>();
    }

    // Aggiunta di un Lock per ogni attributo
    private ReentrantReadWriteLock addLock(String attributeName){
        lockMap.writeLock().lock();
        try{
            ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
            this.locks.put(attributeName, lock);
            return this.locks.get(attributeName);
        } finally {
            lockMap.writeLock().unlock();
        }
    }

    // Funzione che si occupa di sincronizzare le modifiche alla Map di Lock
    private ReentrantReadWriteLock getLock(String attributeName){
        ReentrantReadWriteLock lock;
        lockMap.readLock().lock();
        try{
            lock = locks.get(attributeName);
        } finally {
            lockMap.readLock().unlock();
        }
        if (lock == null) {
            lock = addLock(attributeName);
        }
        return lock;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        String methodName = method.getName();

        // Modifica ai metodi di setAttribute e getAttribute
        if ("setAttribute".equals(methodName) || "getAttribute".equals(methodName)){
            String attributeName = (String) args[0];

            // Viene preso dalla mappa il Lock corrispondente all'attributo del Context
            ReentrantReadWriteLock lock = getLock(attributeName);
            if ("setAttribute".equals(methodName)) {

                // Utilizzo di writeLock per le modifiche in "scrittura"
                lock.writeLock().lock();
                try {
                    // Impedisce la sovrascrittura di se stesso
                    if (!args[0].equals("syncContext")) {
                        Object result = method.invoke(context, args);
                        return result;
                    } else {
                        return null;
                    }
                } finally {
                    lock.writeLock().unlock();
                }
            } else {
                
                // Utilizzo di readLock per le modifiche in "lettura"
                lock.readLock().lock();
                try {
                    Object result = method.invoke(context, args);
                    return result;
                } finally {
                    lock.readLock().unlock();
                }
            }
        } else {
            
            // Qualsiasi altro metodo del Context non viene modificato 
            return method.invoke(context, args);
        }
    }
}

public class SyncHttpServlet extends HttpServlet {

    @Override
    public synchronized void init() throws ServletException {
        super.init();

        /* Le JSP che non possono estendere direttamente SyncHttpServlet, quindi
         * copio la classe stessa in un Attributo del Context HttpServlet.
         * Tale attributo dovrebbe risultare immodificabile per i controlli posti 
         * in SyncContext.
         */
        if (super.getServletContext().getAttribute("syncContext") == null) {
            super.getServletContext().setAttribute("syncContext", this.createSyncContext());
        }

    }

    // Una proxy si occupa di creare un' "estensione" casalinga di ServletContext.
    private ServletContext createSyncContext() {
        ServletContext context = super.getServletContext();
        return (ServletContext) Proxy.newProxyInstance(
                ServletContext.class.getClassLoader(),
                new Class[] { ServletContext.class },
                new SyncContext(context));
    }

    @Override
    // SyncHttpServlet sovrascrive il metodo getServletContext e ritorna un oggetto SyncContext.
    public ServletContext getServletContext() {
        return (ServletContext) super.getServletContext().getAttribute("syncContext");
    }
}
package esame;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitSyncContext extends SyncHttpServlet{
    @Override
    public synchronized void init() throws ServletException{
        super.init();
    }

    @Override
    public void service(ServletRequest arg0, ServletResponse arg1) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/login.jsp").forward(arg0, arg1);
    }

    
}

package esame;

public class Articolo {
    private String name;
    private boolean writeble;
    private int access;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isWriteble() {
        return writeble;
    }

    public void setWriteble(boolean writeble) {
        this.writeble = writeble;
    }

    public int getAccess() {
        return access;
    }

    public void setAccess(int access) {
        this.access = access;
    }

    public Articolo() {
    }

}

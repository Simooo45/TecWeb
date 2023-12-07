package esame;

public class Result {
    private String fileContent;
    private String target;
    private int occur;

    public Result(String fileContent, String target, int occur){
        this.fileContent = fileContent;
        this.target = target;;
        this.occur = occur;
    }
    public String getFileContent() {
        return fileContent;
    }
    public String getTarget() {
        return target;
    }
    public int getOccur() {
        return occur;
    }
}

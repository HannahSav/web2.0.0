import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Point {

    private double x;
    private double y;
    private double r;
    private boolean isInArea;
    private long runtime;
    private String dateTime;

    public Point(double x, double y, double r, long runtime){
        this.x = x;
        this.y = y;
        this.r = r;
        isInArea = setInArea(x,y,r);
        this.runtime = runtime;
        dateTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public double getX() {
        return x;
    }
    public double getY() {
        return y;
    }
    public double getR() {
        return r;
    }
    public boolean isInArea() {
        return isInArea;
    }
    public long getRuntime() {
        return runtime;
    }
    public String getDateTime() {
        return dateTime;
    }

    public String getPoint() {
        double xMap = x * 100 / r + 155;
        double yMap = y * -100 / r + 155;
        return "<circle r=\"3\" cx="+ xMap +" cy="+ yMap +" opacity=\"0.7\" fill=\"red\" ></circle>";
    }

    public String getTableRow() {
        return "<tr class='result_php'>" +
                "<td>" + x + "</td>" +
                "<td>" + y + "</td>" +
                "<td>" + r + "</td>" +
                "<td>" + isInArea() + "</td>" +
                "<td>" + dateTime + "</td>" +
                "<td>" + runtime + "ms" + "</td>" +
                "</tr>";
    }

    public boolean setInArea(double x, double y, double r) {
        if (x <= 0 && y >= 0 && y <= r && x <= r) return true;
        if (x >= 0 && y >= 0 && 2*(x + y) <= r) return true;
        if (x <= 0 && y <= 0 && 4*(x*x+y*y) <= r*r) return true;
        return false;
    }
}
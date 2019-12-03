package cn.yzw.myblog.vo;

import java.io.Serializable;
import java.util.Date;

public class Visitor implements Serializable {
    private Integer id;//id
    private String name;//访客名称
    private String ip;//访客ip
    private String location;//访客位置
    private Date vtime;//访问时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getTime() {
        return vtime;
    }

    public void setTime(Date time) {
        this.vtime = time;
    }
}

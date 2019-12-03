package cn.yzw.myblog.vo;

import java.io.Serializable;
import java.util.Date;

public class ThUp implements Serializable {
    private Integer id;
    private Integer BoId;
    private Integer ArId;
    private Integer UId;
    private Date data;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBoId() {
        return BoId;
    }

    public void setBoId(Integer boId) {
        BoId = boId;
    }

    public Integer getArId() {
        return ArId;
    }

    public void setArId(Integer arId) {
        ArId = arId;
    }

    public Integer getUId() {
        return UId;
    }

    public void setUId(Integer UId) {
        this.UId = UId;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}

package cn.yzw.myblog.vo;

import java.io.Serializable;

public class SaveImage implements Serializable {

    private Integer id;
    private Integer arid;
    private String url;

    public SaveImage(){}

    public SaveImage(Integer arid,String url){
        this.arid = arid;
        this.url = url;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getArid() {
        return arid;
    }

    public void setArid(Integer arid) {
        this.arid = arid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "SaveImage{" +
                "id=" + id +
                ", arid=" + arid +
                ", url='" + url + '\'' +
                '}';
    }
}

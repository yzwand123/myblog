package cn.yzw.myblog.vo;

import java.io.Serializable;

public class CateGory implements Serializable {

    private Integer id;//分类id
    private String categoryname;//分类名称
    private String categorycontext;//分类介绍

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }

    public String getCategorycontext() {
        return categorycontext;
    }

    public void setCategorycontext(String categorycontext) {
        this.categorycontext = categorycontext;
    }
}

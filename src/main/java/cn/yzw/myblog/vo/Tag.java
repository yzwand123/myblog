package cn.yzw.myblog.vo;

import java.io.Serializable;

/**
 * 标签
 */
public class Tag implements Serializable {
        private Integer tagid;//标签id
        private String tagname;//标签名称
        private String tagcontext;//标签介绍

    public String getTagcontext() {
        return tagcontext;
    }

    public void setTagcontext(String tagcontext) {
        this.tagcontext = tagcontext;
    }

    public Integer getTagid() {
        return tagid;
    }

    public void setTagid(Integer tagid) {
        this.tagid = tagid;
    }

    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname;
    }
}

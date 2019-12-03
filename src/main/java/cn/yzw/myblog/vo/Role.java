package cn.yzw.myblog.vo;

import java.io.Serializable;

/**
 * 角色
 */
public class Role implements Serializable {

    private  Integer id;//角色id
    private String rolename;//角色名称

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}

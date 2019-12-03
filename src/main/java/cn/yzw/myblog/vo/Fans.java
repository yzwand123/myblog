package cn.yzw.myblog.vo;

import java.io.Serializable;

public class Fans implements Serializable {

    private Integer id;//数据id
    private Integer fanId; //粉丝用户id
    private Integer boId;//博主id
    private String nickname;//粉丝昵称
    private String userName;//粉丝账号
    private String email;//粉丝电子邮箱

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFanId() {
        return fanId;
    }

    public void setFanId(Integer fanId) {
        this.fanId = fanId;
    }

    public Integer getBoId() {
        return boId;
    }

    public void setBoId(Integer boId) {
        this.boId = boId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

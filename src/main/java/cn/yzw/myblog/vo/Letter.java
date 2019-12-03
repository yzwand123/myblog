package cn.yzw.myblog.vo;

import java.io.Serializable;
import java.util.Date;

public class Letter implements Serializable {
    private Integer leId;
    private Integer userId;
    private Integer bo_id;
    private Integer letterState;
    private Date letterTime;
    private String letterComtext;
    private String nickName;
    private String email;

    public Integer getLeId() {
        return leId;
    }

    public void setLeId(Integer leId) {
        this.leId = leId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBo_id() {
        return bo_id;
    }

    public void setBo_id(Integer bo_id) {
        this.bo_id = bo_id;
    }

    public Integer getLetterState() {
        return letterState;
    }

    public void setLetterState(Integer letterState) {
        this.letterState = letterState;
    }

    public Date getLetterTime() {
        return letterTime;
    }

    public void setLetterTime(Date letterTime) {
        this.letterTime = letterTime;
    }

    public String getLetterComtext() {
        return letterComtext;
    }

    public void setLetterComtext(String letterComtext) {
        this.letterComtext = letterComtext;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

package cn.yzw.myblog.vo;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {
    private Integer id;
    private Integer commentUId;
    private Integer commentBoId;
    private Integer commentArId;
    private String commentContext;
    private Date commentTime;
    private String nickName;
    private String arTitle;

    public String getArTitle() {
        return arTitle;
    }

    public void setArTitle(String arTitle) {
        this.arTitle = arTitle;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCommentUId() {
        return commentUId;
    }

    public void setCommentUId(Integer commentUId) {
        this.commentUId = commentUId;
    }

    public Integer getCommentBoId() {
        return commentBoId;
    }

    public void setCommentBoId(Integer commentBoId) {
        this.commentBoId = commentBoId;
    }

    public Integer getCommentArId() {
        return commentArId;
    }

    public void setCommentArId(Integer commentArId) {
        this.commentArId = commentArId;
    }

    public String getCommentContext() {
        return commentContext;
    }

    public void setCommentContext(String commentContext) {
        this.commentContext = commentContext;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}

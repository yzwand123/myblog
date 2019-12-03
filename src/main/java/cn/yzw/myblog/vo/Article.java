package cn.yzw.myblog.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Article implements Serializable {
    private Integer id;
    private String articleTitle;
    private Integer article_boId;
    private String articleAbstract;
    private String articleContext;
    private Date createTime;
    private String authorName;
    private List<Tag> tags;
    private List<SaveImage> saveImages;


    public Integer getArticle_boId() {
        return article_boId;
    }

    public void setArticle_boId(Integer article_boId) {
        this.article_boId = article_boId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleAbstract() {
        return articleAbstract;
    }

    public void setArticleAbstract(String articleAbstract) {
        this.articleAbstract = articleAbstract;
    }

    public String getArticleContext() {
        return articleContext;
    }

    public void setArticleContext(String articleContext) {
        this.articleContext = articleContext;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public List<SaveImage> getSaveImages() {
        return saveImages;
    }

    public void setSaveImages(List<SaveImage> saveImages) {
        this.saveImages = saveImages;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", articleTitle='" + articleTitle + '\'' +
                ", article_boId=" + article_boId +
                ", articleAbstract='" + articleAbstract + '\'' +
                ", articleContext='" + articleContext + '\'' +
                ", createTime=" + createTime +
                ", authorName='" + authorName + '\'' +
                ", tags=" + tags +
                ", saveImages=" + saveImages +
                '}';
    }
}

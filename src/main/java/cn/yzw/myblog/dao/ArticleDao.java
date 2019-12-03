package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.Article;
import cn.yzw.myblog.vo.SaveImage;

import java.util.List;
import java.util.Map;

public interface ArticleDao {

    Article findById(Integer id);

    int saveArticle(Article article);

    List<Article> findByPageWithKey(Map<String,Object> map);

    List<Article> findByPageWithTag(Map<String,Object> map);

    List<Article> findByPageWithCategory(Map<String,Object> map);

    int findArticleCount(Integer id);

    int findViewByArticleCount(Integer id);

    int findThUPByArticleCount(Integer id);

    int addViewCount(Integer id);

    int saveImage(SaveImage saveImage);

    int deleteArticle(Integer id);


}

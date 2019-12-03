package cn.yzw.myblog.service;

import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Article;
import cn.yzw.myblog.vo.SaveImage;

import java.util.Set;


public interface ArticleService {

    Article findById(Integer id);

    boolean saveArticle(Article article);

    PageUtil<Article> findByPageWithKey(String pageCode,String pageSize,String key);

    PageUtil<Article> findByPageWithTag(String pageCode,String pageSize,int tagId);

    PageUtil<Article> findByPageWithCategory(String pageCode,String pageSize,int categoryId);

    int findArticleCount(Integer Id);

    int findViewByArticleCount(Integer id);

    int findThUPByArticleCount(Integer id);

    boolean addViewCount(Integer id);

    boolean saveImage(SaveImage saveImage);

    boolean deleteArticle(Integer id);

    boolean deleteArticles(Set<Integer> ids);


}
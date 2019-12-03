package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.ArticleDao;
import cn.yzw.myblog.service.ArticleService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Article;
import cn.yzw.myblog.vo.SaveImage;
import cn.yzw.myblog.vo.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleDao articleDao;


    @Override
    public Article findById(Integer id) {
        return articleDao.findById(id);
    }

    @Override
    public boolean saveArticle(Article article) {
        try {
            return articleDao.saveArticle(article) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public PageUtil<Article> findByPageWithKey(String pageCode, String pageSize, String key) {
        PageUtil<Article> pageUtil = new PageUtil<Article>();
        Map<String,Object> map = new HashMap<>();

        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "7";
        }

        Integer totalCount = articleDao.findArticleCount(1);

        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);

        Integer totalPages = totalCount / Integer.parseInt(pageSize) + 1;

        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(totalCount);
        pageUtil.setTotalPages(totalPages);

        map.put("start",start);
        map.put("rows",Integer.parseInt(pageSize));
        List<Article> articles = null;
        if ("".equals(key)){key = null;}
        if (key != null){
            map.put("key","%"+key+"%");
            articles = articleDao.findByPageWithKey(map);
            pageUtil.setTotalCount(articles.size());
            pageUtil.setTotalPages(articles.size() / Integer.parseInt(pageSize) + 1);
        }else {
            articles = articleDao.findByPageWithKey(map);
        }

        pageUtil.setData(articles);

        return pageUtil;

    }

    @Override
    public PageUtil<Article> findByPageWithTag(String pageCode, String pageSize, int tagId) {
        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "7";
        }
        PageUtil<Article> pageUtil = new PageUtil<Article>();
        Map<String,Object> map = new HashMap<>();



        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);



        map.put("start",start);
        map.put("rows",Integer.parseInt(pageSize));
        map.put("id",tagId);

        List<Article> articles = articleDao.findByPageWithTag(map);

        pageUtil.setData(articles);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(articles.size());
        pageUtil.setTotalPages(articles.size() / (Integer.parseInt(pageSize) + 1));

        return pageUtil;
    }

    @Override
    public PageUtil<Article> findByPageWithCategory(String pageCode, String pageSize, int categoryId) {
        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "7";
        }
        PageUtil<Article> pageUtil = new PageUtil<Article>();
        Map<String,Object> map = new HashMap<>();



        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);


        map.put("start",start);
        map.put("rows",Integer.parseInt(pageSize));
        map.put("id",categoryId);

        List<Article> articles = articleDao.findByPageWithCategory(map);

        pageUtil.setData(articles);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(articles.size());
        pageUtil.setTotalPages(articles.size() / (Integer.parseInt(pageSize) + 1));

        return pageUtil;
    }

    @Override
    public int findArticleCount(Integer bId) {
        return articleDao.findArticleCount(bId);
    }

    @Override
    public int findViewByArticleCount(Integer id) {
        return articleDao.findViewByArticleCount(id);
    }

    @Override
    public int findThUPByArticleCount(Integer id) {
        return articleDao.findThUPByArticleCount(id);
    }

    @Override
    public boolean addViewCount(Integer id) {
        try {
           return articleDao.addViewCount(id) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean saveImage(SaveImage saveImage) {
        try {
           return articleDao.saveImage(saveImage) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean deleteArticle(Integer id) {
        return articleDao.deleteArticle(id) > 0;
    }

    @Override
    public boolean deleteArticles(Set<Integer> ids) {
        if (ids.isEmpty()){
            return false;
        }
        for (Integer id : ids) {
            deleteArticle(id);
        }
        return true;
    }
}

package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.ArticleService;
import cn.yzw.myblog.service.CategoryService;
import cn.yzw.myblog.service.TagService;
import cn.yzw.myblog.vo.Article;
import cn.yzw.myblog.vo.SaveImage;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/article")
public class ArticleController {

    @Resource(name = "articleService")
    private ArticleService articleService;

    @Resource(name = "tagService")
    private TagService tagService;

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    @ResponseBody
    @RequestMapping("/saveArticle")
    public String saveArticle(HttpServletRequest request){
        List imgs = (List) request.getSession().getAttribute("imgs");
        request.getSession().removeAttribute("imgs");
        String title = request.getParameter("tile");
        String abst = request.getParameter("abst");
        String html = request.getParameter("html");
        String category = request.getParameter("category");
        String tags = request.getParameter("tags");
        Map<String,Object> map = new HashMap<>();
        Article article = new Article();
        article.setArticle_boId(1);
        article.setArticleAbstract(abst);
        article.setArticleContext(html);
        article.setArticleTitle(title);
        article.setAuthorName("小菜鸡");
        String[] tag = tags.split(",");

        if (imgs != null){

            articleService.saveArticle(article);

            for (String s : tag) {
                tagService.saveTagOfArticle(article.getId(),Integer.parseInt(s));
            }

            categoryService.saveCategoryOfArticle(article.getId(),Integer.parseInt(category));

            for (Object img : imgs) {
                articleService.saveImage(new SaveImage(article.getId(),(String)img));
            }


        }
        map.put("stateCode",1);
        map.put("msg","发布成功！");
        return JSON.toJSONString(map);
    }

    @ResponseBody
    @RequestMapping("/deleteArticle")
    public String deleteArticle(HttpServletRequest request){
        String id = request.getParameter("id");
        Map<String,Object> map = new HashMap<>();
        if (articleService.deleteArticle(Integer.parseInt(id))){
            map.put("stateCode",1);
            map.put("msg","删除成功！");
        }else {
            map.put("stateCode",0);
            map.put("msg","删除失败！");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("/deleteArticles")
    public String deleteArticles(HttpServletRequest request){
        String[] visitorIds = request.getParameterValues("articleId");
        Set<Integer> ids = new HashSet<>();
        if (visitorIds != null){
            for (String visitorId : visitorIds) {
                ids.add(Integer.parseInt(visitorId));
            }
        }
        articleService.deleteArticles(ids);
        return "redirect:/admin/blogManger";
    }
}

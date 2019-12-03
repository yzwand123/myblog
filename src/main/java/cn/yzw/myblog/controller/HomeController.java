package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.ArticleService;
import cn.yzw.myblog.service.CommentService;
import cn.yzw.myblog.utils.HttpUtil;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Article;
import cn.yzw.myblog.vo.Comment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeController {

    @Resource(name = "articleService")
    private ArticleService articleService;

    @Resource(name = "commentService")
    private CommentService commentService;

    @RequestMapping("/")
    public String home(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        String key = request.getParameter("key");
        PageUtil<Article> articlePageUtil = articleService.findByPageWithKey(pageCode,pageSize,key);
        model.addAttribute("key",key);
        model.addAttribute("articles",articlePageUtil);
        return "user/index";
//        return "admin/admin";
    }

    @RequestMapping("/findArticleByTag")
    public String findArticleByTag(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        String tagId = request.getParameter("tagId");
        PageUtil<Article> articlePageUtil = articleService.findByPageWithTag(pageCode,pageSize,Integer.parseInt(tagId));
        model.addAttribute("articles",articlePageUtil);
        model.addAttribute("tagId",tagId);
        return "user/index";
    }

    @RequestMapping("/findArticleByCategory")
    public String findArticleByCategory(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        String categoryId = request.getParameter("categoryId");
        PageUtil<Article> articlePageUtil = articleService.findByPageWithCategory(pageCode,pageSize,Integer.parseInt(categoryId));
        model.addAttribute("articles",articlePageUtil);
        model.addAttribute("categoryId",categoryId);
        return "user/index";
    }

    @RequestMapping("/talk")
    public String talk(){
        return "user/talk";
    }

    @ResponseBody
    @RequestMapping("/startTalk")
    public String startTalk(HttpServletRequest request){
        String msg = request.getParameter("msg");
        HttpUtil httpUtil = new HttpUtil();
        String context = httpUtil.doGet("https://api.ownthink.com/bot?appid=xiaosi&userid=user&spoken="+msg);
        System.out.println("https://api.ownthink.com/bot?appid=xiaosi&userid=user&spoken="+msg);
        return context;
    }

    @RequestMapping("/findArticleById")
    public String findArticleById(HttpServletRequest request,Model model){

        String articleId = request.getParameter("articleId");

        Article article = articleService.findById(Integer.parseInt(articleId));

        articleService.addViewCount(Integer.parseInt(articleId));

        List<Comment> comments = commentService.findCommentByArticleId(Integer.parseInt(articleId));

        model.addAttribute("comments",comments);
        model.addAttribute("article",article);

       int viewCount = articleService.findViewByArticleCount(Integer.parseInt(articleId));
       int thUp = articleService.findThUPByArticleCount(Integer.parseInt(articleId));

       model.addAttribute("viewCount",viewCount);
       model.addAttribute("thUp",thUp);

        return "user/articlepage";
    }
}

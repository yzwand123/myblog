package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.*;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.utils.QiNuiUtil;
import cn.yzw.myblog.vo.*;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private List list = new ArrayList();


    @Resource(name = "tagService")
    private TagService tagService;

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    @Resource(name = "articleService")
    private ArticleService articleService;

    @Resource(name = "fansService")
    private FansService  fansService;

    @Resource(name = "visitorService")
    private VisitorService visitorService;

    @Resource(name = "thUpService")
    private ThUpService thUpService;

    @Resource(name = "commentService")
    private CommentService commentService;

    @Resource(name = "letterService")
    private LetterService letterService;

    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request,Model model){
       int articleCount = articleService.findArticleCount(1);
       int fansCount = fansService.findFansCount(1);
       int visitorTodayCount = visitorService.findTodayCount();
       int visitorAllCount = visitorService.findAllCount();
       int thCount = thUpService.findAllCount(1);
       int letterCount = letterService.findAllCount();
       model.addAttribute("letterCount",letterCount);
       model.addAttribute("articleCount",articleCount);
       model.addAttribute("fansCount",fansCount);
       model.addAttribute("visitorTodayCount",visitorTodayCount);
       model.addAttribute("visitorAllCount",visitorAllCount);
       model.addAttribute("thCount",thCount);
       return "admin/welcome";
    }

    @RequestMapping("/letterManger")
    public String letterManger(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        PageUtil<Letter> letterPageUtil = letterService.findByPage(pageCode,pageSize,0);
        model.addAttribute("letters",letterPageUtil);
        return "admin/LetterManger";
    }

    @RequestMapping("/blogManger")
    public String blogManger(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        String key = request.getParameter("key");
        PageUtil<Article> articlePageUtil = articleService.findByPageWithKey(pageCode,pageSize,key);
        model.addAttribute("key",key);
        model.addAttribute("articles",articlePageUtil);
        return "admin/blog/blogManger";
    }

    @ResponseBody
    @RequestMapping("/getData")
    public String getData(){
        List<Map<String,Object>> datas = visitorService.findWeekCount();
        return JSON.toJSONString(datas);
    }

    @RequestMapping("/newBlog")
    public String newBlog(Model model){
        List<Tag> tags = tagService.findAll();
        List<CateGory> cateGories = categoryService.findAll();
        model.addAttribute("tags",tags);
        model.addAttribute("cateGories",cateGories);
        return "admin/blog/newBlog";
    }

    @RequestMapping("/fansInfo")
    public String fansInfo(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        PageUtil<Fans> fansPageUtil = fansService.findByPage(pageCode,pageSize);
        model.addAttribute("fans",fansPageUtil);
        return "admin/FansInfo";
    }

    @RequestMapping("/commentManger")
    public String commentManger(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        PageUtil<Comment> commentPageUtil = commentService.findByPage(pageCode,pageSize);
        model.addAttribute("comments",commentPageUtil);
        return "admin/commentManger";

    }


    @ResponseBody
    @RequestMapping("/imgUploader")
    public String imgUploader(HttpServletRequest request,@RequestParam("file") MultipartFile file){
        request.getSession().removeAttribute("imgs");
        QiNuiUtil qiNuiUtil = new QiNuiUtil();
        try {
            String url = qiNuiUtil.saveImage(file);
            list.add(url);
            request.getSession().setAttribute("imgs",list);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";

    }

    @ResponseBody
    @RequestMapping("/uploadImage")
    public String uploadImage(@RequestParam(value = "editormd-image-file", required = false) MultipartFile file){
        QiNuiUtil qiNuiUtil = new QiNuiUtil();
        Map<String,Object> map = new HashMap<>();
        try {
            String url = qiNuiUtil.saveImage(file);
            map.put("success", 1);
            map.put("message", "上传成功！");
            map.put("url", url);
        } catch (IOException e) {
            e.printStackTrace();
            map.put("success", 0);
            map.put("message", "失败！");
        }
        return JSON.toJSONString(map);
    }
}

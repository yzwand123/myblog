package cn.yzw.myblog.interceptor;

import cn.yzw.myblog.service.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class HomeInterceptor implements HandlerInterceptor {

    @Resource(name = "tagService")
    private TagService tagService;

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "articleService")
    private ArticleService articleService;

    @Resource(name = "fansService")
    private FansService fansService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Map<String,Object> map = new HashMap<>();

        List<Map<String,Object>> tags = tagService.findTagCount();

        List<Map<String,Object>> categorys = categoryService.findCategoryCount();

        List<Map<String,Object>> articleLink = userService.findRankingList();

        int fanCount = fansService.findFansCount(1);

        int articleCount = articleService.findArticleCount(1);


        map.put("fanCount",fanCount);
        map.put("articleCount",articleCount);
        map.put("htags",tags);
        map.put("hcategorys",categorys);
        map.put("harticleLink",articleLink);

        request.setAttribute("map",map);

        System.out.println(map.toString());

        return true;
    }
}

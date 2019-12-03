package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.CategoryService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.CateGory;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/category")
public class CateGoryController {

    @Resource(name = "categoryService")
    private CategoryService categoryService;


    @RequestMapping("/categoryList")
    public String categoryList(HttpServletRequest request, Model model){

        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");

        PageUtil<CateGory> cateGoryPageUtil = categoryService.findByPage(pageCode,pageSize);
        model.addAttribute("category",cateGoryPageUtil);
        return "admin/category/categorylist";
    }

    @RequestMapping("/deleteCategory")
    @ResponseBody
    public String deleteCategory(HttpServletRequest request){

        String id = request.getParameter("id");

        Map<String,Object> map = new HashMap<>();
        if (id == null || "".equals(id)){
            map.put("stateCode",0);
            map.put("msg","删除失败,id不能为空！");
            return JSON.toJSONString(map);
        }
        if (categoryService.deleteCateGory(Integer.parseInt(id))){
            map.put("stateCode","1");
            map.put("msg","删除成功！");
            return JSON.toJSONString(map);
        }else {
            map.put("stateCode",0);
            map.put("msg","删除失败！");
            return JSON.toJSONString(map);
        }
    }

    @RequestMapping("/deleteCategorys")
    public String deleteCategorys(HttpServletRequest request){
        String[] visitorIds = request.getParameterValues("categoryId");
        Set<Integer> ids = new HashSet<>();
        if (visitorIds != null){
            for (String visitorId : visitorIds) {
                ids.add(Integer.parseInt(visitorId));
            }
        }
        categoryService.deleteCateGorys(ids);
        return "redirect:categoryList";
    }

    @RequestMapping("/showCategoryEdit")
    public String showCategoryEdit(HttpServletRequest request,Model model){
        String id = request.getParameter("id");
        if (id == null || "".equals(id)){
            return "admin/category/categoryEdit";
        }else {
            CateGory cateGory = categoryService.findById(Integer.parseInt(id));
            model.addAttribute("category",cateGory);
            return "admin/category/categoryEdit";
        }
    }
}

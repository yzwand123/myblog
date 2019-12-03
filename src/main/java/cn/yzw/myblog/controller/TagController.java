package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.TagService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Tag;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/tag")
public class TagController {

    @Resource(name = "tagService")
    private TagService tagService;


    @RequestMapping("/tagList")
    public String TagList(HttpServletRequest request,Model model){
        String pageCode = request.getParameter("pageCode");
        String PageSize = request.getParameter("pageSize");
        PageUtil<Tag> tagPageUtil = tagService.findByPage(pageCode,PageSize);
        model.addAttribute("tags",tagPageUtil);
        return "admin/tag/taglist";
    }


    @RequestMapping("/deleteTag")
    @ResponseBody
    public String deleteTag(HttpServletRequest request){
        String id = request.getParameter("id");
        Map<String,Object> map = new HashMap<>();
        if (id == null || "".equals(id)){
            map.put("stateCode",0);
            map.put("msg","删除失败,id不能为空！");
            return JSON.toJSONString(map);
        }
       if (tagService.deleteTag(Integer.parseInt(id))){
           map.put("stateCode","1");
           map.put("msg","删除成功！");
           return JSON.toJSONString(map);
       }else {
           map.put("stateCode",0);
           map.put("msg","删除失败！");
           return JSON.toJSONString(map);
       }
    }

    @RequestMapping("/deleteTags")
    public String deleteTags(HttpServletRequest request){
        String[] visitorIds = request.getParameterValues("tagId");
        Set<Integer> ids = new HashSet<>();
        if (visitorIds != null){
            for (String visitorId : visitorIds) {
                ids.add(Integer.parseInt(visitorId));
            }
        }
        tagService.deleteTags(ids);
        return "redirect:tagList";
    }

    @RequestMapping("/showTagEdit")
    public String showTagEdit(HttpServletRequest request,Model model){
        String id = request.getParameter("id");
        if (id == null || "".equals(id)){
            return "admin/tag/tagEdit";
        }else {
            Tag tag = tagService.findById(Integer.parseInt(id));
            model.addAttribute("tag",tag);
            return "admin/tag/tagEdit";
        }

    }

    @RequestMapping("/addTag")
    @ResponseBody
    public String addTag(HttpServletRequest request){
        String name = request.getParameter("name");
        String context = request.getParameter("context");
        Tag tag = new Tag();
        tag.setTagname(name);
        tag.setTagcontext(context);
        Map<String,Object> map = new HashMap<>();
        if (tagService.saveTag(tag)){
            map.put("stateCode",1);
            map.put("msg","添加成功");
          return JSON.toJSONString(map);
        }else {
            map.put("stateCode",0);
            map.put("msg","添加失败");
           return JSON.toJSONString(map);
        }
    }
    @RequestMapping("/updateTag")
    @ResponseBody
    public String updateTag(HttpServletRequest request){
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String context = request.getParameter("context");
        Tag tag = new Tag();
        tag.setTagname(name);
        tag.setTagcontext(context);
        tag.setTagid(Integer.parseInt(id));
        Map<String,Object> map = new HashMap<>();
        if (tagService.updateTag(tag)){
            map.put("stateCode",1);
            map.put("msg","修改成功");
            return JSON.toJSONString(map);
        }else {
            map.put("stateCode",0);
            map.put("msg","修改失败");
            return JSON.toJSONString(map);
        }
    }
}

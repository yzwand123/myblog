package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.VisitorService;
import cn.yzw.myblog.utils.IPUtil;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Visitor;
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
@RequestMapping("/visitor")
public class VisitorController {

    @Resource(name = "visitorService")
    private VisitorService visitorService;

    @RequestMapping("/visitorList")
    public String visitorList(HttpServletRequest request, Model model){
        String pageCode = request.getParameter("pageCode");
        String pageSize = request.getParameter("pageSize");
        PageUtil<Visitor> visitorPageUtil = visitorService.findByPage(pageCode,pageSize);
        model.addAttribute("visitors",visitorPageUtil);
        return "admin/visitor/visitorlist";
    }

    @RequestMapping("/deleteVisitor")
    @ResponseBody
    public String deleteVisitor(HttpServletRequest request){
        String id = request.getParameter("id");
        Map<String,Object> map = new HashMap<>();
        if (id == null || "".equals(id)){
            map.put("stateCode",0);
            map.put("msg","删除失败,id不能为空！");
            return JSON.toJSONString(map);
        }
        if (visitorService.deleteVisitor(Integer.parseInt(id))){
            map.put("stateCode","1");
            map.put("msg","删除成功！");
            return JSON.toJSONString(map);
        }else {
            map.put("stateCode",0);
            map.put("msg","删除失败！");
            return JSON.toJSONString(map);
        }
    }

    @RequestMapping("/deleteVisitors")
    public String deleteVisitors(HttpServletRequest request){
        String[] visitorIds = request.getParameterValues("visitorId");
        Set<Integer> ids = new HashSet<>();
        if (visitorIds != null){
            for (String visitorId : visitorIds) {
                ids.add(Integer.parseInt(visitorId));
            }
        }
        visitorService.deleteVisitors(ids);
        return "redirect:visitorList";
    }

}

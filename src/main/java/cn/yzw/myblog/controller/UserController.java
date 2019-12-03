package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.FansService;
import cn.yzw.myblog.service.ThUpService;
import cn.yzw.myblog.service.UserService;
import cn.yzw.myblog.utils.MD5Util;
import cn.yzw.myblog.vo.Fans;
import cn.yzw.myblog.vo.ThUp;
import cn.yzw.myblog.vo.User;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource(name = "fansService")
    private FansService fansService;

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "thUpService")
    private ThUpService thUpService;

    @RequestMapping("/admin")
    public String admin(){

        return "admin/admin";

    }

    @RequestMapping("/showRegister")
    public String showRegister(){

        return "user/register";

    }

    @RequestMapping("/showLogin")
    public String showLogin(){
        return "user/login";
    }

    @RequestMapping("/Login")
    public String Login(HttpServletRequest request,Model model){
        //1.获取前端传过来的用户名和密码
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        //2.通过用户名查找用户
        User user = userService.findByUserName(name);
        //如果用户名为空，则返回登录页面，并返回错误信息
        if (user == null){
            model.addAttribute("msg","没有找到该用户");
            return "user/login";
        }else {
            //如果用户名不为空，开始验证密码
            //将密码转换(为MD5密文
            String mdPassword = MD5Util.strToMD5(password);
            //密码验证成功，跳转首页
            if (user.getPassword().equals(mdPassword)){
                request.getSession().setAttribute("user",user);
                return "redirect:/";
            }else {
                //密码验证失败，跳转登录页，返回错误信息
                return "user/login";
            }
        }


    }


    @RequestMapping("/ShowSendLetter")
    public String showSendLetter(HttpServletRequest request){

        return "user/letter";
    }

    @ResponseBody
    @RequestMapping("/addFans")
    public String addFans(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        Map<String,Object> map = new HashMap<>();

        if (user == null){
            map.put("stateCode",0);
            map.put("msg","您还没有登录哦！");
            return JSON.toJSONString(map);
        }

        if (user.getRoleid() == 2){
            map.put("stateCode",0);
            map.put("msg","您不可以关注自己哦！");
            return JSON.toJSONString(map);
        }
        Fans fans = new Fans();
        fans.setBoId(1);
        fans.setFanId(user.getId());
        fans.setNickname(user.getNickname());
        fans.setEmail(user.getEmail());
        fans.setUserName(user.getUsername());

         if (fansService.saveFans(fans)) {
            map.put("stateCode",1);
            map.put("msg","关注成功！");
            JSON.toJSONString(map);
        }else {
             map.put("stateCode",0);
             map.put("msg","关注失败！");
         }
        return JSON.toJSONString(map);
    }


    @ResponseBody
    @RequestMapping("/userSignUp")
    public String userSignUp(HttpServletRequest request){
       User user = (User) request.getSession().getAttribute("user");
       Map<String,Object> map = new HashMap<>();
       if(user == null){
           map.put("stateCode",0);
           map.put("msg","请先登录");
           return JSON.toJSONString(map);
       }
       String arid = request.getParameter("arid");
        ThUp thUp = new ThUp();
        thUp.setBoId(1);
        thUp.setUId(user.getId());
        thUp.setArId(Integer.parseInt(arid));
        if (thUpService.saveThUp(thUp)) {
            map.put("stateCode",1);
            map.put("msg","成功");
            return JSON.toJSONString(map);
        } else {
            map.put("stateCode",0);
            map.put("msg","失败");
            return JSON.toJSONString(map);
        }

    }

    @ResponseBody
    @RequestMapping("/userSignDw")
    public String userSignDw(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        String arid = request.getParameter("arid");
        Map<String,Object> map = new HashMap<>();
        if(user == null){
            map.put("stateCode",0);
            map.put("msg","请先登录");
            return JSON.toJSONString(map);
        }
        if ( thUpService.deleteThUp(Integer.parseInt(arid),user.getId())) {
            map.put("stateCode",1);
            map.put("msg","成功");
            return JSON.toJSONString(map);
        } else {
            map.put("stateCode",0);
            map.put("msg","失败");
            return JSON.toJSONString(map);
        }
    }

}

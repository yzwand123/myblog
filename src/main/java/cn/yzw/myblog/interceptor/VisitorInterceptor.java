package cn.yzw.myblog.interceptor;

import cn.yzw.myblog.service.VisitorService;
import cn.yzw.myblog.utils.IPUtil;
import cn.yzw.myblog.utils.LocationUtil;
import cn.yzw.myblog.vo.User;
import cn.yzw.myblog.vo.Visitor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class VisitorInterceptor implements HandlerInterceptor {

    @Resource(name = "visitorService")
    private VisitorService visitorService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        Visitor visitor = new Visitor();
        if (user == null){
            visitor.setName("游客");
        }else{
            visitor.setName(user.getNickname());
        }
        String ip = IPUtil.getIpAddr(request);
        System.out.println(ip);
        visitor.setIp(ip);

        visitor.setLocation(LocationUtil.getLocation(visitor.getIp()));

        visitorService.saveVisitor(visitor);
        return true;

    }
}

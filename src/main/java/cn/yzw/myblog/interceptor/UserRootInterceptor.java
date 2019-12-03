package cn.yzw.myblog.interceptor;

import cn.yzw.myblog.vo.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class UserRootInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

       User user = (User)request.getSession().getAttribute("user");
      if (user == null) {
          response.sendRedirect(request.getContextPath()+"/user/showLogin");
          return false;
      }
      return true;
    }
}

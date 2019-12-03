package cn.yzw.myblog.controller;

import cn.yzw.myblog.service.CommentService;
import cn.yzw.myblog.service.SensitiveWordService;
import cn.yzw.myblog.vo.Comment;
import cn.yzw.myblog.vo.User;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Resource(name = "commentService")
    private CommentService commentService;

    @Resource(name = "sensitiveWordService")
    private SensitiveWordService sensitiveWordService;

    @ResponseBody
    @RequestMapping("/userComment")
    public String userComment(HttpServletRequest request){
        //1.获取页面传输数据
        User user = (User) request.getSession().getAttribute("user");
        String arid = request.getParameter("arid");
        String commentContext = null;
        commentContext = request.getParameter("commentContext");
        //2.敏感词过滤
        commentContext = sensitiveWordService.removeSensitiveWord(commentContext);
        //3.封装comment实体类
        Comment comment = new Comment();
        comment.setCommentBoId(1);
        comment.setCommentUId(user.getId());
        comment.setCommentContext(commentContext);
        comment.setNickName(user.getNickname());
        comment.setCommentArId(Integer.parseInt(arid));

        Map<String,Object> map = new HashMap<>();
        //4.保存评论
        if (commentService.saveComment(comment)){
            map.put("stateCode",1);
            map.put("msg","操作成功！");
            map.put("comment",comment);
            return JSON.toJSONString(map);
        }else {
            map.put("stateCode",0);
            map.put("msg","操作失败！");
            return JSON.toJSONString(map);
        }
    }

    @ResponseBody
    @RequestMapping("/deleteComment")
    public String deleteComment(HttpServletRequest request){
        String id = request.getParameter("id");
        Map<String,Object> map = new HashMap<>();
        if (commentService.deleteComment(Integer.parseInt(id))){
            map.put("stateCode",1);
            map.put("msg","操作成功！");
            return JSON.toJSONString(map);
        }else {
            map.put("stateCode",0);
            map.put("msg","操作失败！");
            return JSON.toJSONString(map);
        }
    }
}

package cn.yzw.myblog.service;

import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Comment;

import java.util.List;

public interface CommentService {

    /**
     * 查询每篇文章下的评论
     * @param id 文章id
     * @return
     */
    List<Comment> findCommentByArticleId(Integer id);

    /**
     *  用户发表评论
     * @param comment
     * @return
     */
    boolean saveComment(Comment comment);

    /**
     *  删除评论
     * @param id
     * @return
     */
    boolean deleteComment(Integer id);

    /**
     *  分页查询
     * @param pageCode
     * @param pageSize
     * @return
     */
    PageUtil<Comment> findByPage(String pageCode,String pageSize);


}

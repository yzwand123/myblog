package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CommentDao {

    List<Comment> findCommentByArticleId(Integer id);

    int saveComment(Comment comment);

    int deleteComment(Integer id);

    List<Comment> findByPage(@Param("start")Integer start,@Param("rows")Integer rows);

    int findAllCount(Integer id);
}

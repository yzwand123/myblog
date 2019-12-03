package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.CommentDao;
import cn.yzw.myblog.service.CommentService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Comment;
import cn.yzw.myblog.vo.Fans;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> findCommentByArticleId(Integer id) {

        return commentDao.findCommentByArticleId(id);
    }

    @Override
    public boolean saveComment(Comment comment) {

        try {
            return commentDao.saveComment(comment) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean deleteComment(Integer id) {
        return commentDao.deleteComment(id) > 0;
    }

    @Override
    public PageUtil<Comment> findByPage(String pageCode, String pageSize) {
        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "10";
        }
        PageUtil<Comment> pageUtil = new PageUtil<Comment>();
        Map<String,Object> map = new HashMap<>();
        Integer totalCount = commentDao.findAllCount(1);

        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);

        Integer totalPages = totalCount / Integer.parseInt(pageSize) + 1;


        List<Comment> comments = commentDao.findByPage(start,Integer.parseInt(pageSize));

        pageUtil.setData(comments);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(totalCount);
        pageUtil.setTotalPages(totalPages);

        return pageUtil;
    }
}

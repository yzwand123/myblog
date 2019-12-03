package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TagDao {

    List<Tag> findAll();

    int updateTag(Tag tag);

    int deleteTag(Integer id);

    int saveTag(Tag tag);

    Tag findById(Integer id);

    List<Tag> findByPage(Map<String,Object> map);

    Integer findAllCount();

    List<Map<String,Object>> findTagCount();

    int saveTagOfArticle(@Param("arid") Integer arid,@Param("tagId") Integer tagId);
}

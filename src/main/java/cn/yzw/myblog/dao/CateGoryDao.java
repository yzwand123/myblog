package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.CateGory;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CateGoryDao {

    List<CateGory> findAll();

    int deleteCateGory(Integer id);

    int saveCateGory(CateGory cateGory);

    int updateCateGory(CateGory cateGory);

    List<CateGory> findByPage(Map<String,Object> map);

    CateGory findById(Integer id);

    Integer findAllCount();

    List<Map<String,Object>> findCategoryCount();

    int saveCategoryOfArticle(@Param("arid") Integer arid,@Param("caid") Integer caid);
}

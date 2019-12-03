package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.ThUp;
import org.apache.ibatis.annotations.Param;

public interface ThUpDao {

    int findAllCount(Integer id);

    int saveThUp(ThUp thUp);


    int deleteThUP(@Param("aid") Integer aid, @Param("uid") Integer uid);
}

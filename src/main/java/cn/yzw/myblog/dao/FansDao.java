package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.Fans;

import java.util.List;
import java.util.Map;

public interface FansDao {

    List<Fans> findByPage(Map<String,Object> map);

    int saveFans(Fans fans);

    int deleteFans(Integer id);

    int findFansCount(Integer id);

    Fans findByUserId(Integer uid);
}

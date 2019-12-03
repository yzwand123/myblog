package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.User;

import java.util.List;
import java.util.Map;

public interface UserDao {

    User findById(Integer id);

    int saveUser(User user);

    User findByUserName(String name);


    List<Map<String,Object>> findRankingList();
}

package cn.yzw.myblog.service;

import cn.yzw.myblog.vo.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    User findById(Integer id);

    boolean saveUser(User user);

    List<Map<String, Object>> findRankingList();

    User findByUserName(String name);
}

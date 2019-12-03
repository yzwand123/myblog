package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.UserDao;
import cn.yzw.myblog.service.UserService;
import cn.yzw.myblog.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public boolean saveUser(User user) {
        try {
            return userDao.saveUser(user) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Map<String, Object>> findRankingList() {
        return userDao.findRankingList();
    }

    @Override
    public User findByUserName(String name) {
        return userDao.findByUserName(name);
    }
}

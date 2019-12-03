package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.ThUpDao;
import cn.yzw.myblog.service.ThUpService;
import cn.yzw.myblog.vo.ThUp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("thUpService")
public class ThUpServiceImpl implements ThUpService {

    @Autowired
    private ThUpDao thUpDao;

    @Override
    public int findAllCount(Integer id) {
        return thUpDao.findAllCount(id);
    }

    @Override
    public boolean saveThUp(ThUp thUp) {
        try {
           return thUpDao.saveThUp(thUp) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean deleteThUp(Integer aid, Integer uid) {
        return thUpDao.deleteThUP(aid,uid) > 0;
    }
}

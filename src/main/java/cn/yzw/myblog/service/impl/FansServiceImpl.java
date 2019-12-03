package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.FansDao;
import cn.yzw.myblog.service.FansService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Fans;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service("fansService")
public class FansServiceImpl implements FansService {

    @Autowired
    private FansDao fansDao;


    @Override
    public boolean saveFans(Fans fans) {

        try {
            return fansDao.saveFans(fans) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteFans(Integer id) {
        return fansDao.deleteFans(id) > 0;
    }

    @Override
    public PageUtil<Fans> findByPage(String pageCode, String pageSize) {
        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "7";
        }
        PageUtil<Fans> pageUtil = new PageUtil<Fans>();
        Map<String,Object> map = new HashMap<>();
        Integer totalCount = fansDao.findFansCount(1);

        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);

        Integer totalPages = totalCount / Integer.parseInt(pageSize) + 1;

        map.put("start",start);
        map.put("rows",Integer.parseInt(pageSize));
        map.put("boid",1);

        List<Fans> fans = fansDao.findByPage(map);

        pageUtil.setData(fans);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(totalCount);
        pageUtil.setTotalPages(totalPages);

        return pageUtil;
    }

    @Override
    public boolean deleteFans(Set<Integer> ids) {
        int count = 0;
        if (ids.isEmpty()) return false;
        else {
            for (Integer id : ids) {
                if (deleteFans(id)){count++;}
            }
        }
        return count == ids.size();
    }


    @Override
    public int findFansCount(Integer id) {
        return fansDao.findFansCount(id);
    }
}

package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.VisitorDao;
import cn.yzw.myblog.service.VisitorService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Visitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service("visitorService")
public class VisitorServiceImpl implements VisitorService {

    @Autowired
    private VisitorDao visitorDao;

    @Override
    public PageUtil<Visitor> findByPage(String pageCode, String pageSize) {
        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "15";
        }
        PageUtil<Visitor> pageUtil = new PageUtil<Visitor>();
        Map<String,Object> map = new HashMap<>();
        Integer totalCount = visitorDao.findAllCount();

        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);

        Integer totalPages = totalCount / Integer.parseInt(pageSize) + 1;

        map.put("start",start);
        map.put("rows",Integer.parseInt(pageSize));

        List<Visitor> visitors = visitorDao.findByPage(map);

        pageUtil.setData(visitors);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(totalCount);
        pageUtil.setTotalPages(totalPages);

        return pageUtil;
    }

    @Override
    public boolean saveVisitor(Visitor visitor) {
        try {
            return visitorDao.saveVisitor(visitor) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteVisitor(Integer id) {

        return visitorDao.deleteVisitor(id) > 0;
    }

    @Override
    public boolean deleteVisitors(Set<Integer> ids) {
        int flag = 0;
        if (ids.isEmpty()) return false;
        else {
            for (Integer id : ids) {
                if (deleteVisitor(id)) {flag++;}
            }
            return flag == ids.size();
        }

    }

    @Override
    public Integer findTodayCount() {
        return visitorDao.findTodayCount();
    }

    @Override
    public List<Map<String, Object>> findWeekCount() {
        return visitorDao.findWeekCount();
    }

    @Override
    public Integer findAllCount() {
        return visitorDao.findAllCount();
    }
}

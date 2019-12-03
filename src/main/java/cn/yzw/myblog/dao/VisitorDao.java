package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.Visitor;

import java.util.List;
import java.util.Map;

public interface VisitorDao {

    List<Visitor> findByPage(Map<String,Object> map);

    int deleteVisitor(Integer id);

    int saveVisitor(Visitor visitor);

    int findAllCount();

    Integer findTodayCount();

    List<Map<String,Object>> findWeekCount();
}

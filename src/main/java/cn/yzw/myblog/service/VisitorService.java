package cn.yzw.myblog.service;

import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Visitor;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface VisitorService {
    /**
     *  分页查询访客信息
     * @param pageCode 当前页码
     * @param PageSize 每页数数
     * @return 返回分页数据
     */
    PageUtil<Visitor> findByPage(String pageCode,String PageSize);

    /**
     * 向数据库保存一条访客记录
     * @param visitor 要保存的访客记录
     * @return 保存成功返回true，失败返回false
     */
    boolean saveVisitor(Visitor visitor);

    /**
     *  删除访客记录
     * @param id 要删除的访客记录id
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteVisitor(Integer id);

    /**
     * 批量删除访客记录
     * @param ids 要删除的访客记录id的set集合
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteVisitors(Set<Integer> ids);

    Integer findTodayCount();

    List<Map<String,Object>> findWeekCount();

    Integer findAllCount();
}

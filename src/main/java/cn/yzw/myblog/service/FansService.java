package cn.yzw.myblog.service;

import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Fans;

import java.util.Set;

public interface FansService{

    boolean saveFans(Fans fans);

    boolean deleteFans(Integer id);

    PageUtil<Fans> findByPage(String pageCode,String pageSize);

    boolean deleteFans(Set<Integer> ids);

    int findFansCount(Integer id);
}

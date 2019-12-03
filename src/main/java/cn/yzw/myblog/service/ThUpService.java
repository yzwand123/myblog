package cn.yzw.myblog.service;

import cn.yzw.myblog.vo.ThUp;

public interface ThUpService {

    int findAllCount(Integer id);

    boolean saveThUp(ThUp thUp);

    boolean deleteThUp(Integer aid,Integer uid);
}

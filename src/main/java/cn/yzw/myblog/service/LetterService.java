package cn.yzw.myblog.service;

import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Letter;

public interface LetterService {

    PageUtil<Letter> findByPage(String pageCode,String PageSize,Integer state);

    boolean saveLetter(Letter letter);

    boolean deleteLetter(Integer id);

    int findAllCount();
}

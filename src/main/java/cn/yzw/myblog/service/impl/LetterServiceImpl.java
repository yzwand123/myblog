package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.LetterDao;
import cn.yzw.myblog.service.LetterService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Letter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("letterService")
public class LetterServiceImpl implements LetterService {

    @Autowired
    private LetterDao letterDao;


    @Override
    public boolean saveLetter(Letter letter) {
        try {
            return letterDao.saveLetter(letter) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean deleteLetter(Integer id) {
        return letterDao.deleteLetter(id) > 0;
    }

    @Override
    public PageUtil<Letter> findByPage(String pageCode, String pageSize, Integer state) {
        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "7";
        }
        PageUtil<Letter> pageUtil = new PageUtil<Letter>();

        Integer totalCount = findAllCount();

        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);

        Integer totalPages = totalCount / Integer.parseInt(pageSize) + 1;


        List<Letter> letters = letterDao.findByPage(start,Integer.parseInt(pageSize),state);

        pageUtil.setData(letters);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(totalCount);
        pageUtil.setTotalPages(totalPages);

        return pageUtil;
    }

    @Override
    public int findAllCount() {
        return letterDao.findAllCount();
    }
}

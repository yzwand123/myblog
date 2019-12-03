package cn.yzw.myblog.service.impl;


import cn.yzw.myblog.dao.CateGoryDao;
import cn.yzw.myblog.service.CategoryService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.CateGory;
import cn.yzw.myblog.vo.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CateGoryDao cateGoryDao;

    @Override
    public List<CateGory> findAll() {
        return cateGoryDao.findAll();
    }

    @Override
    public CateGory findById(Integer id) {
        return cateGoryDao.findById(id);
    }

    @Override
    public boolean deleteCateGory(Integer id) {
        return cateGoryDao.deleteCateGory(id) > 0;
    }

    @Override
    public boolean updateCateGory(CateGory cateGory) {
        return cateGoryDao.updateCateGory(cateGory) > 0;
    }

    @Override
    public boolean saveCateGory(CateGory cateGory) {

        try {
            return cateGoryDao.saveCateGory(cateGory) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean deleteCateGorys(Set<Integer> ids) {
        int count = 0;
        if (ids.isEmpty()) return false;
       else {
            for (Integer id : ids) {
                if (deleteCateGory(id)){count ++;}
            }
        }
       return count == ids.size();
    }

    @Override
    public PageUtil<CateGory> findByPage(String pageCode, String pageSize) {
        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "7";
        }
        PageUtil<CateGory> pageUtil = new PageUtil<CateGory>();
        Map<String,Object> map = new HashMap<>();
        Integer totalCount = cateGoryDao.findAllCount();

        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);

        Integer totalPages = totalCount / Integer.parseInt(pageSize) + 1;

        map.put("start",start);
        map.put("rows",Integer.parseInt(pageSize));

        List<CateGory> cateGories = cateGoryDao.findByPage(map);

        pageUtil.setData(cateGories);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(totalCount);
        pageUtil.setTotalPages(totalPages);

        return pageUtil;

    }

    @Override
    public List<Map<String, Object>> findCategoryCount() {
        return cateGoryDao.findCategoryCount();
    }

    @Override
    public boolean saveCategoryOfArticle(Integer arid, Integer caid) {
        try {
            return cateGoryDao.saveCategoryOfArticle(arid, caid) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}

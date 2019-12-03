package cn.yzw.myblog.service.impl;

import cn.yzw.myblog.dao.TagDao;
import cn.yzw.myblog.service.TagService;
import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service("tagService")
public class TagServiceImpl implements TagService {

    @Autowired
    private TagDao tagDao;

    @Override
    public List<Tag> findAll() {
        return tagDao.findAll();
    }

    @Override
    public boolean updateTag(Tag tag) {

        return tagDao.updateTag(tag) > 0;
    }

    @Override
    public boolean deleteTag(Integer id) {

        return tagDao.deleteTag(id) > 0;
    }

    @Override
    public boolean saveTag(Tag tag) {
        try {
            return tagDao.saveTag(tag) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteTags(Set<Integer> ids) {
        int count = 0;
        if (ids.isEmpty()) return false;
        else {
            for (Integer id : ids) {
                if (deleteTag(id)){ count ++;}
            }
        }
       return count == ids.size();
    }

    @Override
    public Tag findById(Integer id) {
        return tagDao.findById(id);
    }

    @Override
    public PageUtil<Tag> findByPage(String pageCode, String pageSize) {

        if (pageCode == null || "".equals(pageCode)){
            pageCode = "1";
        }
        if (pageSize == null || "".equals(pageSize)){
            pageSize = "7";
        }
        PageUtil<Tag> pageUtil = new PageUtil<Tag>();
        Map<String,Object> map = new HashMap<>();
        Integer totalCount = tagDao.findAllCount();

        Integer start = (Integer.parseInt(pageCode) - 1) * Integer.parseInt(pageSize);

        Integer totalPages = totalCount / Integer.parseInt(pageSize) + 1;

        map.put("start",start);
        map.put("rows",Integer.parseInt(pageSize));

        List<Tag> tags = tagDao.findByPage(map);

        pageUtil.setData(tags);
        pageUtil.setPageCode(Integer.parseInt(pageCode));
        pageUtil.setPageSize(Integer.parseInt(pageSize));
        pageUtil.setTotalCount(totalCount);
        pageUtil.setTotalPages(totalPages);

        return pageUtil;
    }

    @Override
    public List<Map<String, Object>> findTagCount() {
        return tagDao.findTagCount();
    }

    @Override
    public boolean saveTagOfArticle(Integer arid, Integer tagId) {
        try {
            return tagDao.saveTagOfArticle(arid,tagId) > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}

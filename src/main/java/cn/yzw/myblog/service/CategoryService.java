package cn.yzw.myblog.service;

import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.CateGory;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface CategoryService {
    /**
     * 查询所有随笔类型
     * @return 返回随笔类型集合
     */
    List<CateGory> findAll();

    /**
     * 根据id查询随笔类型
     * @param id 要查询的随笔类型id
     * @return 返回查询到的随笔类型
     */
    CateGory findById(Integer id);

    /**
     * 根据id删除随笔类型
     * @param id 要删除的随笔类型id
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteCateGory(Integer id);

    /**
     * 根据id修改随笔类型
     * @param cateGory 要修改的随笔类型
     * @return 修改成功返回true，失败返回false
     */
    boolean updateCateGory(CateGory cateGory);

    /**
     * 保存随笔类型
     * @param cateGory 要保存的随笔类型
     * @return 保存成功返回true，失败返回false
     */
    boolean saveCateGory(CateGory cateGory);

    /**
     * 批量删除随笔类型
     * @param ids 要删除的随笔类型id集合
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteCateGorys(Set<Integer> ids);

    /**
     *  分页查询随笔类型
     * @param pageCode 当前页码
     * @param pageSize 每页数据数
     * @return 返回分页数据
     */
    PageUtil<CateGory> findByPage(String pageCode,String pageSize);

    /**
     *  查询分类下的文章数
     * @return 返回各个分类下的文章数
     */
    List<Map<String,Object>> findCategoryCount();

    boolean saveCategoryOfArticle(Integer arid,Integer caid);


}

package cn.yzw.myblog.service;

import cn.yzw.myblog.utils.PageUtil;
import cn.yzw.myblog.vo.Tag;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface TagService {

    /**
     * 查询所有标签
     * @return 返回tag集合
     */
    List<Tag> findAll();

    /**
     * 修改tag标签信息
     * @param tag 要修改的标签信息
     * @return 修改成功返回true，失败返回false
     */
    boolean updateTag(Tag tag);

    /**
     * 根据id删除tag标签
     * @param id 要删除tag的id
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteTag(Integer id);

    /**
     * 新增tag标签
     * @param tag 要新增加的tag标签
     * @return 增加成功返回true，失败返回false
     */
    boolean saveTag(Tag tag);

    /**
     * 根据id批量删除tag标签
     * @param ids 要删除的tag的id集合
     * @return 删除成功返回true，失败返回false
     */
    boolean deleteTags(Set<Integer> ids);

    /**
     * 根据id查询tag标签
     * @param id 要查询的tag标签id
     * @return 返回对应id的tag标签
     */
    Tag findById(Integer id);

    /**
     * 分页查询tag标签
     * @param pageCode 当前页码
     * @param pageSize 每页数据数
     * @return 返回分页数据
     */
    PageUtil<Tag> findByPage(String pageCode,String pageSize);

    /**
     * 查询标签下的文章数
     * @return 返回标签名与对应的文章数
     */
    List<Map<String,Object>> findTagCount();

    boolean saveTagOfArticle(Integer arid,Integer tagId);

}

package cn.yzw.myblog.dao;

import cn.yzw.myblog.vo.Letter;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LetterDao {

    List<Letter> findByPage(@Param("start") Integer start, @Param("rows") Integer rows,@Param("state") Integer state);

    int saveLetter(Letter letter);

    int deleteLetter(int id);

    int findAllCount();
}

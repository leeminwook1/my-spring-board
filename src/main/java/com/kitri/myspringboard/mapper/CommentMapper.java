package com.kitri.myspringboard.mapper;

import com.kitri.myspringboard.domain.Board;
import com.kitri.myspringboard.domain.Comment;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface CommentMapper {
    @Insert("INSERT INTO comment(content, username, board_id) VALUES(#{content}, #{username}, #{boardId})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insertComment(Comment comment);

    @Select("SELECT * FROM Comment WHERE board_id = #{boardId}")
    List <Comment> findById(long boardId);

    @Delete("DELETE FROM Comment WHERE id = #{id}")
    void delete(long id);

}

package com.kitri.myspringboard.mapper;

import com.kitri.myspringboard.domain.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Select("SELECT * FROM board WHERE id = #{id}")
    Board findById(long id);

    @Insert("INSERT INTO board(title, content, username) VALUES (#{title}, #{content}, #{username})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(Board board);

    @Update("UPDATE board SET title=#{title}, content=#{content}, username=#{username} WHERE id = #{id}")
    void update(Board board);

    @Delete("DELETE FROM board WHERE id = #{id}")
    void delete(long id);

    @Select("<script>" +
            "SELECT * FROM board" +
            "<where>" +
            "<if test='search != null and search != \"\"'>" +
            "AND (title LIKE CONCAT('%', #{search}, '%') OR username LIKE CONCAT('%', #{search}, '%'))" +
            "</if>" +
            "</where>" +
            "LIMIT #{offset}, #{pageSize}" +
            "</script>")
    List<Board> findAll(@Param("offset") int offset, @Param("pageSize") int pageSize, @Param("search") String search);

    @Select("<script>" +
            "SELECT COUNT(*) FROM board" +
            "<where>" +
            "<if test='search != null and search != \"\"'>" +
            "AND (title LIKE CONCAT('%', #{search}, '%') OR username LIKE CONCAT('%', #{search}, '%'))" +
            "</if>" +
            "</where>" +
            "</script>")
    int countBoards(@Param("search") String search);
}


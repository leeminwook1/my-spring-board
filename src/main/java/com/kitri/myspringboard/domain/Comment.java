package com.kitri.myspringboard.domain;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class Comment {
    private long id;
    private String content;
    private String username;
    private long boardId;
    private LocalDateTime created_at;
}

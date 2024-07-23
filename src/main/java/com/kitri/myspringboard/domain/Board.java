package com.kitri.myspringboard.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Board {
    private long id;
    private String title;
    private String content;
    private String username;
    private LocalDateTime createdAt;


}

package com.kitri.myspringboard.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
    private Long id;
    private String username;
    private String password;
    private String passwordConfirm;
    private boolean enabled = true;
}

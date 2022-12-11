package com.ute.newspaper.beans;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class User {
    private int id;
    private String username;
    private String password;
    private String name;
    private String email;
    private Date birthday;
    private String penname;
    private Date createDate;
    private Date updateDate;
    private Date expr;
    private String permission;
    private boolean enable;
}

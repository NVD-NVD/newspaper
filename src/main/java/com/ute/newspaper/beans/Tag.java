package com.ute.newspaper.beans;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Tag {
    private int id;
    private String title;
    private Date createDate;
    private Date updateDate;
    private boolean enable;
}

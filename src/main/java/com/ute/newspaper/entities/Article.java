package com.ute.newspaper.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class Article {
    private int id;
    private String title;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private String abstract_content;
    private String content;
    private String avatar;
    private String status;
    private String type;
    private int author_id;
    private int view;
    private boolean enable;
}

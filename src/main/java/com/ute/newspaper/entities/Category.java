package com.ute.newspaper.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Category {
    private int id;
    private String title;
    private LocalDateTime createDate;
    private LocalDateTime updateDate;
    private boolean enable;
}

package com.ute.newspaper.beans;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Article_Category {
    private int id;
    private int articles_id;
    private int categories_id;

}

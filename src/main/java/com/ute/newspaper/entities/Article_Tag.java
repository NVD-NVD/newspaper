package com.ute.newspaper.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Article_Tag {
    private int id;
    private int articles_id;
    private int tags_id;

}

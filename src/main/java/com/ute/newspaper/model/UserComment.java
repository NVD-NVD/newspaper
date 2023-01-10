package com.ute.newspaper.model;

import com.ute.newspaper.entities.Comment;
import com.ute.newspaper.entities.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserComment {
    private int id;
    private String username;
    private String avatar;
    private Comment comment;
}

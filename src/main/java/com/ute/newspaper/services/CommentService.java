package com.ute.newspaper.services;

import com.ute.newspaper.dao.CommentDao;
import com.ute.newspaper.dao.UserDAO;
import com.ute.newspaper.entities.Comment;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.model.UserComment;

import java.util.ArrayList;
import java.util.List;

public class CommentService {
    public static List<Comment> findAll(){
        return CommentDao.findAll();
    }

    public static List<Comment> findCommentByArticleID(int id){
        List<Comment> comments = CommentDao.findCommentByArticleID(id);
        if (comments.size() == 0)
            return null;
        return comments;
    }

}

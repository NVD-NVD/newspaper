package com.ute.newspaper.services;

import com.ute.newspaper.dao.CommentDao;
import com.ute.newspaper.dao.UserDAO;
import com.ute.newspaper.entities.Comment;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.model.UserComment;

import java.util.ArrayList;
import java.util.List;

public class UserCommentService {
    public static List<UserComment> getUserComments(int id){
        List<Comment> comments = CommentDao.findCommentByArticleID(id);
        List<UserComment> userComments = new ArrayList<>();
        for (Comment comment : comments){
            User user = UserDAO.findByID(comment.getUser_id());
            userComments.add(new UserComment(comment.getId(), user.getUsername(), user.getAvatar(), comment));
        }
        if (userComments.size() == 0)
            return null;
        return userComments;
    }
}

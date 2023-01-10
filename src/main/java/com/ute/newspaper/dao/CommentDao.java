package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.Category;
import com.ute.newspaper.entities.Comment;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class CommentDao {
    public static List<Comment> findAll(){
        String query = "SELECT * FROM comments";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(Comment.class);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static List<Comment> findCommentByArticleID(int article_id){
        String query = "SELECT * FROM comments WHERE article_id = :article_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Comment> list = con.createQuery(query)
                    .addParameter("article_id", article_id)
                    .executeAndFetch(Comment.class);

            if (list.size() == 0) {
                return null;
            }

            return list;
        }
    }
}

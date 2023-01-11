package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class ArticleDao {
    public static List<Article> findAll(){
        String query = "SELECT * FROM articles";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(Article.class);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static Article findByID(int id) {
        String query = "SELECT * FROM articles WHERE id = :id";
        try (Connection con = DbUtils.getConnection()) {
            List<Article> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(Article.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static List<Article> findAllByUserID(int author_id) {
        String query = "SELECT * FROM articles WHERE author_id = :author_id";
        try (Connection con = DbUtils.getConnection()) {
            List<Article> articles = con.createQuery(query)
                    .addParameter("author_id", author_id)
                    .executeAndFetch(Article.class);

            if (articles.size() == 0) {
                return null;
            }
            return articles;
        }
    }

    public static Article add(Article article){
        String query = "INSERT INTO articles (title, abstract_content, content , author_id, status, avatar, createDate, updateDate, enable)" +
                "VALUES (:title, :abstract_content, :content , :author_id, :status, :avatar, :createDate, :updateDate, :enable)";
        try (Connection con = DbUtils.getConnection()) {
            int key = con.createQuery(query)
                    .addParameter("title", article.getTitle())
                    .addParameter("abstract_content", article.getAbstract_content())
                    .addParameter("content", article.getContent())
                    .addParameter("author_id", article.getAuthor_id())
                    .addParameter("status", article.getStatus())
                    .addParameter("avatar", article.getAvatar())
                    .addParameter("createDate", article.getCreateDate())
                    .addParameter("updateDate", article.getUpdateDate())
                    .addParameter("enable", article.isEnable())
                    .executeUpdate()
                    .getKey(Integer.class);

            Article a = findByID(key);
            return a;
        }
    }

}

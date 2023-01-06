package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Article;
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

    public static void add(Article article){
        String query = "INSERT INTO articles (title, createDate, updateDate, enable)" +
                "VALUES (:title, :createDate, :updateDate, :enable)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("title", article.getTitle())
                    .addParameter("createDate", article.getCreateDate())
                    .addParameter("updateDate", article.getUpdateDate())
                    .addParameter("enable", article.isEnable())
                    .executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
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
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
}

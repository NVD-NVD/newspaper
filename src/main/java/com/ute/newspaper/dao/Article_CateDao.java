package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Article_Category;
import com.ute.newspaper.entities.Category;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class Article_CateDao {
    public static List<Article_Category> findAll(){
        String query = "SELECT * FROM articles_categories";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(Article_Category.class);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static void add(Article_Category articleCategory){
        String query = "INSERT INTO articles_categories (article_id, category_id)" +
                "VALUES (:article_id, :category_id)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("article_id", articleCategory.getArticle_id())
                    .addParameter("category_id", articleCategory.getCategory_id())
                    .executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}

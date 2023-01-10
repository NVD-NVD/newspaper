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
}

package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.Editor_Category;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class EditorCategoryDao {
    public static List<Editor_Category> findAll(){
        String query = "SELECT * FROM editor_category";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(Editor_Category.class);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}

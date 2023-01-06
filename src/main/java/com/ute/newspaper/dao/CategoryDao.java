package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Category;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class CategoryDao {
    public static List<Category> findAll(){
        String query = "SELECT * FROM categories";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(Category.class);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    public static void add(Category category){
        String query = "INSERT INTO categories (title, createDate, updateDate, enable)" +
                "VALUES (:title, :createDate, :updateDate, :enable)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("title", category.getTitle())
                    .addParameter("createDate", category.getCreateDate())
                    .addParameter("updateDate", category.getUpdateDate())
                    .addParameter("enable", category.isEnable())
                    .executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}

package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Article;
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

    public static Category findByID(int id){
        String query = "SELECT * FROM categories WHERE id =:id";
        try (Connection con = DbUtils.getConnection()) {
            List<Category> list = con.createQuery(query)
                    .addParameter("id", id)
                    .executeAndFetch(Category.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
    public static void add(Category category){
        String query = "INSERT INTO categories (title, createDate, updateDate, parentID, enable)" +
                "VALUES (:title, :createDate, :updateDate, :parentID, :enable)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("title", category.getTitle())
                    .addParameter("createDate", category.getCreateDate())
                    .addParameter("updateDate", category.getUpdateDate())
                    .addParameter("parentID", category.getParentID())
                    .addParameter("enable", category.isEnable())
                    .executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}

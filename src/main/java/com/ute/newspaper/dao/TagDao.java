package com.ute.newspaper.dao;

import com.ute.newspaper.entities.Tag;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class TagDao {
    public static List<Tag> findAll(){
        String query = "SELECT * FROM tags";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(Tag.class);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }

    public static void add(Tag tag){
        String query = "INSERT INTO tags (title, createDate, updateDate, enable)" +
                "VALUES (:title, :createDate, :updateDate, :enable)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("title", tag.getTitle())
                    .addParameter("createDate", tag.getCreateDate())
                    .addParameter("updateDate", tag.getUpdateDate())
                    .addParameter("enable", tag.isEnable())
                    .executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}

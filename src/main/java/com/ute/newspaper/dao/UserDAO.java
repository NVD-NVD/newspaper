package com.ute.newspaper.dao;

import com.ute.newspaper.entities.User;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserDAO {
    public static List<User> findAll(){
        String query = "SELECT * FROM users";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(User.class);
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static void add(User user){
        String query = "INSERT INTO users (username, password, name, email, birthday, penname, avatar, createDate, updateDate, expr,\n" +
                "                             permission, enable)\n" +
                "VALUES (:username, :password, :name, :email, :birthday, :penname, :avatar, :createDate, :updateDate, :expr,\n" +
                "        :permission, :enable)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("birthday", user.getBirthday())
                    .addParameter("penname", user.getPenname())
                    .addParameter("avatar", user.getAvatar())
                    .addParameter("createDate", user.getCreateDate())
                    .addParameter("updateDate", user.getUpdateDate())
                    .addParameter("expr", user.getExpr())
                    .addParameter("permission", user.getPermission())
                    .addParameter("enable", user.isEnable())
                    .executeUpdate();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public static User findByUsername(String username) {
        String query = "select * from users where username = :username";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("username", username)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }

    public static User findByEmail(String email) {
        String query = "select * from users where email = :email";
        try (Connection con = DbUtils.getConnection()) {
            List<User> list = con.createQuery(query)
                    .addParameter("email", email)
                    .executeAndFetch(User.class);

            if (list.size() == 0) {
                return null;
            }

            return list.get(0);
        }
    }
}

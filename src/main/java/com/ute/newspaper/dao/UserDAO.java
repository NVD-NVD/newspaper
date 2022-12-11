package com.ute.newspaper.dao;

import com.ute.newspaper.beans.User;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserDAO {
    public List<User> findAll(){
        String query = "SELECT * FROM users";
        try (Connection con = DbUtils.getConnection()) {
            return con.createQuery(query).executeAndFetch(User.class);
        }
    }
    public void add(User user){
        String query = "insert into newspaper.users (username, password, name, email, birthday, penname, createDate, updateDate, expr,\n" +
                "                             permission, enable)\n" +
                "values (:username, :password, :name, :email, :birthday, :penname, :createDate, :updateDate, :expr,\n" +
                "        :permission, :enable)";
        try (Connection con = DbUtils.getConnection()) {
            con.createQuery(query)
                    .addParameter("username", user.getUsername())
                    .addParameter("password", user.getPassword())
                    .addParameter("name", user.getName())
                    .addParameter("email", user.getEmail())
                    .addParameter("birthday", user.getBirthday())
                    .addParameter("penname", user.getPenname())
                    .addParameter("createDate", user.getCreateDate())
                    .addParameter("updateDate", user.getUpdateDate())
                    .addParameter("expr", user.getExpr())
                    .addParameter("permission", user.getPermission())
                    .addParameter("enable", user.isEnable())
                    .executeAndFetch(User.class);
        }
    }
}

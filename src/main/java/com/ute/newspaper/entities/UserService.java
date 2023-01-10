package com.ute.newspaper.entities;

import com.ute.newspaper.dao.UserDAO;
import com.ute.newspaper.utils.DbUtils;
import org.sql2o.Connection;

import java.util.List;

public class UserService {
    public static List<User> findAll(){
        return UserDAO.findAll();
    }
}

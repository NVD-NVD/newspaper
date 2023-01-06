package com.ute.newspaper.services;

import com.ute.newspaper.dao.CategoryDao;
import com.ute.newspaper.entities.Category;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDateTime;

public class CategoryService {
    public static void add(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        System.out.println("Add category:" + title);
        Category category = new Category();
        category.setTitle(title);
        LocalDateTime dateTime = LocalDateTime.now();
        category.setCreateDate(dateTime);
        category.setUpdateDate(dateTime);
        category.setEnable(true);
        CategoryDao.add(category);
        ServletUtils.redirect("/admin/managerCategory", req, resp);
    }
    public static void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException{

    }
}

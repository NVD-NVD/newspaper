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
    public static Category findByID(int id) {
        return CategoryDao.findByID(id);
    }

    public static void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        int parentID = Integer.parseInt(req.getParameter("parentID"));
        System.out.println("parentID: " + parentID);
        Category category = new Category();
        category.setTitle(title);
        LocalDateTime dateTime = LocalDateTime.now();
        category.setCreateDate(dateTime);
        category.setUpdateDate(dateTime);
        Category cate = findByID(parentID);
        System.out.println("CateID: " + cate.getId());
        if (cate != null)
            category.setParentID(cate.getId());
        else
            cate.setParentID(-1);
        category.setEnable(true);
        CategoryDao.add(category);
    }

    public static void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    }
}

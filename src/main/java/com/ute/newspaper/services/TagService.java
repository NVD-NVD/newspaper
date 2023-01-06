package com.ute.newspaper.services;

import com.ute.newspaper.dao.TagDao;
import com.ute.newspaper.entities.Tag;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

public class TagService {
    public void addTag(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        Tag tag = new Tag();
        tag.setTitle(title);
        LocalDateTime dateTime = LocalDateTime.now();
        tag.setCreateDate(dateTime);
        tag.setUpdateDate(dateTime);
        tag.setEnable(true);
        TagDao.add(tag);
        ServletUtils.redirect("/admin/managerTag", req, resp);
    }

    public void editTag(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

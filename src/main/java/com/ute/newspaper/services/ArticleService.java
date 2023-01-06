package com.ute.newspaper.services;

import com.ute.newspaper.dao.ArticleDao;
import com.ute.newspaper.dao.TagDao;
import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.Tag;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

public class ArticleService {
    public static List<Article> findAllByUserID(int authorID)  {
        List<Article> articles = ArticleDao.findAllByUserID(authorID);
        if (articles.size() == 0) {
            System.out.println("findAllByUserID is null");
            return null;
        }
        return articles;
    }

    public void findByID(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

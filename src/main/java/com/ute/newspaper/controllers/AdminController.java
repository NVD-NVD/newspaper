package com.ute.newspaper.controllers;

import com.ute.newspaper.dao.ArticleDao;
import com.ute.newspaper.dao.CategoryDao;
import com.ute.newspaper.dao.TagDao;
import com.ute.newspaper.dao.UserDAO;
import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.Category;
import com.ute.newspaper.entities.Tag;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.services.CategoryService;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "adminServlet", value = "/admin/*")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/managerArticle";
        }

        switch (path) {
            case "/index":
                List<User> users = UserDAO.findAll();
                if (users.size() > 0)
                    System.out.println("user size: " +users.size());
                req.setAttribute("users",users);
                ServletUtils.forward("/vwAdmin/pages/index.jsp", req, resp);
                break;

            case "/managerUser":
                List<User> users1 = UserDAO.findAll();
                req.setAttribute("users",users1);
                ServletUtils.forward("/vwAdmin/pages/managerUser.jsp", req, resp);
                break;

            case "/managerWriter":
                List<User> writers = UserDAO.findAll();
                req.setAttribute("users", writers);
                ServletUtils.forward("/vwAdmin/pages/managerWriter.jsp", req, resp);
                break;

            case "/managerEditor":
                List<User> editors = UserDAO.findAll();
                req.setAttribute("users", editors);
                ServletUtils.forward("/vwAdmin/pages/managerEditor.jsp", req, resp);
                break;

            case "/managerArticle":
                List<Article> articles = ArticleDao.findAll();
                req.setAttribute("articles", articles);
                ServletUtils.forward("/vwAdmin/pages/managerArticle.jsp", req, resp);
                break;

            case "/managerTag":
                List<Tag> tags = TagDao.findAll();
                req.setAttribute("tags", tags);
                ServletUtils.forward("/vwAdmin/pages/managerTag.jsp", req, resp);
                break;

            case "/managerCategory":
                List<Category> categories = CategoryDao.findAll();
                req.setAttribute("categories", categories);
                ServletUtils.forward("/vwAdmin/pages/managerCategory.jsp", req, resp);
                break;

            case "/managerSubAdmin":
                ServletUtils.forward("/vwAdmin/pages/managerSubAdmin.jsp", req, resp);
                break;

            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();

        switch (path) {
            case "/index":

                ServletUtils.forward("/vwAdmin/pages/index.jsp", req, resp);
                break;

            case "/managerUser":

                ServletUtils.forward("/vwAdmin/pages/managerUser.jsp", req, resp);
                break;

            case "/managerWriter":
                ServletUtils.forward("/vwAdmin/pages/managerWriter.jsp", req, resp);
                break;

            case "/managerEditor":
                ServletUtils.forward("/vwAdmin/pages/managerEditor.jsp", req, resp);
                break;

            case "/managerArticle":
                ServletUtils.forward("/vwAdmin/pages/managerArticle.jsp", req, resp);
                break;

            case "/managerTag":
                addTag(req, resp);
                break;

            case "/managerCategory":
                CategoryService.add(req, resp);
                break;

            case "/managerSubAdmin":
                ServletUtils.forward("/vwAdmin/pages/managerSubAdmin.jsp", req, resp);
                break;

            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        switch (path) {
            case "/index":

                ServletUtils.forward("/vwAdmin/pages/index.jsp", req, resp);
                break;

            case "/managerUser":

                ServletUtils.forward("/vwAdmin/pages/managerUser.jsp", req, resp);
                break;

            case "/managerWriter":
                ServletUtils.forward("/vwAdmin/pages/managerWriter.jsp", req, resp);
                break;

            case "/managerEditor":
                ServletUtils.forward("/vwAdmin/pages/managerEditor.jsp", req, resp);
                break;

            case "/managerArticle":
                ServletUtils.forward("/vwAdmin/pages/managerArticle.jsp", req, resp);
                break;

            case "/managerTag":
                editTag(req, resp);
                break;

            case "/managerCategory":
                CategoryService.add(req, resp);
                break;

            case "/managerSubAdmin":
                ServletUtils.forward("/vwAdmin/pages/managerSubAdmin.jsp", req, resp);
                break;

            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    private void addTag(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

    private void editTag(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}

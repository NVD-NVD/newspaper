package com.ute.newspaper.services;

import com.ute.newspaper.dao.ArticleDao;
import com.ute.newspaper.dao.TagDao;
import com.ute.newspaper.entities.Article;
import com.ute.newspaper.entities.Article_Category;
import com.ute.newspaper.entities.Tag;
import com.ute.newspaper.entities.User;
import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB
        maxFileSize=1024*1024*50,      	// 50 MB
        maxRequestSize=1024*1024*100)   	// 100 MB
public class ArticleService {
    private String uploadDir = "public/images/article";
    public static List<Article> findAllByUserID(int authorID)  {
        List<Article> articles = ArticleDao.findAllByUserID(authorID);
        if (articles.size() == 0) {
            System.out.println("findAllByUserID is null");
            return null;
        }
        return articles;
    }

    public static Article findByID(int id) throws ServletException, IOException {
        Article article = ArticleDao.findByID(id);
        if (article == null)
            return null;
        return article;
    }

    public static void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String title = req.getParameter("title");
        String sub = req.getParameter("subDes");
        String full = req.getParameter("fullDes");
        int categoryID = Integer.parseInt(req.getParameter("categoryID"));
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("authUser");
        String filename = null;
        for (Part part : req.getParts()) {
            if (part.getName().equals("avatar")) {
                String contentDisposition = part.getHeader("content-disposition");
                String[] items = contentDisposition.split(";");
                for (String s : items) {
                    String tmp = s.trim();
                    if (tmp.startsWith("filename")) {
                        int idx = tmp.indexOf("=") + 2;
                        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                        filename = timestamp.getTime() + tmp.substring(idx, tmp.length() - 1);

                        String targetDir = req.getServletContext().getRealPath("public/images/article");
                        File dir = new File(targetDir);
                        if (!dir.exists()) {
                            dir.mkdir();
                        }
                        String destination = targetDir + "/" + filename;
                        part.write(destination);
                    }
                }
            }
        }
        Article article = new Article();
        article.setTitle(title);
        article.setAbstract_content(sub);
        article.setContent(full);
        article.setStatus("Chờ xuất bản");
        article.setAuthor_id(user.getId());
        LocalDateTime dateTime = LocalDateTime.now();
        article.setCreateDate(dateTime);
        article.setUpdateDate(dateTime);
        article.setAvatar("public/images/article/" + filename);
        article.setEnable(true);

        article = ArticleDao.add(article);

        if (categoryID != -1){
            Article_Category articleCategory = new Article_Category();
            articleCategory.setArticle_id(article.getId());
            articleCategory.setCategory_id(categoryID);
        }


    }

    public static void edit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}

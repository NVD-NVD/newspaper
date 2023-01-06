package com.ute.newspaper.controllers;

import com.ute.newspaper.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "editorServlet", value = "/editor/*")
public class EditorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/index";
        }

        switch (path) {
            case "/index":
                ServletUtils.forward("/vwEditor/pages/index.jsp", req, resp);
                break;

            case "about":
                break;
            default:
                ServletUtils.forward("/404.jsp", req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
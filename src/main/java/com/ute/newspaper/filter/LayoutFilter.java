package com.ute.newspaper.filter;

import com.ute.newspaper.dao.CategoryDao;
import com.ute.newspaper.entities.Category;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "LayoutFilter")
public class LayoutFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException, IOException {
        List<Category> list = CategoryDao.findAll();
        request.setAttribute("categories", list);

        chain.doFilter(request, response);
    }
}

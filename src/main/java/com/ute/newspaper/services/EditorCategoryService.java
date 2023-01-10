package com.ute.newspaper.services;

import com.ute.newspaper.dao.EditorCategoryDao;
import com.ute.newspaper.entities.Editor_Category;

import java.util.List;

public class EditorCategoryService {
    public static List<Editor_Category> findAll(){
        return EditorCategoryDao.findAll();
    }
}

package com.wyjgradu.wyj.service;

import com.wyjgradu.wyj.pojo.Category;
import com.wyjgradu.wyj.dao.CategoryDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryDAO categoryDAO;

    public List<Category> list(){
        return categoryDAO.findAll(Sort.by(Sort.Direction.DESC,"id"));
    }


    public Category get(int id) {
        return categoryDAO.findById(id).orElse(null);
    }
}

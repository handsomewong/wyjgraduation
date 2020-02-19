package com.wyjgradu.wyj.service;

import com.wyjgradu.wyj.dao.ClothesDAO;
import com.wyjgradu.wyj.pojo.Clothes;
import com.wyjgradu.wyj.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClothesService {
    @Autowired
    ClothesDAO clothesDAO;
    @Autowired
    CategoryService categoryService;

    public List<Clothes> list(){
//        Sort sort=new Sort.by(Sort.Direction.DESC,"id");
//        return clothesDAO.findAll(sort);
        return clothesDAO.findAll(Sort.by(Sort.Direction.DESC,"id"));
    }


    public void addOrUpdate(Clothes clothes){
        clothesDAO.save(clothes);
    }

    public void deleteById(int id){
        clothesDAO.deleteById(id);
    }

    public List<Clothes> listByCategory(int cid){
        Category category = categoryService.get(cid);
//        Sort sort = new Sort(Sort.Direction.DESC, "id");
        return clothesDAO.findAllByCategory(category);
    }
}

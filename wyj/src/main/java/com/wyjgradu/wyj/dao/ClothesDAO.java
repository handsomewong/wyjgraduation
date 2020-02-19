package com.wyjgradu.wyj.dao;

import com.wyjgradu.wyj.pojo.Clothes;
import com.wyjgradu.wyj.pojo.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ClothesDAO extends JpaRepository<Clothes,Integer> {
    List<Clothes> findAllByCategory(Category category);
    List<Clothes> findAllByColorLikeOrTypessLike(String keyword1,String keyword2);
}

package com.wyjgradu.wyj.service;

import com.wyjgradu.wyj.dao.CategoryDAO;
import com.wyjgradu.wyj.pojo.Category;
import com.wyjgradu.wyj.pojo.Season;
import com.wyjgradu.wyj.dao.SeasonDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeasonService {
    @Autowired
    SeasonDAO seasonDAO;

    public List<Season> list(){
        return seasonDAO.findAll(Sort.by(Sort.Direction.DESC,"id"));
    }

    public Season get(int id) {
        return seasonDAO.findById(id).orElse(null);
    }
}

package com.wyjgradu.wyj.controller;

import com.wyjgradu.wyj.pojo.Clothes;
import com.wyjgradu.wyj.service.ClothesService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class BeautyController {
    @Autowired
    ClothesService clothesService;

    @CrossOrigin
    @GetMapping("/api/wardrobe")
    public List<Clothes> list() throws Exception{
        return clothesService.list();
    }

    @CrossOrigin
    @PostMapping("/api/wardrobe")
    public Clothes addOrUpdate(@RequestBody Clothes clothes) throws Exception{
        clothesService.addOrUpdate(clothes);
        return clothes;
    }

    @CrossOrigin
    @PostMapping("/api/delete")
    public void delete(@RequestBody Clothes clothes) throws Exception{
        clothesService.deleteById(clothes.getId());
    }

    @CrossOrigin
    @GetMapping("/api/categories/{cid}/wardrobe")
    public List<Clothes> listByCategory(@PathVariable("cid") int cid) throws Exception {
        if (0 != cid) {
            return clothesService.listByCategory(cid);
        }else {
            return list();
        }
    }
}

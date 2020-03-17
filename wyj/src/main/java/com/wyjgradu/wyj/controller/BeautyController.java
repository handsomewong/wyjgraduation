package com.wyjgradu.wyj.controller;

import com.wyjgradu.wyj.pojo.Clothes;
import com.wyjgradu.wyj.pojo.Search;
import com.wyjgradu.wyj.service.ClothesService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

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

    @CrossOrigin
    @PostMapping("/api/search")
    public List<Clothes> searchResult(@RequestBody Search s) throws Exception {
        // 关键字为空时查询所有物品
        if ("".equals(s.getKeywords())) {
            return clothesService.list();
        } else {
            return clothesService.Search(s.getKeywords());
        }
    }

    @CrossOrigin
    @GetMapping("/api/seasons/{sid}/wardrobe")
    public List<Clothes> listBySeason(@PathVariable("sid") int sid) throws Exception {
        if (0 != sid) {
            return clothesService.listBySeason(sid);
        }else {
            return list();
        }
    }

    @CrossOrigin
    @PostMapping("api/covers")
    public String coversUpload(MultipartFile file) throws Exception {
        String folder = "C:/graduation/img";
        File imageFolder = new File(folder);
        File f = new File(imageFolder, getRandomString(6) + file.getOriginalFilename()
                .substring(file.getOriginalFilename().length() - 4));
        if (!f.getParentFile().exists())
            f.getParentFile().mkdirs();
        try {
            file.transferTo(f);
            String imgURL = "http://localhost:8443/api/file/" + f.getName();
            return imgURL;
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
    }

        public String getRandomString(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
}

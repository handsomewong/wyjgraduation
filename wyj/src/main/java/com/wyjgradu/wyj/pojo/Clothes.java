package com.wyjgradu.wyj.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "clothes")
@JsonIgnoreProperties({"handler","hibernateLazyInitializer"})

public class Clothes {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    int id;

    @ManyToOne
    @JoinColumn(name="cid")
    private Category category;

    @ManyToOne
    @JoinColumn(name="sid")
    private Season season;

    String cover;
    String color;
    String cloth;
    String typess;
    String abs;
    String title;

    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }

    public Season getSeason(){return season;}
    public void setSeason(Season season) {this.season=season;}

    public String getTitle(){return title;}
    public void setTitle(String title) {this.title=title;}

    public String getTypess() {
        return typess;
    }
    public void setTypess(String typess) {
        this.typess = typess;
    }

    public String getCloth() {return cloth;}
    public void setCloth(String cloth) {this.cloth=cloth;}

    public String getAbs() {
        return abs;
    }
    public void setAbs(String abs) {
        this.abs = abs;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }


    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
}

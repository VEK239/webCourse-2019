package ru.itmo.wp.model.repository;

import ru.itmo.wp.model.domain.Article;

import java.util.List;

public interface ArticleRepository {
    void save(Article article);
    List<Article> findAll();
    List<Article> findByUser(long id);
    Article find(long id);
    void setHidden(long id, String val);
}
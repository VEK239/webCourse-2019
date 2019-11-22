package ru.itmo.wp.model.service;

import com.google.common.base.Strings;
import ru.itmo.wp.model.domain.Article;
import ru.itmo.wp.model.exception.ValidationException;
import ru.itmo.wp.model.repository.ArticleRepository;
import ru.itmo.wp.model.repository.impl.ArticleRepositoryImpl;

import java.util.List;

public class ArticleService {
    private final ArticleRepository articleRepository = new ArticleRepositoryImpl();

    public void createArticle(Article article) {
        articleRepository.save(article);
    }

    public List<Article> findAll() {
        return articleRepository.findAll();
    }

    public Article findByArticleId(long id) {
        return articleRepository.find(id);
    }

    public List<Article> findByUserId(long id) {
        return articleRepository.findByUser(id);
    }

    public void validateArticle(Article article) throws ValidationException {
        if (Strings.isNullOrEmpty(article.getTitle())) {
            throw new ValidationException("Title is required.");
        }

        if (article.getTitle().length() > 255) {
            throw new ValidationException("Title should be less then 255 symbols.");
        }

        if (Strings.isNullOrEmpty(article.getText())) {
            throw new ValidationException("Text is required.");
        }
    }

    public void setHidden(long articleId, String hide, long userId) throws ValidationException {
        Article article = articleRepository.find(articleId);
        if (article.getUserId() == userId) {
            articleRepository.setHidden(articleId, hide);
        } else {
            throw new ValidationException("You should be the creator of an article to change it!");
        }
    }
}
package ru.itmo.wp.web.page;

import com.google.common.base.Strings;
import ru.itmo.wp.model.domain.User;
import ru.itmo.wp.model.exception.ValidationException;
import ru.itmo.wp.model.service.ArticleService;
import ru.itmo.wp.web.exception.RedirectException;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class MyArticlesPage {
    private final ArticleService articleService = new ArticleService();

    private void action(HttpServletRequest request, Map<String, Object> view) {
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            view.put("articles", articleService.findByUserId(user.getId()));
            putMessage(request, view);
        }
    }

    private void findAllByUser(HttpServletRequest request, Map<String, Object> view) {
        view.put("articles", articleService.findByUserId(Long.parseLong(request.getParameter("user"))));
    }

    private void putMessage(HttpServletRequest request, Map<String, Object> view) {
        String message = (String) request.getSession().getAttribute("message");
        if (!Strings.isNullOrEmpty(message)) {
            view.put("message", message);
            request.getSession().removeAttribute("message");
        }
    }

    private void changePublicity(HttpServletRequest request, Map<String, Object> view) throws ValidationException {
        String valueToPut = request.getParameter("valueToPut");
        String articleIdParameter = request.getParameter("articleId");
        System.out.println('"' + valueToPut + '"' + articleIdParameter + '"');
        long articleId = Long.parseLong(articleIdParameter);
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            if ("Show".equals(valueToPut)) {
                articleService.setHidden(articleId, "SHOW", user.getId());
            } else {
                articleService.setHidden(articleId, "HIDE", user.getId());
            }
        } else {
            request.getSession().setAttribute("message", "You are not logged in!");
            throw new RedirectException("/index");
        }
    }
}

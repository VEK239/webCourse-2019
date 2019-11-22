package ru.itmo.wp.web.page;

import ru.itmo.wp.model.domain.User;
import ru.itmo.wp.model.exception.ValidationException;
import ru.itmo.wp.model.service.UserService;
import ru.itmo.wp.web.exception.RedirectException;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/** @noinspection unused*/
public class UsersPage {
    private final UserService userService = new UserService();

    private void action(HttpServletRequest request, Map<String, Object> view) {
        findAll(request, view);
    }

    private void findAll(HttpServletRequest request, Map<String, Object> view) {
        view.put("users", userService.findAll());
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            user = userService.find(user.getId());
        }
        view.put("curUser", (user != null) && user.isAdmin());
    }

    private void findUser(HttpServletRequest request, Map<String, Object> view) {
        view.put("user",
                userService.find(Long.parseLong(request.getParameter("userId"))));
    }

    private void changeAdmin(HttpServletRequest request, Map<String, Object> view) throws ValidationException {
        boolean valueToPut = Boolean.parseBoolean(request.getParameter("valueToPut"));
        long changingId = Long.parseLong(request.getParameter("changingId"));
        User user = (User) request.getSession().getAttribute("user");
        user = userService.find(user.getId());
        if (user != null && user.isAdmin()) {
            userService.setAdmin(user.getId(), valueToPut, changingId);
        } else {
            request.getSession().setAttribute("message", "You are not admin!");
            throw new RedirectException("/index");
        }
        System.out.println(view.toString());

    }

}

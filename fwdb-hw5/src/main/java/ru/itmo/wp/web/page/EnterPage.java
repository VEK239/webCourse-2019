package ru.itmo.wp.web.page;

import ru.itmo.wp.model.domain.Event;
import ru.itmo.wp.model.domain.EventType;
import ru.itmo.wp.model.domain.User;
import ru.itmo.wp.model.exception.ValidationException;
import ru.itmo.wp.model.service.EventService;
import ru.itmo.wp.model.service.UserService;
import ru.itmo.wp.web.exception.RedirectException;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/** @noinspection unused*/
public class EnterPage extends Page {
    private final UserService userService = new UserService();
    private final EventService eventService = new EventService();

    public void before(HttpServletRequest request, Map<String, Object> view) {
        super.before(request, view);
    }

    private void action(HttpServletRequest request, Map<String, Object> view) {
        // No operations.
    }

    private void enter(HttpServletRequest request, Map<String, Object> view) throws ValidationException {
        String loginOrEmail = request.getParameter("loginOrEmail");
        String password = request.getParameter("password");

        User user;
        if (loginOrEmail.matches("([a-z0-9_-]+\\.)*[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+")) {
            user = userService.validateAndFindByEmailAndPassword(loginOrEmail, password);
        } else {
            user = userService.validateAndFindByLoginAndPassword(loginOrEmail, password);
        }
        request.getSession().setAttribute("user", user);
        request.getSession().setAttribute("message", "Hello, " + user.getLogin());

        Event event = new Event();
        event.setUserId(user.getId());
        event.setType(EventType.ENTER);
        eventService.createEvent(event);

        throw new RedirectException("/index");
    }
}

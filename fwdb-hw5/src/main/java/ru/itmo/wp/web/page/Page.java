package ru.itmo.wp.web.page;

import com.google.common.base.Strings;
import ru.itmo.wp.model.domain.User;
import ru.itmo.wp.model.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public abstract class Page {
    private UserService userService = new UserService();
    public void before(HttpServletRequest request, Map<String, Object> view) {
        view.put("userCount", userService.findCount());

        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            view.put("user", user);
        }

        String message = (String) request.getSession().getAttribute("message");
        if (!Strings.isNullOrEmpty(message)) {
            view.put("message", message);
            request.getSession().removeAttribute("message");
        }
    }

    public void after(HttpServletRequest request, Map<String, Object> view) {
        // No operations.
    }

    public void setMessage (HttpServletRequest request, Map<String, Object> view, String message)
    {request.getSession().setAttribute("message", message);}

    public User getUser (HttpServletRequest request, Map<String, Object> view)
    {return (User) request.getSession().getAttribute("user");}

    public void setUser (HttpServletRequest request, Map<String, Object> view, User user)
    {request.getSession().setAttribute("message", user);}
}

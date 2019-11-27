package ru.itmo.wp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ru.itmo.wp.domain.User;
import ru.itmo.wp.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class UserPage extends Page {
    private final UserService userService;

    public UserPage(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("user/{StId}")
    public String userGet(Model model, @PathVariable String StId) {
        Long id;
        try {
            id = Long.parseLong(StId);
        } catch (Exception e) {
            return "UserPage";
        }
        User user = userService.findById(id);
        if (user != null) {
            model.addAttribute("userForPage", user);
        }
        return "UserPage";
    }
}

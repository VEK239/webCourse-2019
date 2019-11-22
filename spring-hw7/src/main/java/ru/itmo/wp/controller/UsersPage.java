package ru.itmo.wp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itmo.wp.domain.User;
import ru.itmo.wp.service.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class UsersPage extends Page {
    private final UserService userService;

    public UsersPage(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/users/all")
    public String users(Model model, HttpSession httpSession) {
        model.addAttribute("users", userService.findAll());
//        User user =
        model.addAttribute("userId", httpSession.getAttribute("userId"));
        return "UsersPage";
    }

    @PostMapping("users/{id}")
    public String usersChangeEnabledPost(Model model, HttpSession session, @PathVariable long id) {
        if (session.getAttribute("userId") != null) {
            User user = userService.findById(id);
            if (user != null) {
                userService.updateEnabled(user);
            }
            model.addAttribute("users", userService.findAll());
            return "redirect:/users/all";
        } else  {
            putMessage(session, "You are not logged in!");
            return "redirect:/";
        }
    }
}

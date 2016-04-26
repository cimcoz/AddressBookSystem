package com.project.contact.controller;

import com.project.contact.dao.UserEntity;
import com.project.contact.model.User;
import com.project.contact.object.ParseMD5;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by jwl on 2016/4/21.
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String index(ModelMap model) {
        model.addAttribute("errMessage","");
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String post(@ModelAttribute User user, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession httpSession) throws IOException {
        String password = user.getPassword();
        password = new ParseMD5().parseStrToMd5L32(password);
        UserEntity realUser = user.getUserByUsername(user.getUsername());
        if (password.equals(realUser.getPassword())) {
            httpSession.setAttribute("userId",realUser.getId());
            httpSession.setAttribute("username",realUser.getUsername());
            response.sendRedirect(request.getContextPath() + "/contact/phone.html");
            return "";
        } else {
            model.addAttribute("errMessage", "账户或密码不正确");
            return "login";
        }
    }

}

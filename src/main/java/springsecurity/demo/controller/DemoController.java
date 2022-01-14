package springsecurity.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoController {

    @RequestMapping("/")
    public String showHome() {

        return "home";
    }
    @RequestMapping("/admin")
    public String showAdmin() {

        return "admin-page";
    }
    @RequestMapping("/manager")
    public String showManager() {

        return "manager-page";
    }
    @RequestMapping("/accessDenied")
    public String showAccessDenied() {
        return "access-denied";
    }
    @RequestMapping("/showMyLoginPage")
    public String showLoginPage(){
        return "login-page";
    }

}

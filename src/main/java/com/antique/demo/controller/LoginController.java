package com.antique.demo.controller;


import com.antique.demo.service.CaptchaService;
import lombok.val;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@Controller
public class LoginController {

    private final
    CaptchaService captchaService;

    private int temp = 0;//用来计数显示前台错误信息
    private String conCode;

    public LoginController(CaptchaService captchaService) {
        this.captchaService = captchaService;
    }

    public void setConcode(String conCode){
        this.conCode = conCode;
    }
    public String getConCode(){
        return conCode;
    }
    @RequestMapping("/")
    public String root(){
        return "index";
    }
    //跳转到登录页面
    @RequestMapping("/antique/login")
    public String login(){
        return "login";
    }
    //退出登录
    @RequestMapping(value = {"/loginOut"})
    public String loginOut() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "/login";
    }
    //登录验证
    @RequestMapping("/loginValidate")
    public String loginValidate( String loginUsername, String loginPassword, String jspCode, Model model,HttpServletResponse response)throws IOException{
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken auth = new UsernamePasswordToken(loginUsername, loginPassword);
            try {
                if (jspCode.equalsIgnoreCase(getConCode())){
                    subject.login(auth);
                    response.sendRedirect("/");
                    return null;//跳转到index页面
                }
                else {
                    temp = 1;
                    model.addAttribute("temp",temp);
                    model.addAttribute("msgImg","验证码有误,请重新输入或点击图片刷新");
                }
            }catch (Exception e){
                temp = 2;
                e.printStackTrace();
                model.addAttribute("temp",temp);
                model.addAttribute("msgPwd","用户名或密码有误,请重新输入");
            }
            return "login";
    }
    @RequestMapping("/SCaptchaServlet")//验证码图片
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        // 禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        val entry = captchaService.createCode();
        HttpSession session = request.getSession();
        setConcode(entry.getCode());//获取随机生成的验证码
        Cookie cookie = new Cookie("JSESSIONID", session.getId());
        cookie.setMaxAge(1800);
        response.addCookie(cookie);
        entry.writeImg(response.getOutputStream());
    }
}

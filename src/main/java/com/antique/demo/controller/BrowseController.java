package com.antique.demo.controller;

import com.alibaba.fastjson.JSON;
import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Certificate;
import com.antique.demo.bean.Company;
import com.antique.demo.bean.Individual;
import com.antique.demo.service.AuditCertificateService;
import com.antique.demo.service.BrowseService;
import com.antique.demo.service.CompanyService;
import com.antique.demo.service.IndividualService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class BrowseController {
    @Autowired
    BrowseService browseService;
    @Autowired
    CompanyService companyService;
    @Autowired
    IndividualService individualService;
    @Autowired
    AuditCertificateService auditCertificateService;
    @RequestMapping("/index")
    public void indexPage(HttpServletResponse response) throws IOException {
        response.sendRedirect("/index/1");
    }
    @RequestMapping("/index/{pageNum}")
    public String indexPage1(@PathVariable("pageNum") int pageNum, Model model,String UserOrAntiqueName){
        PageHelper.startPage(pageNum, 4);
        List<Antique> antiques = null;
        if(UserOrAntiqueName == null || UserOrAntiqueName == "")
            antiques = browseService.selectAntique();
        else
            antiques = browseService.selectVagueAntique(UserOrAntiqueName);
        PageInfo<Antique> pageInfo = new PageInfo(antiques);
        model.addAttribute("antiques",antiques);
        model.addAttribute("pageInfo", pageInfo);
        return "antique_browse";
    }
    @RequestMapping("/index/certificate")
    @ResponseBody
    public String certificateInfo(String antique_number,Model model){
        Certificate certificate = auditCertificateService.selectCertificateById(Integer.valueOf(antique_number));
        model.addAttribute("certificate",certificate);
        return JSON.toJSONString(certificate);
    }
    @RequestMapping("/index/bePeopleKind")
    @ResponseBody
    public String bePeopleKind(String antique_number,Model model){
        Antique antique = browseService.selectAntiqueById(Integer.valueOf(antique_number));
        if (antique.getAntique_bePeople().equals("个体")) {
            Individual individual = individualService.selectIndividualById(Integer.valueOf(antique_number));
            model.addAttribute("kind","个体");
            model.addAttribute("individual",individual);
            return JSON.toJSONString(individual);
        }else if(antique.getAntique_bePeople().equals("企业")){
            Company company = companyService.selectCompanyById(Integer.valueOf(antique_number));
            model.addAttribute("kind","企业");
            model.addAttribute("company",company);
            return JSON.toJSONString(company);
        }
        return null;
    }
}

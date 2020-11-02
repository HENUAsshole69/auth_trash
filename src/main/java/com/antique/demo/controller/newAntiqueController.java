package com.antique.demo.controller;

import com.alibaba.fastjson.JSON;
import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Company;
import com.antique.demo.bean.Individual;
import com.antique.demo.service.*;
import com.antique.demo.util.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class newAntiqueController {
    private Antique antique;
    @Autowired
    AuditCertificateService auditCertificateService;
    @Autowired
    AuditLocusService auditLocusService;
    @Autowired
    AuditService auditService;
    @Autowired
    AuditSpecialistService auditSpecialistService;
    @Autowired
    BrowseService browseService;
    @Autowired
    InfoService infoService;
    @Autowired
    IndividualService individualService;
    @Autowired
    CompanyService companyService;
    @RequestMapping("/antique/info")
    @ResponseBody
    public String newAntique(Antique antique,@RequestParam("uploadfile") MultipartFile uploadfile) throws IOException {
        this.antique =  antique;
        if(uploadfile!=null&&!uploadfile.isEmpty()) {
            String newFileName = UploadImage.uploadImg(uploadfile);
            antique.setAntique_img(newFileName);
        }
        return JSON.toJSONString("success");
    }
    @RequestMapping("/antique/newAntique/individual")

    public void newAntiqueAll(Individual individual, HttpServletResponse response) throws IOException{
        individual.setAntique_number(antique.getAntique_number());
        auditCertificateService.insertNewCertificate(antique.getAntique_number());
        auditLocusService.insertNewLocus(antique.getAntique_number());
        auditService.insertNewCheck(antique.getAntique_number());
        auditSpecialistService.insertNewSpecialist(antique.getAntique_number());
        browseService.insertNewList(antique);
        individualService.insertNewIndividual(individual);
        response.sendRedirect("/index/1");
    }
    @RequestMapping("/antique/newAntique/company")
    @ResponseBody
    public void newAntiqueAll(Company company, HttpServletResponse response) throws IOException {
        company.setAntique_number(antique.getAntique_number());
        auditCertificateService.insertNewCertificate(antique.getAntique_number());
        auditLocusService.insertNewLocus(antique.getAntique_number());
        auditService.insertNewCheck(antique.getAntique_number());
        auditSpecialistService.insertNewSpecialist(antique.getAntique_number());
        browseService.insertNewList2(antique);
        companyService.insertNewCompany(company);
        response.sendRedirect("/index/1");
    }
}

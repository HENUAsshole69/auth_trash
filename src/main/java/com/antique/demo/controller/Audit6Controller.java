package com.antique.demo.controller;


import com.alibaba.fastjson.JSON;
import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Certificate;
import com.antique.demo.bean.Check;
import com.antique.demo.bean.CheckSpecialist;
import com.antique.demo.service.AuditCertificateService;
import com.antique.demo.service.AuditService;
import com.antique.demo.service.AuditSpecialistService;
import com.antique.demo.service.BrowseService;
import com.antique.demo.util.UploadImage;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Audit6Controller {
    @Autowired
    BrowseService browseService;
    @Autowired
    AuditService auditService;
    @Autowired
    AuditSpecialistService auditSpecialistService;
    @Autowired
    AuditCertificateService auditCertificateService;
        //证书录入首页
        @RequestMapping("/antique/audit6/{pageNum}")
        public String indexPage4(@PathVariable("pageNum") int pageNum, Model model, String UserOrAntiqueName){
            PageHelper.startPage(pageNum, 4);
            List<Antique> antiques = null;
            List<Antique> ans = new ArrayList<>();
            String antique_kind = "非文物非艺术品";
            int antique_count = 0;
            if(UserOrAntiqueName == null || UserOrAntiqueName == "")
                antiques = browseService.selectAntique();
            else//查询
                antiques = browseService.selectVagueAntique(UserOrAntiqueName);
            for(Antique antique:antiques){
                CheckSpecialist checkSpecialist = auditSpecialistService.selectSpecialistCheckById(antique.getAntique_number());
                if(!antique_kind.equals(antique.getAntique_kind()))
                    antique_count++;
                Check check = auditService.selectReCheckById(antique.getAntique_number());
                Certificate certificate = auditCertificateService.selectCertificateById(antique.getAntique_number());
                antique.setAntique_status(check.getAntique_status());
                antique.setAntique_kind(checkSpecialist.getAntique_kind());
                antique.setAntique_certificate_id(certificate.getAntique_certificate_id());
                antique.setAntique_recheckor(certificate.getAntique_certificate_checkor());
                antique.setAntique_recheckor_reason(certificate.getAntique_certificate_reason());
            }
            for(Antique antique:antiques){
                if(antique_kind.equals(antique.getAntique_kind()))
                    continue;
                ans.add(antique);
            }
            PageInfo<Antique> pageInfo = new PageInfo(antiques);
            pageInfo.setTotal(antique_count);
            model.addAttribute("antiques",ans);
            model.addAttribute("pageInfo",pageInfo);
            return "antique_audit_6";
        }
        @RequestMapping("/antique/audit6/certificateShow")
        public String certificateShow(String antique_number,Model model){
            Antique antique = browseService.selectAntiqueById(Integer.valueOf(antique_number));
            Check check = auditService.selectReCheckById(Integer.valueOf(antique_number));
            Certificate certificate = auditCertificateService.selectCertificateById(Integer.valueOf(antique_number));
            certificate.setAntique_status(check.getAntique_status());
            model.addAttribute("antique",antique);
            model.addAttribute("certificate",certificate);
            return "antique_audit_6.1";
        }
    @RequestMapping("/antique/audit6/certificateInfo")
    @ResponseBody
    public String certificateShow(Certificate certificate, @RequestParam("uploadfile") MultipartFile uploadfile) throws IOException {
        if(uploadfile!=null&&!uploadfile.isEmpty()) {
            String newFileName = UploadImage.uploadImg(uploadfile);
            certificate.setAntique_certificate_img(newFileName);
        }
        auditCertificateService.updateCertificate(certificate);
        return JSON.toJSONString("success");
    }
    @RequestMapping("/antique/audit/recheck61")
    public void recheck61(String recheckBol,int antique_number,String reason,HttpServletResponse response) throws IOException{
            System.out.println(recheckBol+" "+reason);
        if(recheckBol.equals("no"))
            auditCertificateService.updateCertificateReason(recheckBol,antique_number,reason);
        else if(recheckBol.equals("yes")){
            auditCertificateService.updateCertificateReasonYes(recheckBol,antique_number);
            auditService.updateCheckStatus(antique_number);
        }
        response.sendRedirect("/antique/audit6/1");
    }
}


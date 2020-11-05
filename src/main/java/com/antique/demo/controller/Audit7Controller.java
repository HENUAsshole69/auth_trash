package com.antique.demo.controller;


import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Certificate;
import com.antique.demo.bean.Check;
import com.antique.demo.bean.Info;
import com.antique.demo.service.*;
import com.antique.demo.service.ImageUploadService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class Audit7Controller {
    final
    BrowseService browseService;
    final
    AuditService auditService;
    final
    AuditSpecialistService auditSpecialistService;
    final
    AuditCertificateService auditCertificateService;
    final
    InfoService infoService;
    final
    ImageUploadService imageUploadService;
    Logger logger = LoggerFactory.getLogger(Audit7Controller.class);
@Autowired
    public Audit7Controller(BrowseService browseService, AuditService auditService, AuditSpecialistService auditSpecialistService, AuditCertificateService auditCertificateService, InfoService infoService, ImageUploadService imageUploadService) {
        this.browseService = browseService;
        this.auditService = auditService;
        this.auditSpecialistService = auditSpecialistService;
        this.auditCertificateService = auditCertificateService;
        this.infoService = infoService;
        this.imageUploadService = imageUploadService;
    }

    //证书录入首页
        @RequestMapping("/antique/audit7/{pageNum}")
        public String indexPage7(@PathVariable("pageNum") int pageNum, Model model, String UserOrAntiqueName){
            PageHelper.startPage(pageNum, 4);
            List<Antique> antiques = null;
            List<Antique> ans = new ArrayList<>();
            String antique_kind = "非文物非艺术品";
            int antique_count = 0;
            if(UserOrAntiqueName == null || UserOrAntiqueName.equals(""))
                antiques = browseService.selectAntique();
            else//查询
                antiques = browseService.selectVagueAntique(UserOrAntiqueName);
            for(Antique antique:antiques){
                if(!antique_kind.equals(antique.getAntique_kind()))
                    antique_count++;
                Check check = auditService.selectReCheckById(antique.getAntique_number());
                Certificate certificate = auditCertificateService.selectCertificateById(antique.getAntique_number());
                antique.setAntique_status(check.getAntique_status());

                antique.setAntique_recheckor(certificate.getAntique_certificate_checkor8());//第八步审核状态
                antique.setAntique_recheckor_reason(certificate.getAntique_certificate_reason8());
                antique.setAntique_certificate_insert(certificate.getAntique_certificate_insert());

                antique.setAntique_certificate_time(certificate.getAntique_certificate_time());
                antique.setAntique_certificate_business(certificate.getAntique_certificate_business());
                antique.setAntique_certificate_businessman(certificate.getAntique_certificate_businessman());
                antique.setAntique_certificate_price(certificate.getAntique_certificate_price());
                antique.setAntique_certificate_file(certificate.getAntique_certificate_file());
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
            return "antique_audit_7";
        }
        @RequestMapping("/antique/audit7/certificateInfoInsert")
        public void certificateInfoInsert(Certificate certificate,@RequestParam("uploadfile") MultipartFile uploadfile,HttpServletResponse response) throws IOException {
            if(uploadfile!=null&&!uploadfile.isEmpty()) {
                String newFileName = imageUploadService.uploadImg(uploadfile);
                certificate.setAntique_certificate_file(newFileName);
            }
            auditCertificateService.updateCertificateInfo(certificate);
            response.sendRedirect("/antique/audit7/1");
        }
    @RequestMapping("/antique/audit/recheck71")
    public void recheck71(String recheckBol,int antique_number,String reason,HttpServletResponse response) throws IOException{
        logger.info(recheckBol+" "+reason);
        if(recheckBol.equals("no"))
            auditCertificateService.updateCertificateInfoReason(recheckBol,antique_number,reason);
        else if(recheckBol.equals("yes")){
            auditCertificateService.updateCertificateInfoReasonYes(recheckBol,antique_number);
            auditService.updateCheckStatus(antique_number);
        }
        response.sendRedirect("/antique/audit7/1");
   }
    @RequestMapping("/antique/audit7/InfoInsert")
    public void InfoInsert(Info info, @RequestParam("uploadfile") MultipartFile uploadfile, HttpServletResponse response) throws IOException {
        if(uploadfile!=null&&!uploadfile.isEmpty()) {
            String newFileName = imageUploadService.uploadImg(uploadfile);
            info.setAntique_infoImg(newFileName);
        }
        infoService.insertInfo(info);
        response.sendRedirect("/antique/audit7/1");
    }
}


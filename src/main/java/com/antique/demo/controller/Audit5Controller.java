package com.antique.demo.controller;


import com.alibaba.fastjson.JSON;
import com.antique.demo.bean.*;
import com.antique.demo.service.*;
import com.antique.demo.service.UploadImageService;
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
public class Audit5Controller {
    final
    BrowseService browseService;
    final
    AuditService auditService;
    final
    AuditSpecialistService auditSpecialistService;
    final
    AuditCertificateService auditCertificateService;
    final
    AuditLocusService locusService;
    final
    UploadImageService uploadImageService;
    @Autowired
    public Audit5Controller(BrowseService browseService, AuditService auditService, AuditSpecialistService auditSpecialistService, AuditCertificateService auditCertificateService, AuditLocusService locusService, UploadImageService uploadImageService) {
        this.browseService = browseService;
        this.auditService = auditService;
        this.auditSpecialistService = auditSpecialistService;
        this.auditCertificateService = auditCertificateService;
        this.locusService = locusService;
        this.uploadImageService = uploadImageService;
    }

    //证书录入首页
        @RequestMapping("/antique/audit5/{pageNum}")
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
                Locus locus = locusService.selectLocusById(String.valueOf(antique.getAntique_number()));
                antique.setAntique_status(check.getAntique_status());
                antique.setAntique_kind(checkSpecialist.getAntique_kind());
                antique.setAntique_locus_submit(locus.getAntique_locus_submit());
                antique.setAntique_locus_submitImg(locus.getAntique_locus_submitImg());
                antique.setAntique_recheckor(locus.getAntique_locus_recheckor());
                antique.setAntique_recheckor_reason(locus.getAntique_locus_reason());
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
            return "antique_audit_5";
        }
    @RequestMapping("/antique/audit5/LocusShowInfo")
    public String LocusShowInfo(String antique_number,Model model){
        Antique antique = browseService.selectAntiqueById(Integer.valueOf(antique_number));
        Locus locus = locusService.selectLocusById(antique_number);
        model.addAttribute("antique",antique);
        model.addAttribute("locus",locus);
        return "antique_audit_5.1";
    }
    @RequestMapping("/antique/audit5/LocusShowImgInfo")
    public String LocusShowImgInfo(String antique_number,Model model){
        Antique antique = browseService.selectAntiqueById(Integer.valueOf(antique_number));
        Locus locus = locusService.selectLocusById(antique_number);
        model.addAttribute("antique",antique);
        model.addAttribute("locus",locus);
        return "antique_audit_5.12";
    }
    @RequestMapping("/antique/audit5/bit_trialInfo")
    @ResponseBody
    public String bit_trialInfo(Locus locus){
        System.out.println(locus);
        locusService.updateLocusInfo(locus);
        return JSON.toJSONString("success");
    }
    @RequestMapping("/antique/audit5/bit_trialImgInfo")
    @ResponseBody
    public String bit_trialImgInfo(Locus locus,@RequestParam("uploadfile") MultipartFile uploadfile[]) throws IOException {
    for(int i = 0;i<uploadfile.length;i++){
        if(uploadfile[i]!=null&&!uploadfile[i].isEmpty()) {
                String newFileName = uploadImageService.uploadImg(uploadfile[i]);
                if(i == 0)
                    locus.setAntique_locus_img1(newFileName);
                else if(i == 1)
                    locus.setAntique_locus_img2(newFileName);
                else if(i == 2)
                    locus.setAntique_locus_img3(newFileName);
                else
                    locus.setAntique_locus_img4(newFileName);
            }
    }
        locusService.updateLocusImgInfo(locus);
        return JSON.toJSONString("success");
    }
    @RequestMapping("/antique/audit/recheck51")
    public void recheck51(String recheckBol,String antique_number_lu,String reason,HttpServletResponse response) throws IOException{
            if(recheckBol.equals("yes")){
                locusService.updateLocusCheckYes(antique_number_lu);
                auditService.updateCheckStatus(Integer.valueOf(antique_number_lu));
            }else{
                locusService.updateLocusCheckNo(antique_number_lu,reason);
            }
            response.sendRedirect("/antique/audit5/1");
    }


}


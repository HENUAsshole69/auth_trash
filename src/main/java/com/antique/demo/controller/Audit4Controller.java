package com.antique.demo.controller;


import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Check;
import com.antique.demo.bean.CheckSpecialist;
import com.antique.demo.service.AuditService;
import com.antique.demo.service.AuditSpecialistService;
import com.antique.demo.service.BrowseService;
import com.antique.demo.service.ImageUploadService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class Audit4Controller {
    final
    BrowseService browseService;
    final
    AuditService auditService;
    final
    AuditSpecialistService auditSpecialistService;
    final
    ImageUploadService imageUploadService;
@Autowired
    public Audit4Controller(BrowseService browseService, AuditService auditService, AuditSpecialistService auditSpecialistService, ImageUploadService imageUploadService) {
        this.browseService = browseService;
        this.auditService = auditService;
        this.auditSpecialistService = auditSpecialistService;
        this.imageUploadService = imageUploadService;
    }

    //多维页面首页
        @RequestMapping("/antique/audit4/{pageNum}")
        public String indexPage4(@PathVariable("pageNum") int pageNum, Model model, String UserOrAntiqueName){
            List<Antique> antiques = null;
            List<CheckSpecialist> checkSpecialists = auditSpecialistService.selectAllSpecialistCheck();
            PageHelper.startPage(pageNum, 4);
            if(UserOrAntiqueName == null || UserOrAntiqueName == "")
                antiques = browseService.selectAntique();
            else//查询
                antiques = browseService.selectVagueAntique(UserOrAntiqueName);
            for(Antique antique:antiques){
                Check check = auditService.selectReCheckById(antique.getAntique_number());
                CheckSpecialist checkSpecialist = auditSpecialistService.selectSpecialistCheckById(antique.getAntique_number());
                antique.setAntique_status(check.getAntique_status());
                antique.setAntique_recheck(check.getAntique_recheck());
                antique.setAntique_checkor(checkSpecialist.getAntique_checkor_s());
                antique.setAntique_recheckor(checkSpecialist.getAntique_recheckor());
                antique.setAntique_recheckor_reason(checkSpecialist.getAntique_recheckno_reason());
            }

            PageInfo<Antique> pageInfo = new PageInfo(antiques);
            model.addAttribute("antiques",antiques);
            model.addAttribute("cs",checkSpecialists);
            model.addAttribute("pageInfo", pageInfo);
            return "antique_audit_4";
        }
    //专家初审结果显示
    @RequestMapping("/antique/audit4/specialist")
    public String reCheck4(String antique_number,Model model) {
        Antique antique = browseService.selectAntiqueById(Integer.valueOf(antique_number));
        Check check = auditService.selectReCheckById(Integer.valueOf(antique_number));
        model.addAttribute("antique",antique);
        model.addAttribute("check",check);
        return "antique_audit_4.1";
    }

    //多维鉴定结果显示
    @RequestMapping("/antique/audit4/specialistShow")
    public String reCheck4_1(String antique_number,Model model) {
        Antique antique = browseService.selectAntiqueById(Integer.valueOf(antique_number));
        CheckSpecialist check = auditSpecialistService.selectSpecialistCheckById(Integer.valueOf(antique_number));
        model.addAttribute("antique",antique);
        model.addAttribute("checkSpecialist",check);
        return "antique_audit_4.1";
    }
    //文物局专家审核
    @RequestMapping("/antique/audit4_1/specialistCheck")
    public void reCheck4_1_1(CheckSpecialist checkSpecialist, @RequestParam("uploadfile") MultipartFile uploadfile, HttpServletResponse response) throws IOException {
        System.out.println(checkSpecialist);
        if(uploadfile!=null&&!uploadfile.isEmpty()) {
            String newFileName = imageUploadService.uploadImg(uploadfile);
            checkSpecialist.setAntique_aspecialist_img(newFileName);
        }
        CheckSpecialist cs =  auditSpecialistService.selectSpecialistCheckById(Integer.valueOf(checkSpecialist.getAntique_number_d()));
        if((cs.getAntique_kind() != null) && (cs.getAntique_kind() != ""))
            checkSpecialist.setAntique_kind(cs.getAntique_kind());
        auditSpecialistService.updateSpecialistYes(checkSpecialist);
        Check(Integer.valueOf(checkSpecialist.getAntique_number_d()));
        response.sendRedirect("/antique/audit4/1");
    }
    //艺术品专家审核
    @RequestMapping("/antique/audit4_1_1/specialistCheck")
    public void reCheck4_1_11(CheckSpecialist checkSpecialist, @RequestParam("uploadfile") MultipartFile uploadfile, HttpServletResponse response) throws IOException {
        System.out.println(checkSpecialist);
            if(uploadfile!=null&&!uploadfile.isEmpty()) {
            String newFileName = imageUploadService.uploadImg(uploadfile);
            checkSpecialist.setAntique_tspecialist_img(newFileName);
        }
        CheckSpecialist cs =  auditSpecialistService.selectSpecialistCheckById(Integer.valueOf(checkSpecialist.getAntique_number_d()));
        if((cs.getAntique_kind() != null) && (cs.getAntique_kind() != ""))
            checkSpecialist.setAntique_kind(cs.getAntique_kind());
        auditSpecialistService.updateTSpecialistYes(checkSpecialist);
        Check(Integer.valueOf(checkSpecialist.getAntique_number_d()));
        response.sendRedirect("/antique/audit4/1");
    }
    //科技专家审核
    @RequestMapping("/antique/audit4_1_2/specialistCheck")
    public void reCheck4_1_12(CheckSpecialist checkSpecialist, @RequestParam("uploadfile") MultipartFile uploadfile, HttpServletResponse response) throws IOException {
            if(uploadfile!=null&&!uploadfile.isEmpty()) {
            String newFileName = imageUploadService.uploadImg(uploadfile);
            checkSpecialist.setAntique_rspecialist_img(newFileName);
        }
        CheckSpecialist cs =  auditSpecialistService.selectSpecialistCheckById(Integer.valueOf(checkSpecialist.getAntique_number_d()));
        if((cs.getAntique_kind() != null) && (cs.getAntique_kind() != "")){
            checkSpecialist.setAntique_kind(cs.getAntique_kind());
        }
        auditSpecialistService.updateRSpecialistYes(checkSpecialist);
        Check(Integer.valueOf(checkSpecialist.getAntique_number_d()));
        response.sendRedirect("/antique/audit4/1");
    }
    @RequestMapping("/antique/audit/recheck41")
    public void reCheck4_1_13(String recheckBol,String antique_number,String reason,HttpServletResponse response) throws IOException{
        if(recheckBol.equals("yes")) {
            auditSpecialistService.updateResCheckYes(recheckBol,antique_number);
            auditService.updateCheckStatus(Integer.valueOf(antique_number));
        }
        else{
            System.out.println(reason);
            auditSpecialistService.updateResCheckNo(recheckBol,antique_number,reason);
        }

        response.sendRedirect("/antique/audit4/1");
    }
    public void Check(int antique_number){
        CheckSpecialist cs =  auditSpecialistService.selectSpecialistCheckById(antique_number);
        String yes = "true";
        String kind = "文物";
        if(kind.equals(cs.getAntique_kind())){
            if(yes.equals(cs.getAntique_aspecialist_res())&&yes.equals(cs.getAntique_tspecialist_res()))
                auditSpecialistService.updateCheckYes("yes",String.valueOf(antique_number));
            else
                auditSpecialistService.updateCheckNo("no",String.valueOf(antique_number));
        }else{
        if(yes.equals(cs.getAntique_aspecialist_res())&&yes.equals(cs.getAntique_rspecialist_res())&&yes.equals(cs.getAntique_tspecialist_res()))
            auditSpecialistService.updateCheckYes("yes",String.valueOf(antique_number));
        else
            auditSpecialistService.updateCheckNo("no",String.valueOf(antique_number));
        }
    }
}


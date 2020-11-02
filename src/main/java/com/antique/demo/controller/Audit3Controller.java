package com.antique.demo.controller;

import com.alibaba.fastjson.JSON;
import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Check;
import com.antique.demo.service.AuditService;
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

import java.io.IOException;
import java.util.List;

@Controller
public class Audit3Controller {
    @Autowired
    BrowseService browseService;
    @Autowired
    AuditService auditService;
        //初步鉴定页面首页
        @RequestMapping("/antique/audit3/{pageNum}")
        public String indexPage3(@PathVariable("pageNum") int pageNum, Model model, String UserOrAntiqueName){
            PageHelper.startPage(pageNum, 4);
            List<Antique> antiques = null;
            if(UserOrAntiqueName == null || UserOrAntiqueName == "")
                antiques = browseService.selectAntique();
            else//查询
                antiques = browseService.selectVagueAntique(UserOrAntiqueName);
            for(Antique antique:antiques){
                Check check = auditService.selectReCheckById(antique.getAntique_number());
                antique.setAntique_status(check.getAntique_status());
                antique.setAntique_checkor(check.getAntique_checkor());
                antique.setAntique_recheck(check.getAntique_recheck());
            }
            PageInfo<Antique> pageInfo = new PageInfo(antiques);
            model.addAttribute("antiques",antiques);
            model.addAttribute("pageInfo", pageInfo);
            return "antique_audit_3";
        }
        //专家初步鉴定，通过审核
    @RequestMapping("/antique/audit3/recheckYes")
    @ResponseBody
    public String reCheck3(Check check,@RequestParam("uploadfile") MultipartFile uploadfile) throws IOException {
        if(uploadfile!=null&&!uploadfile.isEmpty()) {
            String newFileName = UploadImage.uploadImg(uploadfile);
            System.out.println(newFileName);
            check.setAntique_specialistImg(newFileName);
        }
        auditService.updateCheckSpecialist(check);
        return JSON.toJSONString("success");
    }
    //专家初审结果显示
    @RequestMapping("/antique/audit3/specialist")
    public String reCheck3(String antique_number,Model model) {
        Antique antique = browseService.selectAntiqueById(Integer.valueOf(antique_number));
        Check check = auditService.selectReCheckById(Integer.valueOf(antique_number));
        System.out.println(antique);
        System.out.println(check);
        model.addAttribute("antique",antique);
        model.addAttribute("check",check);
        return "antique_audit_3.1";
    }
}


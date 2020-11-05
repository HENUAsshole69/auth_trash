package com.antique.demo.controller;

import com.alibaba.fastjson.JSON;
import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Check;
import com.antique.demo.bean.WnTInfo;
import com.antique.demo.service.AuditService;
import com.antique.demo.service.BrowseService;
import com.antique.demo.service.ImageUploadService;
import com.antique.demo.service.WnTService;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WnTController {
    final
    BrowseService browseService;
    final
    WnTService wnTService;
    final
    AuditService auditService;
    private ImageUploadService imageUploadService;
    Logger logger = LoggerFactory.getLogger(AuditController.class);

    public WnTController(BrowseService browseService, WnTService wnTService, AuditService auditService, ImageUploadService imageUploadService) {
        this.browseService = browseService;
        this.wnTService = wnTService;
        this.auditService = auditService;
        this.imageUploadService = imageUploadService;
    }

    @RequestMapping("/antique/wnt")
    @ResponseBody
    public String newAntique(WnTInfo wnTInfo,@RequestParam("uploadfile") MultipartFile uploadfile) throws IOException {
        if(uploadfile!=null&&!uploadfile.isEmpty()) {
            wnTService.newWnt(wnTInfo.getAntique_id(),uploadfile,wnTInfo.getWnt_info());
        }
        return JSON.toJSONString("success");
    }

    @RequestMapping("/antique/wnt/{pageNum}")
    public String indexPage1(@PathVariable("pageNum") int pageNum, Model model, String UserOrAntiqueName){
        PageHelper.startPage(pageNum, 4);
        List<Antique> antiques = null;
        if(UserOrAntiqueName == null || UserOrAntiqueName.equals(""))
            antiques = browseService.selectAntique();
        else
            antiques = browseService.selectVagueAntique(UserOrAntiqueName);
        for(Antique antique:antiques){
            Check check = auditService.selectReCheckById(antique.getAntique_number());
            antique.setAntique_recheck(check.getAntique_recheck());
            antique.setWnTInfo(wnTService.getWnt(antique.getAntique_id()));
        }
        PageInfo<Antique> pageInfo = new PageInfo<>(antiques);
        model.addAttribute("antiques",antiques);
        model.addAttribute("pageInfo", pageInfo);
        return "antique_wnt";
    }
}

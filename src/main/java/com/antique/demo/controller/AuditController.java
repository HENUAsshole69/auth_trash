package com.antique.demo.controller;

import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Check;
import com.antique.demo.service.AuditService;
import com.antique.demo.service.BrowseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class AuditController {
    @Autowired
    BrowseService browseService;
    @Autowired
    AuditService auditService;
    Logger logger = LoggerFactory.getLogger(AuditController.class);
    @RequestMapping("/antique/audit/{pageNum}")
    public String indexPage1(@PathVariable("pageNum") int pageNum, Model model,String UserOrAntiqueName){
        PageHelper.startPage(pageNum, 4);
        List<Antique> antiques = null;
        if(UserOrAntiqueName == null || UserOrAntiqueName == "")
            antiques = browseService.selectAntique();
        else
            antiques = browseService.selectVagueAntique(UserOrAntiqueName);
        for(Antique antique:antiques){
            Check check = auditService.selectReCheckById(antique.getAntique_number());
            antique.setAntique_recheck(check.getAntique_recheck());
        }
        PageInfo<Antique> pageInfo = new PageInfo(antiques);
        model.addAttribute("antiques",antiques);
        model.addAttribute("pageInfo", pageInfo);
        return "antique_audit";
    }
    @RequestMapping("/antique/audit/recheckYes")
    public void reCheck(String recheck,HttpServletResponse response) throws IOException {
        logger.info(recheck);
        auditService.updateReCheckInfo(Integer.valueOf(recheck));
        response.sendRedirect("/antique/audit/1");
    }
    @RequestMapping("/antique/audit/recheckNo")
    public void reCheckNo(String recheck,HttpServletResponse response) throws IOException {
        logger.info(recheck);
        auditService.updateReCheckInfoNo(Integer.valueOf(recheck));
        response.sendRedirect("/antique/audit/1");
    }

    //审核人员复核
    @RequestMapping("/antique/audit/recheck31")
    public void recheck31(String recheckBol, String antique_number, HttpServletResponse response) throws IOException{
        logger.info(recheckBol+"   "+antique_number);
        if(recheckBol.equals("yes"))
            auditService.updateCheckorYes(Integer.valueOf(antique_number));
        else if(recheckBol.equals("no"))
            auditService.updateCheckorNo(Integer.valueOf(antique_number));
        response.sendRedirect("/antique/audit3/1");
    }
}

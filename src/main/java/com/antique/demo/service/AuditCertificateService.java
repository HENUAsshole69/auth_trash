package com.antique.demo.service;



import com.antique.demo.bean.Certificate;
import com.antique.demo.bean.CheckSpecialist;
import com.antique.demo.mapper.AuditCertificateMapper;
import com.antique.demo.mapper.AuditSpecialistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class AuditCertificateService  {
    @Autowired
    AuditCertificateMapper auditCertificateMapper;


    public List<Certificate> selectCertificate() {
        return auditCertificateMapper.selectCertificate();
    }


    public Certificate selectCertificateById(int antique_number_ce) {
        return auditCertificateMapper.selectCertificateById(antique_number_ce);
    }


    public void updateCertificate(Certificate certificate) {
        auditCertificateMapper.updateCertificate(certificate);
    }


    public void updateCertificateReason(String recheckBol, int antique_number, String reason) {
        auditCertificateMapper.updateCertificateReason(recheckBol,antique_number,reason);
    }


    public void updateCertificateReasonYes(String recheckBol, int antique_number) {
        auditCertificateMapper.updateCertificateReasonYes(recheckBol,antique_number);
    }


    public void updateCertificateInfo(Certificate certificate) {
        auditCertificateMapper.updateCertificateInfo(certificate);
    }


    public void updateCertificateInfoReason(String recheckBol, int antique_number, String reason) {
        auditCertificateMapper.updateCertificateInfoReason(recheckBol,antique_number,reason);
    }


    public void updateCertificateInfoReasonYes(String recheckBol, int antique_number) {
        auditCertificateMapper.updateCertificateInfoReasonYes(recheckBol,antique_number);
    }


    public void insertNewCertificate(int antique_number_ce) {
        auditCertificateMapper.insertNewCertificate(antique_number_ce);
    }
}

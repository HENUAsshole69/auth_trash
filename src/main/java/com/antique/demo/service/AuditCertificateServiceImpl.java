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
public class AuditCertificateServiceImpl implements AuditCertificateService {
    @Autowired
    AuditCertificateMapper auditCertificateMapper;

    @Override
    public List<Certificate> selectCertificate() {
        return auditCertificateMapper.selectCertificate();
    }

    @Override
    public Certificate selectCertificateById(int antique_number_ce) {
        return auditCertificateMapper.selectCertificateById(antique_number_ce);
    }

    @Override
    public void updateCertificate(Certificate certificate) {
        auditCertificateMapper.updateCertificate(certificate);
    }

    @Override
    public void updateCertificateReason(String recheckBol, int antique_number, String reason) {
        auditCertificateMapper.updateCertificateReason(recheckBol,antique_number,reason);
    }

    @Override
    public void updateCertificateReasonYes(String recheckBol, int antique_number) {
        auditCertificateMapper.updateCertificateReasonYes(recheckBol,antique_number);
    }

    @Override
    public void updateCertificateInfo(Certificate certificate) {
        auditCertificateMapper.updateCertificateInfo(certificate);
    }

    @Override
    public void updateCertificateInfoReason(String recheckBol, int antique_number, String reason) {
        auditCertificateMapper.updateCertificateInfoReason(recheckBol,antique_number,reason);
    }

    @Override
    public void updateCertificateInfoReasonYes(String recheckBol, int antique_number) {
        auditCertificateMapper.updateCertificateInfoReasonYes(recheckBol,antique_number);
    }

    @Override
    public void insertNewCertificate(int antique_number_ce) {
        auditCertificateMapper.insertNewCertificate(antique_number_ce);
    }
}

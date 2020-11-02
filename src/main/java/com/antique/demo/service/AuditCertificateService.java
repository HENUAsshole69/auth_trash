package com.antique.demo.service;


import com.antique.demo.bean.Certificate;
import com.antique.demo.bean.CheckSpecialist;

import java.util.List;


public interface AuditCertificateService {
    List<Certificate> selectCertificate();
    Certificate selectCertificateById(int antique_number_ce);
    void updateCertificate(Certificate certificate);
    void updateCertificateReason(String recheckBol,int antique_number,String reason);
    void updateCertificateReasonYes(String recheckBol,int antique_number);

    void updateCertificateInfo(Certificate certificate);
    void updateCertificateInfoReason(String recheckBol,int antique_number,String reason);
    void updateCertificateInfoReasonYes(String recheckBol,int antique_number);
    void insertNewCertificate(int antique_number_ce);
}

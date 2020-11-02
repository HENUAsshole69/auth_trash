package com.antique.demo.mapper;




import com.antique.demo.bean.Certificate;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface AuditCertificateMapper {
    List<Certificate> selectCertificate();
    Certificate selectCertificateById(int antique_number_ce);
    void updateCertificate(Certificate certificate);
    void updateCertificateReason(String recheckBol,int antique_number,String reason);
    void updateCertificateReasonYes(String recheckBol,int antique_number);
    //第八步
    void updateCertificateInfo(Certificate certificate);
    void updateCertificateInfoReason(String recheckBol,int antique_number,String reason);
    void updateCertificateInfoReasonYes(String recheckBol,int antique_number);
    void insertNewCertificate(int antique_number_ce);
}

package com.antique.demo.service;



import com.antique.demo.bean.Certificate;
import com.antique.demo.bean.Locus;
import com.antique.demo.mapper.AuditCertificateMapper;
import com.antique.demo.mapper.AuditLocusMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class AuditLocusService {
    @Autowired
    AuditLocusMapper auditLocusMapper;


    public List<Locus> selectLocus() {
        return auditLocusMapper.selectLocus();
    }


    public Locus selectLocusById(String antique_number_lu) {
        return auditLocusMapper.selectLocusById(antique_number_lu);
    }


    public void updateLocusInfo(Locus locus) {
        auditLocusMapper.updateLocusInfo(locus);
    }


    public void updateLocusImgInfo(Locus locus) {
        auditLocusMapper.updateLocusImgInfo(locus);
    }


    public void updateLocusCheckYes(String antique_number_lu) {
        auditLocusMapper.updateLocusCheckYes(antique_number_lu);
    }


    public void updateLocusCheckNo(String antique_number_lu,String reason) {
        auditLocusMapper.updateLocusCheckNo(antique_number_lu,reason);
    }


    public void insertNewLocus(int antique_number_lu) {
        auditLocusMapper.insertNewLocus(antique_number_lu);
    }

}

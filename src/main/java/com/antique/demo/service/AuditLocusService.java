package com.antique.demo.service;



import com.antique.demo.bean.Locus;

import java.util.List;


public interface AuditLocusService {
    List<Locus> selectLocus();
    Locus selectLocusById(String antique_number_lu);
    void updateLocusInfo(Locus locus);
    void updateLocusImgInfo(Locus locus);
    void updateLocusCheckYes(String antique_number_lu);
    void updateLocusCheckNo(String antique_number,String reason);
    void insertNewLocus(int antique_number_lu);
}

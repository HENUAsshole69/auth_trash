package com.antique.demo.service;


import com.antique.demo.bean.CheckSpecialist;

import java.util.List;


public interface AuditSpecialistService {
    List<CheckSpecialist> selectAllSpecialistCheck();
    CheckSpecialist selectSpecialistCheckById(int antique_number);
    void updateSpecialistYes(CheckSpecialist checkSpecialist);
    void updateTSpecialistYes(CheckSpecialist checkSpecialist);
    void updateRSpecialistYes(CheckSpecialist checkSpecialist);
    void updateCheckYes(String recheckBol,String antique_number);
    void updateCheckNo(String recheckBol,String antique_number);
    void updateResCheckYes(String recheckBol,String antique_number);
    void updateResCheckNo(String recheckBol,String antique_number,String antique_recheckno_reason);
    void insertNewSpecialist(int antique_number_d);
}

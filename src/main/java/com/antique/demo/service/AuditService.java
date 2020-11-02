package com.antique.demo.service;


import com.antique.demo.bean.Check;

import java.util.List;

public interface AuditService {
    List<Check> selectChecks();
    Check selectReCheckById(int antique_number);
    void updateReCheckInfo(int antique_number);
    void updateReCheckInfoNo(int antique_number);
    void updateCheckSpecialist(Check check);
    void updateCheckorYes(int antique_number_c);
    void updateCheckorNo(int antique_number_c);
    void updateCheckStatus(int antique_number_c);
    void insertNewCheck(int antique_number_c);
}

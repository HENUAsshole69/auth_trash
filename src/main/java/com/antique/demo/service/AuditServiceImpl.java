package com.antique.demo.service;



import com.antique.demo.bean.Check;
import com.antique.demo.mapper.AuditMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class AuditServiceImpl implements AuditService {
    @Autowired
    AuditMapper auditMapper;

    @Override
    public List<Check> selectChecks() {
        return auditMapper.selectChecks();
    }

    @Override
    public Check selectReCheckById(int antique_number) {
        return auditMapper.selectReCheckById(antique_number);
    }

    @Override
    public void updateReCheckInfo(int antique_number) {
        auditMapper.updateReCheckInfo(antique_number);
    }

    @Override
    public void updateReCheckInfoNo(int antique_number) {
        auditMapper.updateReCheckInfoNo(antique_number);
    }

    @Override
    public void updateCheckSpecialist(Check check) {
        auditMapper.updateCheckSpecialist(check);
    }

    @Override
    public void updateCheckorYes(int antique_number_c) {
        auditMapper.updateCheckorYes(antique_number_c);
    }

    @Override
    public void updateCheckorNo(int antique_number_c) {
        auditMapper.updateCheckorNo(antique_number_c);
    }

    @Override
    public void updateCheckStatus(int antique_number_c) {
        auditMapper.updateCheckStatus(antique_number_c);
    }

    @Override
    public void insertNewCheck(int antique_number_c) {
        auditMapper.insertNewCheck(antique_number_c);
    }

}

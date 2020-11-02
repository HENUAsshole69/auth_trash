package com.antique.demo.service;



import com.antique.demo.bean.CheckSpecialist;
import com.antique.demo.mapper.AuditSpecialistMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class AuditSpecialistServiceImpl implements AuditSpecialistService {
    @Autowired
    AuditSpecialistMapper auditSpecialistMapper;

    @Override
    public List<CheckSpecialist> selectAllSpecialistCheck() {
        return auditSpecialistMapper.selectAllSpecialistCheck();
    }

    @Override
    public CheckSpecialist selectSpecialistCheckById(int antique_number) {
        return auditSpecialistMapper.selectSpecialistCheckById(antique_number);
    }

    @Override
    public void updateSpecialistYes(CheckSpecialist checkSpecialist) {
        auditSpecialistMapper.updateSpecialistYes(checkSpecialist);
    }

    @Override
    public void updateTSpecialistYes(CheckSpecialist checkSpecialist) {
        auditSpecialistMapper.updateTSpecialistYes(checkSpecialist);
    }

    @Override
    public void updateRSpecialistYes(CheckSpecialist checkSpecialist) {
        auditSpecialistMapper.updateRSpecialistYes(checkSpecialist);
    }

    @Override
    public void updateCheckYes(String recheckBol, String antique_number) {
        auditSpecialistMapper.updateCheckYes(recheckBol,antique_number);
    }

    @Override
    public void updateCheckNo(String recheckBol, String antique_number) {
        auditSpecialistMapper.updateCheckNo(recheckBol,antique_number);
    }

    @Override
    public void updateResCheckYes(String recheckBol, String antique_number) {
        auditSpecialistMapper.updateResCheckYes(recheckBol,antique_number);
    }

    @Override
    public void updateResCheckNo(String recheckBol, String antique_number,String antique_recheckno_reason) {
        auditSpecialistMapper.updateResCheckNo(recheckBol,antique_number,antique_recheckno_reason);
    }

    @Override
    public void insertNewSpecialist(int antique_number_d) {
        auditSpecialistMapper.insertNewSpecialist(antique_number_d);
    }
}

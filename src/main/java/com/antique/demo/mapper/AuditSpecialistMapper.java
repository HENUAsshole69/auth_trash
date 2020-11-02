package com.antique.demo.mapper;




import com.antique.demo.bean.CheckSpecialist;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface AuditSpecialistMapper {
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

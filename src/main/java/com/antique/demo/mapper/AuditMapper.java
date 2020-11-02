package com.antique.demo.mapper;




import com.antique.demo.bean.Check;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface AuditMapper {
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

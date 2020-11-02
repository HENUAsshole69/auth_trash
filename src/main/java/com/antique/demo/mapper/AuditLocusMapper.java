package com.antique.demo.mapper;
import com.antique.demo.bean.Locus;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface AuditLocusMapper {
    List<Locus> selectLocus();
    Locus selectLocusById(String antique_number_lu);
    void updateLocusInfo(Locus locus);
    void updateLocusImgInfo(Locus locus);
    void updateLocusCheckYes(String antique_number_lu);
    void updateLocusCheckNo(String antique_number_lu,String reason);
    void insertNewLocus(int antique_number_lu);
}

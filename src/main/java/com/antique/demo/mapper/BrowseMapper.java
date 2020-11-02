package com.antique.demo.mapper;


import com.antique.demo.bean.Antique;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BrowseMapper {
    Antique selectAntiqueById(int antique_number);
    List<Antique> selectAntique();
    List<Antique> selectVagueAntique(String UserOrAntiqueName);
    void insertNewList(Antique antique);
    void insertNewList2(Antique antique);
}

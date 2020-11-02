package com.antique.demo.service;


import com.antique.demo.bean.Antique;
import java.util.List;


public interface BrowseService {
    Antique selectAntiqueById(int antique_number);
    List<Antique> selectAntique();
    List<Antique> selectVagueAntique(String UserOrAntiqueName);
    void insertNewList(Antique antique);
    void insertNewList2(Antique antique);
}

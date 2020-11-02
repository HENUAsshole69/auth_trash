package com.antique.demo.service;



import com.antique.demo.bean.Antique;
import com.antique.demo.mapper.BrowseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class BrowseService  {
    @Autowired
    BrowseMapper browseMapper;


    public Antique selectAntiqueById(int antique_number) {
        return browseMapper.selectAntiqueById(antique_number);
    }


    public List<Antique> selectAntique() {
        return browseMapper.selectAntique();
    }


    public List<Antique> selectVagueAntique(String UserOrAntiqueName) {
        return browseMapper.selectVagueAntique(UserOrAntiqueName);
    }


    public void insertNewList(Antique antique) {
        browseMapper.insertNewList(antique);
    }


    public void insertNewList2(Antique antique) {
        browseMapper.insertNewList2(antique);
    }

}

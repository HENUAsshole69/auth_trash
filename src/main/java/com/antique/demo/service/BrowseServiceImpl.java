package com.antique.demo.service;



import com.antique.demo.bean.Antique;
import com.antique.demo.mapper.BrowseMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class BrowseServiceImpl implements BrowseService {
    @Autowired
    BrowseMapper browseMapper;

    @Override
    public Antique selectAntiqueById(int antique_number) {
        return browseMapper.selectAntiqueById(antique_number);
    }

    @Override
    public List<Antique> selectAntique() {
        return browseMapper.selectAntique();
    }

    @Override
    public List<Antique> selectVagueAntique(String UserOrAntiqueName) {
        return browseMapper.selectVagueAntique(UserOrAntiqueName);
    }

    @Override
    public void insertNewList(Antique antique) {
        browseMapper.insertNewList(antique);
    }

    @Override
    public void insertNewList2(Antique antique) {
        browseMapper.insertNewList2(antique);
    }

}

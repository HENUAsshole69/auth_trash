package com.antique.demo.service;



import com.antique.demo.bean.Info;
import com.antique.demo.bean.User;
import com.antique.demo.mapper.InfoMapper;
import com.antique.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class InfoService  {
    @Autowired
    InfoMapper infoMapper;


    public void insertInfo(Info info) {
        infoMapper.insertInfo(info);
    }


    public void insertNewInfo(String antique_number_in) {
        infoMapper.insertNewInfo(antique_number_in);
    }
}

package com.antique.demo.service;


import com.antique.demo.bean.Info;
import com.antique.demo.bean.User;

import java.util.List;

public interface InfoService {
    void insertInfo(Info info);
    void insertNewInfo(String antique_number_in);
}

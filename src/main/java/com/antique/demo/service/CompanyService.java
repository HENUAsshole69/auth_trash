package com.antique.demo.service;


import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Company;

import java.util.List;


public interface CompanyService {
    Company selectCompanyById(int antique_number);
    void insertNewCompany(Company company);
}

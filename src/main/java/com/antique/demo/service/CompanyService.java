package com.antique.demo.service;



import com.antique.demo.bean.Antique;
import com.antique.demo.bean.Company;
import com.antique.demo.mapper.BrowseMapper;
import com.antique.demo.mapper.CompanyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class CompanyService  {
    @Autowired
    CompanyMapper companyMapper;


    public Company selectCompanyById(int antique_number) {
        return companyMapper.selectCompanyById(antique_number);
    }


    public void insertNewCompany(Company company) {
        companyMapper.insertNewCompany(company);
    }
}

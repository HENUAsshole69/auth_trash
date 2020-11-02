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
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    CompanyMapper companyMapper;

    @Override
    public Company selectCompanyById(int antique_number) {
        return companyMapper.selectCompanyById(antique_number);
    }

    @Override
    public void insertNewCompany(Company company) {
        companyMapper.insertNewCompany(company);
    }
}

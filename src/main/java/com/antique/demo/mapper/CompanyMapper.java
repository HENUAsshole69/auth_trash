package com.antique.demo.mapper;


import com.antique.demo.bean.Company;
import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface CompanyMapper {
    Company selectCompanyById(int antique_number);
    void insertNewCompany(Company company);
}

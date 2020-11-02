package com.antique.demo.bean;

import lombok.Data;
@Data
public class Company {
    private int applicant_id;
    private int antique_number;
    private String applicant_name;
    private String applicant_buscode;
    private String applicant_loginadress;
    private String applicant_represent;
    private String applicant_legal;
    private String applicant_capital;
    private String applicant_reperson;
    private String applicant_rejob;
    private String applicant_phone;
    private String applicant_email;
    private String applicant_max;
    private String applicant_code;
    private String applicant_address;
    private String kind = "企业";
}

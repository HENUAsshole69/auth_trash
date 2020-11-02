package com.antique.demo.bean;

import lombok.Data;

@Data
public class Individual {
    private int applicant_id;
    private int antique_number;
    private String applicant_name;
    private String applicant_number;
    private String applicant_phone;
    private String applicant_email;
    private String applicant_max;
    private String applicant_code;
    private String applicant_address;
    private String kind = "个体";
}

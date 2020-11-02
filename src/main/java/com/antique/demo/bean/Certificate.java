package com.antique.demo.bean;

import lombok.Data;

@Data
public class Certificate {
    private int antique_id;
    private int antique_number_ce;
    private String antique_certificate_id;//证书编号
    private String antique_certificate_img;
    private String antique_certificate_checkor;
    private String antique_certificate_reason;
    private int antique_status;

    private String antique_certificate_time;
    private String antique_certificate_business;
    private String antique_certificate_businessman;
    private String antique_certificate_price;
    private String antique_certificate_file;
    private String antique_certificate_checkor8;//第八步审核状态
    private String antique_certificate_reason8;
    private String antique_certificate_insert;
}

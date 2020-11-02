package com.antique.demo.bean;

import lombok.Data;

@Data
public class Antique {

    private int antique_id;
    private int antique_number;
    private String antique_name;
    private String antique_info;
    private String antique_details;//描述
    private String antique_time;
    private String antique_intact;
    private String antique_authenticate;
    private String antique_form;//规格
    private String antique_users;
    private String antique_kind;//文物类型
    private String antique_bePeople;
    private String antique_recheck;//文物是否通过复核
    private String antique_img;//文物图片
    private String antique_checkor;//复核人员审核状态
    private int antique_status;
    private String antique_recheckor;//文物是否通过多维鉴定
    private String antique_recheckor_reason;//多维鉴定拒绝复核原因
    private String antique_certificate_id;//证书编号
    private String antique_locus_submit;
    private String antique_locus_submitImg;

    private String antique_certificate_insert;//第八步是否录入信息
    private String antique_certificate_time;
    private String antique_certificate_business;
    private String antique_certificate_businessman;
    private String antique_certificate_price;
    private String antique_certificate_file;
}

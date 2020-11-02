package com.antique.demo.bean;

import lombok.Data;

@Data
public class CheckSpecialist {
    private int antique_id;
    private String antique_number_d;
    private String antique_aspecialist_name;
    private String antique_aspecialist_notes;
    private String antique_aspecialist_time;
    private String antique_aspecialist_img;
    private String antique_tspecialist_name;
    private String antique_tspecialist_notes;
    private String antique_tspecialist_time;
    private String antique_tspecialist_img;
    private String antique_rspecialist_name;
    private String antique_rspecialist_notes;
    private String antique_rspecialist_time;
    private String antique_rspecialist_img;
    private String antique_aspecialist_res;
    private String antique_rspecialist_res;
    private String antique_tspecialist_res;
    private String antique_kind;//藏品种类
    private int antique_status;
    private String antique_checkor_s;//是否通过复核
    private String antique_recheckor;
    private String antique_recheckno_reason;//多维鉴定拒绝复核原因
}

package com.antique.demo.bean;

import lombok.Data;

@Data
public class Check {
    private int antique_id;
    private int antique_status;
    private int antique_number_c;
    private String antique_bstatus;
    private String antique_recheck;
    private String antique_specialistName;
    private String antique_specialistNotes;
    private String antique_specialistTime;
    private String antique_specialistImg;
    private String antique_checkor;//复核人员审核状态
}

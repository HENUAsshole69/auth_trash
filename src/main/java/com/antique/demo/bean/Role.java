package com.antique.demo.bean;

import lombok.Data;

@Data
public class Role {
    private int role_id;
    private String role_username;
    private String user_id;
    private String user_username;
    private String antique = "no";//文物局
    private String burn_in = "no";//老化
    private String worker = "no";//工作人员
    private String antique_store = "no";//文物商店
    private String auction = "no";//拍卖行
    private String ordinary = "no";//普通人员
    private String finance = "no";//财务人员
}

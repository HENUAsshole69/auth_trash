package com.antique.demo.util;

import java.io.File;

public class BasicPath {
    public static final String path = System.getProperty("user.dir");
    public static final String realImagePath= path +File.separator+"src"+File.separator+"main"
            +File.separator+"webapp"+File.separator+ "META-INF/resources/upload" +File.separator;
    public static final String imagePath= "META-INF/resources/upload" +File.separator+"img";

}

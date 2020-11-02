package com.antique.demo.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UploadImage {
    public static String uploadImg(MultipartFile uploadfile) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String format = sdf.format(new Date());
        File folder = new File(BasicPath.realImagePath + format);
        if (!folder.isDirectory()) {
            folder.mkdirs();
        }
        //老图片的
        String oldName = uploadfile.getOriginalFilename();
        String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."), oldName.length());
        uploadfile.transferTo(new File(folder, newName));
//        String newFilePath= BasicPath.imagePath+File.separator+format+File.separator+newName;
        String newFilePath = format + "/" + newName;
        return newFilePath;
    }
}

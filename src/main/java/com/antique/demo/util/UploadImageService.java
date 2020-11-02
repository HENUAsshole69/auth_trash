package com.antique.demo.util;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class UploadImageService {
    public String uploadImg(MultipartFile uploadFile) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String format = sdf.format(new Date());

        File folder = new File(BasicPath.realImagePath + format);
        if (!folder.isDirectory()) {
            folder.mkdirs();
        }
        //老图片的
        String oldName = uploadFile.getOriginalFilename();
        String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."), oldName.length());
        uploadFile.transferTo(new File(folder, newName));
//        String newFilePath= BasicPath.imagePath+File.separator+format+File.separator+newName;
        return newName;
    }
}

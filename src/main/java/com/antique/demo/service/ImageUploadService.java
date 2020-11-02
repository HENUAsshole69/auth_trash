package com.antique.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class ImageUploadService {
    public String uploadImg(MultipartFile uploadFile) throws IOException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String format = sdf.format(new Date());
        //老图片的
        String oldName = uploadFile.getOriginalFilename();
        String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."), oldName.length());
        return newName;
    }
}

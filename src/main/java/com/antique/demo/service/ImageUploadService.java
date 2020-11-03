package com.antique.demo.service;

import io.minio.errors.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.xmlpull.v1.XmlPullParserException;

import java.io.File;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
public class ImageUploadService {
    private ContentService contentService;
    @Autowired
    public ImageUploadService(ContentService contentService) {
        this.contentService = contentService;
    }

    public String uploadImg(MultipartFile uploadFile) {
        //老图片的
        String oldName = uploadFile.getOriginalFilename();
        String newName = UUID.randomUUID() + oldName.substring(oldName.lastIndexOf("."));
        contentService.saveContent(uploadFile,newName);
        return newName;
    }
}

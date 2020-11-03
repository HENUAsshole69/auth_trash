package com.antique.demo.service;

import io.minio.MinioClient;
import io.minio.errors.*;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.AbstractMap;

@Service
public class ContentService {

    private MinioClient client;
    private String bucketName;

    @Autowired
    public ContentService(MinioClient client,@Value("${min.io.bucket}") String bucketName) {
        this.client = client;
        this.bucketName = bucketName;
    }

    public void saveContent(MultipartFile file, String id) {

        try{
            client.putObject(bucketName,id,file.getInputStream(),file.getSize(),file.getContentType());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public AbstractMap.SimpleEntry<InputStream,Long> getFile(String id) {
        try {

            val stat = client.statObject(bucketName, id);
            return new AbstractMap.SimpleEntry<>(client.getObject(bucketName, id), stat.length());
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}

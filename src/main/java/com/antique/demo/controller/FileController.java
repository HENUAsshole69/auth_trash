package com.antique.demo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.AbstractMap;
import javax.servlet.ServletContext;

import com.antique.demo.except.NotFoundException;
import com.antique.demo.service.ContentService;
import io.minio.errors.*;
import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.xmlpull.v1.XmlPullParserException;


@Controller
public class FileController {
    private final ContentService contentService;
    private final ServletContext servletContext;

    /*@PostMapping("/antique/{id}/inventory/file/{fileName}")
    public ResponseEntity doUpload(@RequestParam("file") MultipartFile multipartFile, @RequestHeader("x-api-key") String jwt, @PathVariable long id, @PathVariable String fileName) {
        return ResponseEntity.ok().build();
    }*/

    @GetMapping("/upload/{id}")
    public ResponseEntity<InputStreamResource> downloadFile(@PathVariable String id) {
        val file = this.contentService.getFile(id);
        if (file != null) {
            MediaType mediaType = MediaType.parseMediaType(this.servletContext.getMimeType(id));
            AbstractMap.SimpleEntry<InputStream,Long> fileContent = this.contentService.getFile(id);
            InputStreamResource resource = new InputStreamResource(fileContent.getKey());
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=${file.fileName}") // Content-Type
                    .contentType(mediaType)
                    .contentLength(fileContent.getValue())
                    .body(resource);
        } else {
            throw new NotFoundException("File Not Found");
        }
    }

    @Autowired
    public FileController( ContentService contentService,  ServletContext servletContext) {
        this.contentService = contentService;
        this.servletContext = servletContext;
    }
}
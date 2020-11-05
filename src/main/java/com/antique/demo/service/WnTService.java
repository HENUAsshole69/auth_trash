package com.antique.demo.service;

import com.antique.demo.bean.WnTInfo;
import com.antique.demo.mapper.WnTMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class WnTService {
    private WnTMapper wnTMapper;
    private ImageUploadService imageUploadService;

    @Autowired
    public WnTService(WnTMapper wnTMapper,ImageUploadService imageUploadService) {
        this.wnTMapper = wnTMapper;
        this.imageUploadService = imageUploadService;
    }
    public boolean WntExists(int antique_id){
        return wnTMapper.getWnt(antique_id) != null;
    }
    public void newWnt(int antique_id, MultipartFile img,String info){
        wnTMapper.insertWnt(antique_id,info,imageUploadService.uploadImg(img));
    }
    public WnTInfo getWnt(int antique_id){
        return wnTMapper.getWnt(antique_id);
    }
}

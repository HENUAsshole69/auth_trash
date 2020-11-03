package com.antique.demo.config;

import io.minio.MinioClient;
import io.minio.errors.InvalidEndpointException;
import io.minio.errors.InvalidPortException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnProperty(prefix = "min.io",name = "host")
@EnableConfigurationProperties(MinIOProperties.class)
public class MinioConfig {
    private MinIOProperties properties;

    @Autowired
    public MinioConfig(MinIOProperties properties) {
        this.properties = properties;
    }

    @Bean
    public MinioClient rawClient() throws InvalidPortException, InvalidEndpointException {
        return new MinioClient(properties.getHost(), properties.getAccessKey(),properties.getSecretKey());
    }
}

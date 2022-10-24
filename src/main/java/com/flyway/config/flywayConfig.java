package com.flyway.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.flyway.FlywayMigrationStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class flywayConfig {

    @Bean
    public FlywayMigrationStrategy flywayMigrationStrategy(){
        return flyway -> {
            flyway.repair();
            flyway.migrate();
        };
    }
}

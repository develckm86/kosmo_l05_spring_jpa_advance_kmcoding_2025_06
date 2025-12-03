package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.InfoImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InfoImageRepository extends JpaRepository<InfoImage, Long> {
}

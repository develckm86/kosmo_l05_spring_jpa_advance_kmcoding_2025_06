package com.smu.l04_jpa_km_coding.repository;

import com.smu.l04_jpa_km_coding.entity.QnaImage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QnaImageRepository extends CrudRepository<QnaImage, Long> {
    @Override
    <S extends QnaImage> Iterable<S> saveAll(Iterable<S> entities);

    @Override
    <S extends QnaImage> S save(S entity);
}

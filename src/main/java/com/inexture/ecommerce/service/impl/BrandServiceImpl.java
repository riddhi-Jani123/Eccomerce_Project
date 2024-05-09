package com.inexture.ecommerce.service.impl;

import com.inexture.ecommerce.exception.NoDataFoundException;
import com.inexture.ecommerce.exception.NotFoundException;
import com.inexture.ecommerce.model.Brand;
import com.inexture.ecommerce.repository.BrandRepository;
import com.inexture.ecommerce.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;

import java.util.List;
import java.util.Optional;

@Service
public class BrandServiceImpl  implements BrandService {

    @Autowired
    private BrandRepository brandRepository;

    public List<Brand> findAll() {
        List<Brand> brands = brandRepository.findAll();
        if (brands.isEmpty()) {
            throw new NoDataFoundException("No Data Available");
        }
        return brands;
    }

    public Optional<Brand> findById(Long id) {
        if(brandRepository.existsById(id)) {
            return brandRepository.findById(id);
        }else{
            throw new NotFoundException("Brand not found");
        }
    }

    public Brand createBrand(Brand brand) {
        return brandRepository.save(brand);
    }

    public ResponseEntity<String> handleValidationExceptions(MethodArgumentNotValidException ex) {
        FieldError fieldError = ex.getBindingResult().getFieldError();
        String errorMessage = fieldError != null ? fieldError.getDefaultMessage() : "Validation error occurred";
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(errorMessage);

    }

    public Brand updateBrand(Long id, Brand brand) {
        if(brandRepository.existsById(id)) {
            brand.setBrandId(id);
            return brandRepository.save(brand);
        }else{
            throw new NotFoundException("Brand not found");
        }
    }

    public void deleteBrand(Long id) {
        if(brandRepository.existsById(id)){
            brandRepository.deleteById(id);
        }else{
            throw new NotFoundException("Brand not found");
        }
    }


}

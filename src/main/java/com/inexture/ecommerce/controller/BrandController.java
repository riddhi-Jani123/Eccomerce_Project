package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.dto.ErrorResponse;
import com.inexture.ecommerce.exception.NoDataFoundException;
import com.inexture.ecommerce.exception.NotFoundException;
import com.inexture.ecommerce.model.Brand;
import com.inexture.ecommerce.service.BrandService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/brands")
public class BrandController {

    @Autowired
    private BrandService brandService;

    @GetMapping
    public ResponseEntity<?> getAllBrands() {
        try {
            List<Brand> brands = brandService.findAll();
            String hashedPassword = encode("1234");
       System.out.println("hashed password "+hashedPassword);
            return new ResponseEntity<>(brands, HttpStatus.OK);


        }catch (NoDataFoundException e){
            return ResponseEntity.status(HttpStatus.OK).body(e.getMessage());
        }
    }

    public static String encode(String password) {
        try {

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            System.out.println("NoSuchAlgorithm");
            return null;
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getBrandById(@PathVariable long id) {
        try {
            Optional<Brand> brand = brandService.findById(id);
            return brand.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                    .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
        }catch (NotFoundException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }

    }

    @PostMapping
    public ResponseEntity<?> createBrand(@Valid @RequestBody Brand brand) {

        try {
            Brand newBrand = brandService.createBrand(brand);
            return new ResponseEntity<>(newBrand, HttpStatus.CREATED);
        }catch (Exception e) {
            return brandService.handleValidationExceptions((MethodArgumentNotValidException) e);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateBrand(@PathVariable long id, @RequestBody Brand brand) {
        try{
            Brand updatedBrand = brandService.updateBrand(id, brand);
            return new ResponseEntity<>(updatedBrand, HttpStatus.OK);

        }catch (NotFoundException e){
            ErrorResponse errorResponse = new ErrorResponse(HttpStatus.NOT_FOUND.value(), e.getMessage());
            return new  ResponseEntity<>(errorResponse, HttpStatus.NOT_FOUND);

        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteBrand(@PathVariable long id) {
        try {
            brandService.deleteBrand(id);
            return ResponseEntity.ok("Brand deleted successfully");
        } catch (NotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }

}

package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.dto.ProductDTO;
import com.inexture.ecommerce.model.Brand;
import com.inexture.ecommerce.model.Product;
import com.inexture.ecommerce.model.ProductImage;
import com.inexture.ecommerce.repository.BrandRepository;
import com.inexture.ecommerce.repository.ProductImageRepository;
import com.inexture.ecommerce.service.BrandService;
import com.inexture.ecommerce.service.ProductService;
import com.inexture.ecommerce.service.impl.ProductServiceImpl;
import com.oracle.wls.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class ProductController {

    @Autowired
    BrandService brandService;

    @Autowired
    ProductService productService;

    @GetMapping("/shop")
    public ModelAndView shop(){
        ModelAndView mav = new ModelAndView("shop");
        List<ProductDTO> productDTOList = productService.findAllProductsWithImages();
        List<Brand> brandsList = brandService.findAll();
        Map<String, Object> attributesMap = new HashMap<>();
        attributesMap.put("productList",productDTOList);
        attributesMap.put("brandsList",brandsList);
        mav.addAllObjects(attributesMap);
        return mav;
    }
}

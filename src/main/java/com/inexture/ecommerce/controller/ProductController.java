package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.model.Brand;
import com.inexture.ecommerce.model.Product;
import com.inexture.ecommerce.repository.BrandRepository;
import com.inexture.ecommerce.service.BrandService;
import com.inexture.ecommerce.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    BrandService brandService;

    @Autowired
    ProductService productService;

    ;@GetMapping("/shop")
    public ModelAndView shop(){
        ModelAndView mav = new ModelAndView("shop");
        List<Product> productList = productService.findAll();
        List<Brand> brandsList = brandService.findAll();

        Map<String, Object> attributesMap = new HashMap<>();
        attributesMap.put("productList",productList);
        attributesMap.put("brandsList",brandsList);

        mav.addAllObjects(attributesMap);
        return mav;
    }
}

package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.repository.BrandRepository;
import com.inexture.ecommerce.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

    @Autowired
    BrandService brandService;

    @GetMapping("/shop")
    public ModelAndView shop() {
        ModelAndView mav = new ModelAndView("shop");
        mav.addObject("brands", brandService.findAll());
        return mav;
    }
}

package com.inexture.ecommerce.controller;

import com.inexture.ecommerce.dto.CartDTO;
import com.inexture.ecommerce.dto.ProductDTO;
import com.inexture.ecommerce.model.Brand;
import com.inexture.ecommerce.model.Product;
import com.inexture.ecommerce.model.User;
import com.inexture.ecommerce.service.BrandService;
import com.inexture.ecommerce.service.CartService;
import com.inexture.ecommerce.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class ProductController {

    @Autowired
    BrandService brandService;

    @Autowired
    ProductService productService;

    @Autowired
    CartService cartService;

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

    @GetMapping("/product-detail")
    public ModelAndView productDetail(@RequestParam("productId") String productId){
        ModelAndView mav = new ModelAndView("product-detail");
        ProductDTO productDTO = productService.findById(Long.parseLong(productId));
        Brand brand = brandService.findById(productDTO.getBrand().getBrandId()).orElse(null);
        mav.addObject("brand",brand);
        mav.addObject("product",productDTO);
        return mav;
    }

    @GetMapping("/add-to-cart")
    public ModelAndView addToCart(ModelAndView modelAttribute, @RequestParam String quantity, HttpServletRequest httpServletRequest){
        modelAttribute.setViewName("product-detail");
        Map<String,Object> mv = modelAttribute.getModel();
        ProductDTO productDTO = (ProductDTO) mv.get("product");
        if (productDTO != null) {
            CartDTO cartDTO = new CartDTO();
            Product product = new Product();
            BeanUtils.copyProperties(productDTO, product);
            cartDTO.setProduct(product);
            cartDTO.setQuantity(Integer.parseInt(quantity));
            cartDTO.setUser((User) httpServletRequest.getSession().getAttribute("user"));
            cartService.addToCart(cartDTO);
        } else {
            modelAttribute.addObject("error", "Product not found");
        }
        return modelAttribute;
    }
}

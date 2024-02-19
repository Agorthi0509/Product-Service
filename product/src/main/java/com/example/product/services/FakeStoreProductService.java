package com.example.product.services;

import com.example.product.AppConfig.ApplicationConfiguration;
import com.example.product.DTO.ProductRequestDto;
import com.example.product.DTO.ProductResponseDto;
import com.example.product.exceptions.InvalidIdException;
import com.example.product.models.Category;
import com.example.product.models.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpMessageConverterExtractor;
import org.springframework.web.client.RequestCallback;
import org.springframework.web.client.RestTemplate;

import javax.management.relation.InvalidRelationIdException;
import java.util.ArrayList;
import java.util.List;

@Service
public class FakeStoreProductService implements IProductService {
    @Autowired
    RestTemplate restTemplate;
    public Product getProductFromResponseDto(ProductResponseDto responseDto){
        Product product = new Product();
        product.setId(responseDto.getId());
        product.setName(responseDto.getTitle());
        product.setPrice(responseDto.getPrice());
        product.setDescription(responseDto.getDescription());
        product.setImage(responseDto.getImage());

        Category category = new Category();
        category.setName(responseDto.getCategory());

        product.setCategory(category);
        return product;
    }

    @Override
    public Product getSingleProduct(Long id) throws InvalidIdException {
//        RestTemplate restTemplate=new RestTemplate();
        if(id>20){
            throw new InvalidIdException();
        }
        ProductResponseDto response = restTemplate.getForObject("https://fakestoreapi.com/products/" + id, ProductResponseDto.class);
        return getProductFromResponseDto(response);
    }
    public List<Product> getAllProducts() {
//        RestTemplate restTemplate=new RestTemplate();
        List<Product> products= new ArrayList<>();
        ProductResponseDto presponse[] = restTemplate.getForObject("https://fakestoreapi.com/products/" , ProductResponseDto[].class);
        for(ProductResponseDto response: presponse){
            products.add(getProductFromResponseDto(response));
        }
        return products;
    }

    public Product updateProduct(Long id, ProductRequestDto productRequestDto){

      restTemplate.put("https://fakestoreapi.com/products/"+id,ProductRequestDto.class);

//        RequestCallback requestCallback = httpEntityCallback(request);
//        execute(url, HttpMethod.PUT, requestCallback, null, uriVariables);
//        return  getSingleProduct(id);



        RequestCallback requestCallback = restTemplate.httpEntityCallback(productRequestDto,ProductRequestDto.class);
        HttpMessageConverterExtractor<ProductResponseDto> responseExtractor =
                new HttpMessageConverterExtractor<>(ProductResponseDto.class, restTemplate.getMessageConverters());
         ProductResponseDto productResponseDto=restTemplate.execute("https://fakestoreapi.com/products/"+id, HttpMethod.PUT, requestCallback, responseExtractor);
         return getProductFromResponseDto(productResponseDto);


    }


}

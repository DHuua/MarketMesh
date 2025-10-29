package com.hero.marketmesh.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
@Entity
@Table(name = "products")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Size(min = 2, max = 200)
    @Column(nullable = false, length = 200)
    private String name;

    @Size(max = 1000)
    @Column(length = 1000)
    private String description;

    @NotNull
    @DecimalMin("0.01")
    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @NotNull
    @Min(0)
    @Column(nullable = false)
    private Integer stockQuantity;

    @Size(max = 50)
    @Column(length = 50)
    private String category;

    // Supplier Information — делаем все nullable с дефолтным значением через @PrePersist
    @Column(length = 100)
    private String shopName;

    @Column(length = 100)
    private String contact;

    @Column(length = 15)
    private String mobile;

    // Product Details
    @Column(length = 100)
    private String packing;

    @Column(length = 50)
    private String placeOfOrigin;

    // Image storage
    @Column(length = 255)
    private String imageUrl;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(nullable = false)
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();

        if (shopName == null) shopName = "Unknown Shop";
        if (contact == null) contact = "Unknown Contact";
        if (mobile == null) mobile = "0000000000";
        if (packing == null) packing = "";
        if (placeOfOrigin == null) placeOfOrigin = "";
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}

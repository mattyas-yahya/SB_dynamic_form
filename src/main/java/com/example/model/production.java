package com.example.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;
@Getter @Setter @NoArgsConstructor
@Entity
@Table(name = "production")
public class production
{
        @Id
        @GeneratedValue(generator = "uuid")
        @GenericGenerator(name = "uuid", strategy = "uuid2")
        @Column(name = "id_production", unique = true, nullable = false)
         String id_production;
         String id_inventory;
        @Column(unique=true)
         String batch_number;
         String product_ref;
         String product_name;
         String production_order;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        @Column(name="production_date", nullable=false)
        @Temporal(TemporalType.DATE)
         Date production_date;
         String note;
    }



package com.example.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;
@Getter @Setter 
@Entity
@Table(name = "inventory")
public class inventory
{
        @Id
        @GeneratedValue(generator = "uuid")
        @GenericGenerator(name = "uuid", strategy = "uuid2")
        @Column(name = "id_inventory", unique = true, nullable = false)
         String id_inventory;
         String item_number;
        @Column(unique=true)
         String product_ref;
         String product_name;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        @Column(name="purchase_date", nullable=false)
        @Temporal(TemporalType.DATE)
         Date purchase_date;
         String grup;
         String model;
         String location;
         String inventory_tag;
         double purchase_price;
         String guarante;

    }



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
@Table(name = "production_line")
public class production_line
{
        @Id
        @GeneratedValue(generator = "uuid")
        @GenericGenerator(name = "uuid", strategy = "uuid2")
        @Column(name = "id_production_line", unique = true, nullable = false)
         String id_production_line;
         String id_production_ln;
          String id_inventory_ln;
          String batch_number_ln;
         String batch_order_ln;
         String product_ref_ln;
         String product_name_ln;
         String production_qty_ln;
         
    }



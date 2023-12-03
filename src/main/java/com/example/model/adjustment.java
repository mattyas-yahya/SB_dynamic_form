package com.example.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;
@Getter @Setter @NoArgsConstructor
@Entity
@Table(name = "adjustment")
public class adjustment
{
        @Id
        @GeneratedValue(generator = "uuid")
        @GenericGenerator(name = "uuid", strategy = "uuid2")
        @Column(name = "id_adjustment", unique = true, nullable = false)
        private String id_adjustment;
         private String id_inventory;
        @NotEmpty
        @Size(min=1, max=30)
        private String item_number;
        @NotEmpty
        @Size(min=1, max=30)
        private String product_ref;
        @NotEmpty
        private String product_name;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        @Column(name="adjustment_date", nullable=false)
        @Temporal(TemporalType.DATE)
        private Date adjustment_date;
        @NotEmpty
        private String begin_balance;
        @NotEmpty
        private String adjustment;
        @NotEmpty
        private String location;
        private double purchase_price;


    }



package com.example.control.rest;

import com.example.model.*;
import com.example.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.DataInputStream;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.validation.Valid;

@RequestMapping("/inventory")
@RestController
public class control_inventory_rest
{
        @Autowired
        private repo_inventory ri;
 
        private static final Logger LOGGER = LoggerFactory.getLogger(control_inventory_rest.class);


        @RequestMapping(path="/All", method= RequestMethod.GET)
        public List<inventory> getAll()
        {
            return (List)this.ri.findAll();
        }




        @PostMapping("/Save")
        public List<inventory> createMultiple(@RequestBody List<inventory> inventoryList) 
        {
            LOGGER.info("Menerima permintaan POST dengan data: " + inventoryList);
    
            // Coba menyimpan data
            List<inventory> savedinventoryList = ri.saveAll(inventoryList);
    
            LOGGER.info("Data berhasil disimpan: " + savedinventoryList);
    
            return savedinventoryList;
        }
   

    }



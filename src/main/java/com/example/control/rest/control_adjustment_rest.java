package com.example.control.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.adjustment;
import com.example.repo.repo_adjustment;

@RequestMapping("/adjustment")
@RestController
public class control_adjustment_rest
{
        @Autowired
        private repo_adjustment rad;
 
        private static final Logger LOGGER = LoggerFactory.getLogger(control_adjustment_rest.class);


        @RequestMapping(path="/All", method= RequestMethod.GET)
        public List<adjustment> getAll()
        {
            return (List)this.rad.findAll();
        }




        @PostMapping("/Save")
        public List<adjustment> createMultiple(@RequestBody List<adjustment> adjustmentList) 
        {
            LOGGER.info("Menerima permintaan POST dengan data: " + adjustmentList);
            List<adjustment> savedadjustmentList = rad.saveAll(adjustmentList);
            LOGGER.info("Data berhasil disimpan: " + savedadjustmentList);
            return savedadjustmentList;
        }
   

    }



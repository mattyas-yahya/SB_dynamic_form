package com.example.control.rest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.production;
import com.example.model.production_line;
import com.example.repo.repo_production;
import com.example.repo.repo_production_line;

@RequestMapping("/production")
@RestController
public class control_production_rest
{
        @Autowired
         repo_production rap;

  @Autowired
         repo_production_line rapl;

        private static final Logger LOGGER = LoggerFactory.getLogger(control_production_rest.class);


        @RequestMapping(path="/All", method= RequestMethod.GET)
        public List<production> getAll()
        {
            return (List)this.rap.findAll();
        }

 @RequestMapping(path="/line/All", method= RequestMethod.GET)
        public List<production_line> getAllLine()
        {
            return (List)this.rapl.findAll();
        }



        @PostMapping("/Save")
        public List<production> createMultiple(@RequestBody List<production> productionList) 
        {
            LOGGER.info("Menerima permintaan POST dengan data: " + productionList);
                List<production> SavedProductionList = rap.saveAll(productionList);
            LOGGER.info("Data berhasil disimpan: " + SavedProductionList);
            return SavedProductionList;
        }


   @PostMapping("/line/Save")
public ResponseEntity<List<production_line>> createMultipleLine(@RequestBody List<production_line> production_line_List) 
{
    try {
        LOGGER.info("Menerima permintaan POST /line/Save dengan data: " + production_line_List);
        List<production_line> savedProductionLineList = rapl.saveAll(production_line_List);
        LOGGER.info("Data /line/Save disimpan: " + savedProductionLineList);
        return new ResponseEntity<>(savedProductionLineList, HttpStatus.OK);
    } catch (Exception e) {
        LOGGER.error("Error while saving production lines", e);
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}


    }



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.control;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.inventory;
import com.example.repo.repo_inventory;

import net.datafaker.Faker;

@Controller
public class control_inventory
{
 @Autowired
	repo_inventory riv;

@RequestMapping(value={"/inventory"})
public String inventory()
{
return "inventory/inventory";
}

  @GetMapping({"/inventory"})
  public String inventory_form(Model model)
  {
    try {
			try {
                inventory it= new inventory();
                Faker fak = new Faker();
				Date dt= new Date();
			 SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

               for(int i=0; i<=200; i++)
                     {
               
                         it.setId_inventory(UUID.randomUUID().toString());
                         it.setItem_number(fak.phoneNumber().cellPhone().toString());
						 it.setProduct_ref(fak.regexify("[A-Z0-9]{10}"));
						 it.setProduct_name(fak.coffee().blendName());
						 it.setPurchase_date(dt);
						 it.setGrup(fak.coffee().descriptor());
						 it.setModel(fak.coffee().body());
						 it.setLocation(fak.coffee().country());
						 it.setInventory_tag(fak.coffee().blendName());
						 it.setPurchase_price(34000);
						 it.setGuarante("12");
					//	riv.save(it);
                     }
                   } catch (DataIntegrityViolationException e)
                    {
                     System.out.print(e);
                 }
 } catch (ConstraintViolationException e)
                    {
                     System.out.print(e);
                 }

    model.addAttribute("inventory", new inventory());
    return "inventory/inventory";
  }

}

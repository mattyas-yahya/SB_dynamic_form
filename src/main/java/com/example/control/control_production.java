/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.control;
import com.example.model.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class control_production
{


@RequestMapping(value={"/production"})
public String production()
{
return "production/production";
}

  @GetMapping({"/production"})
  public String production_form(Model model)
  {
    model.addAttribute("production", new production());
    return "production/production";
  }

}

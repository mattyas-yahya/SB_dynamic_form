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
public class control_adjustment
{


@RequestMapping(value={"/adjustment"})
public String adjustment()
{
return "adjustment/adjustment";
}

  @GetMapping({"/adjustment"})
  public String adjustment_form(Model model)
  {
    model.addAttribute("adjustment", new adjustment());
    return "adjustment/adjustment";
  }

}

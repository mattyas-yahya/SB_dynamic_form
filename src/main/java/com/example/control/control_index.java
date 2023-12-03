package com.example.control;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.ApplicationRestarter;

import org.springframework.context.ApplicationContext;


@ControllerAdvice
@Controller
@RequestMapping("/index")
public class control_index
{
    public control_index(ApplicationContext applicationContext)
    {
this.applicationContext=applicationContext;
    }
        ApplicationContext applicationContext ;

    @GetMapping({"/index"})
    public String adjustment_form()
    {
        return "index/index";
    } 

     @GetMapping("/restart")
    public void restart() 
    {
        ApplicationRestarter ar = new ApplicationRestarter(applicationContext );
        ar.restart();

    } 
}


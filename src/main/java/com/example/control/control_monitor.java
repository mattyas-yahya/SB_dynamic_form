package com.example.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@ControllerAdvice
@Controller
@RequestMapping("/monitor")

public class control_monitor
{
    @RequestMapping(value={"/monitor"})
    public String monitor()
    {
        return "/monitor";
    }

    @GetMapping({"/monitor"})
    public String monitor_form()
    {
        return "/monitor";
    }
}

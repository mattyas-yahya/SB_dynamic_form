package com.example.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class control_report
{
    @RequestMapping(value={"/report"})
    public String moveout()
    {
        return "report/report";
    }

    @GetMapping({"/report"})
    public String moveout_form()
    {
        return "report/report";
    }
}

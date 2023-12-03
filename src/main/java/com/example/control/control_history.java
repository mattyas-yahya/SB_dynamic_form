package com.example.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class control_history
{
    @RequestMapping(value={"/histori"})
    public String x() {
        return "histori/histori";
    }
    @RequestMapping(value={"/histori_cost"})
    public String z() {
        return "histori/histori_cost";
    }
}

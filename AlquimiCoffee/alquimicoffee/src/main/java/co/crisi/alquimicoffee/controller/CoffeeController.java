package co.crisi.alquimicoffee.controller;

import co.crisi.alquimicoffee.model.request.PrepareDrinkRequest;
import co.crisi.alquimicoffee.model.response.DrinkPreparedResponse;
import co.crisi.alquimicoffee.service.ICoffeeService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/drinks")
@CrossOrigin(origins = "*")
public class CoffeeController {

    private final ICoffeeService service;

    @PostMapping("/prepare")
    public DrinkPreparedResponse prepareDrink(@RequestBody PrepareDrinkRequest request){
        return service.prepareDrink(request);
    }
}

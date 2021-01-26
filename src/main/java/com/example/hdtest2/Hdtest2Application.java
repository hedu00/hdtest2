package com.example.hdtest2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import java.io.IOException;
import java.util.Date;

@SpringBootApplication
@RestController
public class Hdtest2Application {

	public static void main(String[] args) {
		SpringApplication.run(Hdtest2Application.class, args);
	}

	@Autowired
	RestTemplate restTemplate;

	@GetMapping("/hdtest2")
	public String hdtest2(@RequestParam(value = "name", defaultValue = "hedu") String name) throws IOException {

		String url = "http://hdtest1/getdate1";
		return String.format(restTemplate.getForObject(url,String.class) + ", I am %s\n",name);

	}

	@GetMapping("/getdate2")
	public String getdate2(){

		Date date = new Date() ;

		return String.format(" --> This is hdtest2 v2: " + date.toString() + " <-- \n");

	}
}

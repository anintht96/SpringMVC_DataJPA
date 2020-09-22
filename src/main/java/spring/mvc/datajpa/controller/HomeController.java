package spring.mvc.datajpa.controller;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.datajpa.dao.CustomerRepository;
import spring.mvc.datajpa.entities.Customer;

@Controller
public class HomeController {

	@Autowired
	private CustomerRepository customerRepository;

	@PostConstruct
	public void initData() {
		customerRepository.deleteAll();
		System.out.println("____________Reset and init data___________ ");
		for (int i = 0; i < 100; i++) {
			customerRepository.save(new Customer(i, "name" + i, "address" + i, i));
		}
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getAllCustomer() {
		return new ModelAndView("index", "list", customerRepository.findAll());
	}

	@RequestMapping(value = "/customer-save", method = RequestMethod.GET)
	public ModelAndView getCustomerSave(@ModelAttribute(value = "customer") Customer customer) {
		return new ModelAndView("customer-save");
	}

	@RequestMapping(value = "/customer-save", method = RequestMethod.POST)
	public ModelAndView postCustomerSave(@ModelAttribute(value = "customer") Customer customer) {
		customerRepository.save(customer);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/customer-view/{id}", method = RequestMethod.GET)
	public ModelAndView getCustomerView(@PathVariable(value = "id") int id) {
		return new ModelAndView("customer-view", "view", customerRepository.findById(id).get());
	}

	@RequestMapping(value = "/customer-edit/{id}", method = RequestMethod.GET)
	public ModelAndView getCustomerEdit(@ModelAttribute(value = "customer") Customer customer,
			@PathVariable(value = "id") int id) {
		return new ModelAndView("customer-edit", "customer", customerRepository.findById(id).get());
	}

	@RequestMapping(value = "/customer-edit", method = RequestMethod.POST)
	public ModelAndView postCustomerEdit(@ModelAttribute(value = "customer") Customer customer) {
		customerRepository.save(customer);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "customer-delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable(name = "id") Integer id) {
		customerRepository.deleteById(id);
		return "redirect:/";
	}

	@RequestMapping(value = "/customer-age-greater/{age}", method = RequestMethod.GET)
	public ModelAndView getAllCustomerAge(@PathVariable(value = "age") int age) {
		return new ModelAndView("customer-list", "list", customerRepository.findByAgeGreaterThan(age));
	}

	@RequestMapping(value = "/customer-page",method = RequestMethod.GET)
	public ModelAndView pageCustomer(@RequestParam(name = "page",required = false,defaultValue = "0")Integer page,@RequestParam(name = "size",required = false,defaultValue = "5")Integer size,@RequestParam(name = "sort",required = false,defaultValue = "ASC")String sort) {
		Sort sortable=null;
		if(sort.equals("ASC")) {
			sortable=Sort.by("id").ascending();
		}
		if(sort.equals("DESC")) {
			sortable=Sort.by("id").descending();
		}
		Pageable pageable=PageRequest.of(page, size, sortable);
		Page<Customer> pageCustomer=customerRepository.findAll(pageable);
		return new ModelAndView("customer-page", "page", pageCustomer.getContent());
	}
}

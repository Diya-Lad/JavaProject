package springProject.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;


import springProject.dao.ProductDao;
import springProject.model.Product;

@Controller
public class MainController {
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	public String ProductPage() {
		return "productPage";
	}
	
	@RequestMapping("productList")
	public String home(Model m) {
		List<Product> products=productDao.getAllProduct();
		m.addAttribute("product", products);
		return "index";
	}
	
	//show add product form
	@RequestMapping("/addProduct")
	public String addProduct(Model model) {
		model.addAttribute("title","Add Product page");
		return "add-product";
	}
	
	//handle add product form
	@RequestMapping(value="/handle-product",method=RequestMethod.POST)
	public RedirectView handleProduct(@ModelAttribute("product") Product product,HttpServletRequest request) {
		System.out.println(product);
		productDao.CreateProduct(product);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView;
	}
	
	//Delete product
	@RequestMapping("/delete/{productId}")
	public RedirectView deleteProduct(@PathVariable("productId") int productId,HttpServletRequest request) {
		this.productDao.deleteProduct(productId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView;
	}
	
	//Update product
		@RequestMapping("/update/{productId}")
		public String updateForm(@PathVariable("productId") int pId,Model model) {
			Product p=this.productDao.getProduct(pId);
			model.addAttribute("productUpdate", p);
			return "update_form";
		}
		
		@RequestMapping(value = "/imageDisplay/{id}", method = RequestMethod.GET)
		public void showImage(@RequestParam("id") Integer itemId, HttpServletResponse response,HttpServletRequest request) 
		          throws ServletException, IOException{
			
			System.out.println("yes");
		    Product p = productDao.getProduct(itemId);
		    response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		    response.getOutputStream().write(p.getData());
		    response.getOutputStream().close();
		}
}

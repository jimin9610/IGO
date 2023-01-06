package org.igo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.igo.domain.PageDTO;
import org.igo.domain.AskVO;
import org.igo.domain.Criteria;
import org.igo.domain.RequestVO;
import org.igo.service.AskService;
import org.igo.service.FixerService;
import org.igo.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/client/*")
@AllArgsConstructor
public class ClientController {

	private RequestService reqService;
	
	private AskService askService;
	
	private FixerService fixerService;
	
	private HttpSession session;
	
	@GetMapping("/")
	public void home() {		
		
		session.invalidate();
		
	}
	
	@GetMapping("/submit")
	public void submit() {		
		
	}
	
	@PostMapping("/submitProcess")
	public String submitProcess(RequestVO requestVO) {
		
		System.out.println(requestVO);

		reqService.insert(requestVO);
		
		return "redirect:/";
		
	}
	
	@GetMapping("/list")
	public void showList(Criteria cri, Model model) {
		
		String name = (String)session.getAttribute("rname");
		String phone = (String)session.getAttribute("rphone");
		
		model.addAttribute("rname", name);
		model.addAttribute("rphone", phone);
		
		System.out.println(cri);
		
		model.addAttribute("list", reqService.getRListWithPaging(cri,name,phone));
		
		int total = reqService.getTotalCount(cri,name,phone);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/login")
	public void login(@RequestParam("category") String cat, Model model) {
		
		System.out.println(cat);
		
		model.addAttribute("category", cat);
		
	}
	
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout() {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@PostMapping("/loginProcess")
	public String loginProcess(@RequestParam("name") String name,@RequestParam("phone") String phone,@RequestParam("category") String cat,Model model) {
		
		System.out.println(name + " " + phone + " " + cat);
		
		if(cat.equals("list")) {

			String reqYN = reqService.login(name, phone);
			
			System.out.println(reqYN);
			
			if(!reqYN.equals("0")) {
				
				session.setAttribute("rname", name);
				session.setAttribute("rphone", phone);
				
				return "redirect:/client/list";
				
			}else{
			
				session.invalidate();
				model.addAttribute("msg", "error");
				return "/client/login";
			
			}
			
		}else if(cat.equals("q_list")) {
			
			String askYN = askService.login(name, phone);
			
			System.out.println(askYN);
			
			if(!askYN.equals("0")) {
				
				session.setAttribute("aname", name);
				session.setAttribute("aphone", phone);
				
				return "redirect:/client/q_list";
			
			}else{
				
				session.invalidate();
				model.addAttribute("msg", "error");
				return "/client/login";
			
			}
				
		}else{
			
			model.addAttribute("msg", "unknownlist");
			return "/client/login";
		
		}
		
		
			
	}
	
	@GetMapping("/read")
	public void read(@RequestParam("rid") int rid, @ModelAttribute("cri") Criteria cri ,Model model) {	
		
		model.addAttribute("request",reqService.read(rid));
		
	}
	
	@PostMapping("/cancel")
	public String cancel(@RequestParam("rid") int rid) {
		
		reqService.cancel(rid);
		
		return "redirect:/client/list";
		
	}
	
	@PostMapping("/editProcess")
	public String editProcess(RequestVO requestVO, @ModelAttribute("cri") Criteria cri,Model model) {
		
		System.out.println(requestVO);
		
		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("amount", cri.getAmount());
		model.addAttribute("type", cri.getType());

		reqService.update(requestVO);
		
		return "redirect:/client/list";
		
	}
	
	@PostMapping("/acceptProcess")
	public String acceptProcess(RequestVO requestVO) {
		
		requestVO.setStatus("S");
		
		reqService.accept(requestVO);
		
		return "redirect:/fixer/mypage";
		
	}
	
	@GetMapping("/question")
	public void question(Model model) {
		
	}
	

	@PostMapping("/askProcess")
	public String askProcess(AskVO askVO) {
		
		System.out.println(askVO);

		askService.insert(askVO);
		
		return "redirect:/";
		
	}
	
	@GetMapping("/q_list")
	public void q_list(Criteria cri,Model model) {
		
		String name = (String)session.getAttribute("aname");
		String phone = (String)session.getAttribute("aphone");
		
		model.addAttribute("aname", name);
		model.addAttribute("aphone", phone);
		
		System.out.println(cri);
		
		model.addAttribute("list", askService.getListWithPaging(cri,name,phone));
		
		int total = askService.getTotalCount(cri,name,phone);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/q_read")
	public void q_read(@RequestParam("aid") int aid,Model model) {	
		
		model.addAttribute("ask",askService.read(aid));
		
	}
	

	@PostMapping("/q_editProcess")
	public String q_editProcess(AskVO askVO) {
		
		System.out.println(askVO);

		askService.update(askVO);
		
		return "redirect:/client/q_list";
		
	}
	
	@GetMapping("/info")
	public void info(@RequestParam("fid") int fid, Model model) {
		
		model.addAttribute("fid", fid);
		model.addAttribute("info", fixerService.read());
		session.setAttribute("score", fixerService.score(fid));
		
		System.out.println(fid);
		System.out.println(fixerService.read());
		
	}
	
	@GetMapping("/score")
	public void score() {		
		
	}
	
	@GetMapping("/fixList")
	public void fixList(Model model, @RequestParam("rid") int rid,@RequestParam("fid") int fid) {
		
		System.out.println(rid);
		
		System.out.println(fixerService.done(rid));

		model.addAttribute("fid", fid);
		model.addAttribute("info", fixerService.read());
		model.addAttribute("rid",rid);
		model.addAttribute("done",fixerService.done(rid));
		
	}
	
	@PostMapping("/payment")
	public String paid(RequestVO requestVO) {
		
		reqService.pay(requestVO);
		
		return "redirect:/client/list";
		
	}
	
	
}

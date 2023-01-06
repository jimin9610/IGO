package org.igo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.igo.domain.AnswerVO;
import org.igo.domain.AskVO;
import org.igo.domain.Criteria;
import org.igo.domain.FixListVO;
import org.igo.domain.FixerVO;
import org.igo.domain.PageDTO;
import org.igo.domain.RequestVO;
import org.igo.service.AnswerService;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/fixer/*")
@AllArgsConstructor
public class FixerController {

	private FixerService fixService;

	private RequestService reqService;
	
	private AskService askService;
	
	private AnswerService answerService;

	private HttpSession session;

	@GetMapping("/login")
	public void login() {

	}

	@PostMapping("/loginProcess")
	public String loginProcess(@RequestParam("fname") String fname, @RequestParam("password") String password,
			Model model) {

		System.out.println(fname + " " + password);

		int fid = fixService.login(fname, password);

		if (fid != 0) {
			
			System.out.println(fixService.score(fid));
			session.setAttribute("fid", fid);
			session.setAttribute("fname", fname);
			model.addAttribute("fid", fid);
			session.setAttribute("score", fixService.score(fid));
			System.out.println((Integer) session.getAttribute("fid"));
			System.out.println((String) session.getAttribute("fname"));
			return "redirect:/fixer/mypage";

		} else {

			model.addAttribute("msg", "error");
			return "/fixer/login";

		}

	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout() {

		session.invalidate();

		return "redirect:/fixer/login";
	}

	@GetMapping("/add")
	public void add() {

	}

	@PostMapping("/addProcess")
	public String addProcess(FixerVO fixerVo, MultipartHttpServletRequest multi) throws IOException{
		
         MultipartFile file = multi.getFile("file");
                
         String path="";
         UUID randomeUUID = UUID.randomUUID();
                  
         if(file!=null){
        
          System.out.println("파라미터명" + file.getName());
          System.out.println("파일크기" + file.getSize());
          System.out.println("파일 존재" + file.isEmpty());
          System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
        
          
          path = "C:\\Spring Framework\\IGO\\src\\main\\webapp\\resources\\images\\";
          InputStream inputStream = null;
          OutputStream outputStream = null;
          
          String organizedfilePath="";
          
          try {
              
 
              if (file.getSize() > 0) {
                  inputStream = file.getInputStream();
                  File realUploadDir = new File(path);
                  
                  if (!realUploadDir.exists()) {
                      realUploadDir.mkdirs();//폴더생성.
                  }
                  
                  
                  organizedfilePath = path + randomeUUID + "_" + file.getOriginalFilename();
                  fixerVo.setProfile(randomeUUID + "_" + file.getOriginalFilename());
                  System.out.println(organizedfilePath);//파일이 저장된경로 + 파일 명
                  
                  outputStream = new FileOutputStream(organizedfilePath);
 
                  int readByte = 0;
                  byte[] buffer = new byte[8192];
 
                  while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
                      outputStream.write(buffer, 0, readByte); //파일 생성 ! 
                      
                  }
            
                  
              }
              
          } catch (Exception e) {
              // TODO: handle exception
              e.printStackTrace();
 
          } finally {
 
              outputStream.close();
              inputStream.close();
          }
          
      
                 
         }   
		
		fixService.add(fixerVo);

		return "redirect:/";
	}

	@GetMapping("/accept")
	public void accept(Model model, @ModelAttribute("cri") Criteria cri) {
		
		int fid = (int) session.getAttribute("fid");
		
		model.addAttribute("list", fixService.getRListWithPaging(cri));
		
		int total = fixService.getRTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/acceptProcess")
	public String acceptProcess(Model model,@RequestParam("fid") int fid, @RequestParam("rid") int rid, @ModelAttribute("cri") Criteria cri) {

		model.addAttribute("pageNum", cri.getPageNum());
		model.addAttribute("amount", cri.getAmount());
		
		fixService.accept(fid, rid);

		return "redirect:/fixer/accept";

	}

	@GetMapping("/q_list")
	public void q_list(Model model, @ModelAttribute("cri") Criteria cri) {
		
		int fid = (int) session.getAttribute("fid");
		
		model.addAttribute("list", fixService.getAListWithPaging(cri));
		
		int total = fixService.getATotalCount();
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}

	@GetMapping("/f_read")
	public void f_read(@RequestParam("rid") int rid, Model model) {

		model.addAttribute("request", reqService.read(rid));

	}

	@GetMapping("/mypage")
	public void mypage(Model model, Criteria cri) {

		model.addAttribute("info", fixService.read());

//		model.addAttribute("list", fixService.getList());

		model.addAttribute("fid", session.getAttribute("fid"));
		
		int fid = (int)session.getAttribute("fid");
		
		model.addAttribute("list", fixService.getFListWithPaging(cri, fid));

		int total = fixService.getFTotalCount(cri,fid);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		System.out.println(session.getAttribute("fid"));

	}

	@GetMapping("/edit")
	public void edit(@RequestParam("fid") int fid, Model model) {

		model.addAttribute("info", fixService.infoRead(fid));

		System.out.println(fixService.infoRead(fid));

	}

	@PostMapping("/updateFixer")
	public String fixerUpdate(FixerVO fixerVO,MultipartHttpServletRequest multi) throws IOException {
		
		MultipartFile file = multi.getFile("file");
        
		System.out.println("파일명 : " + file.getName());
		
        String path="";
        UUID randomeUUID = UUID.randomUUID();
                 
        if(file!=null && file.getName().equals("file")){
       
         System.out.println("파라미터명" + file.getName());
         System.out.println("파일크기" + file.getSize());
         System.out.println("파일 존재" + file.isEmpty());
         System.out.println("오리지날 파일 이름" + file.getOriginalFilename());
       
         
         path = "C:\\Spring Framework\\IGO\\src\\main\\webapp\\resources\\images\\";
         InputStream inputStream = null;
         OutputStream outputStream = null;
         
         String organizedfilePath="";
         
         try {
             

             if (file.getSize() > 0) {
            	 
                 inputStream = file.getInputStream();
                 File realUploadDir = new File(path);
                 
                 if (!realUploadDir.exists()) {
                     realUploadDir.mkdirs();//폴더생성.
                 }
                 
                 
                 organizedfilePath = path + randomeUUID + "_" + file.getOriginalFilename();
                 System.out.println(organizedfilePath);//파일이 저장된경로 + 파일 명
                 
                 outputStream = new FileOutputStream(organizedfilePath);

                 int readByte = 0;
                 byte[] buffer = new byte[8192];

                 while ((readByte = inputStream.read(buffer, 0, 8120)) != -1) {
                     outputStream.write(buffer, 0, readByte); //파일 생성 ! 
                     
                 }
           
                 
             }
             
         } catch (Exception e) {
             // TODO: handle exception
             e.printStackTrace();

         } finally {

             outputStream.close();
             inputStream.close();
         }
         
     
                
        }

        fixerVO.setProfile(randomeUUID + "_" + file.getOriginalFilename());
        
        System.out.println(fixerVO.getProfile());

		fixService.updateFixer(fixerVO);

		return "redirect:/fixer/mypage";

	}

	@GetMapping("/question")
	public void question(@RequestParam("aid") int aid,Model model) {
		
		model.addAttribute("list", askService.read(aid));

	}

	@GetMapping("/answer")
	public void answer(@RequestParam("aid") int aid, Model model) {
		
		model.addAttribute("info", fixService.read());
		model.addAttribute("aid", aid);
		 
	}
	
	@PostMapping("/a_insert")
	public String insert_answer(AnswerVO answerVO,AskVO askVO) {
		
		System.out.println(answerVO);
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		
		Date date = new Date();
		
		String now = format.format(date);
		
		answerVO.setRegDate(now);
		
		System.out.println(now);
		
		System.out.println(answerVO);
		
		answerService.insert(answerVO);
		answerService.done(askVO);
		
		return "redirect:/fixer/q_list";
		
	}
	
	@GetMapping("/check_answer")
	public void check_answer(@RequestParam("aid") int aid, Model model) {
		
		model.addAttribute("aid",aid);
	 	model.addAttribute("ans",answerService.read(aid));
	 	model.addAttribute("fixer", answerService.fixerRead());
	 	
	 	System.out.println(aid);
	 	System.out.println(answerService.read(aid));
		
	}
	
	@GetMapping("/fixList")
	public void fixList(Model model, @RequestParam("rid") int rid) {
		
		System.out.println(fixService.cat(rid));
		
		System.out.println(session.getAttribute("fid"));
		System.out.println(rid);
		System.out.println(fixService.done(rid));
		
		model.addAttribute("request", reqService.read(rid));
		model.addAttribute("info", fixService.read());
		model.addAttribute("category",fixService.cat(rid));
		model.addAttribute("rid",rid);
		model.addAttribute("done",fixService.done(rid));
		
	}
	
	@PostMapping("/fixadd")
	public String add(FixListVO fixListVO, int rid, String fixList) {
		
		System.out.println(fixList);
		
		String Lcode = fixList.substring(0, fixList.indexOf("-"));
		String Mcode = fixList.substring(fixList.indexOf("-")+1, fixList.length());
		
		System.out.println(Lcode + " " + Mcode);
		
		fixListVO.setLcode(Lcode);
		fixListVO.setMcode(Mcode);
		
		System.out.println(fixListVO);
		
		fixService.insert(fixListVO);
		
		fixService.doneRequest(rid);
		
		System.out.println(rid);
	
		return "redirect:/fixer/fixList?rid="+rid;
		
	}
	
	@PostMapping("/list_delete")
	public String delete(int rid, FixListVO fixListVO) {
		
		fixService.delete(fixListVO);
		
		return "redirect:/fixer/fixList?rid="+rid;
	}
}

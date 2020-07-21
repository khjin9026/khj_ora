package org.edu.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.edu.service.IF_BoardService;
import org.edu.service.IF_MemberService;
import org.edu.util.FileDataUtil;
import org.edu.vo.BoardVO;
import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//웹브라우저 GET, POST : 둘 다 데이터를 보내는 것(웹브라우저에서 서버컨트롤러로)
//컨트롤러 Class : 내용을 RequestMethod.GET/POST로 받는 것 

//절대경로 -> 어느 위치에 있든 진입가능, /(루트)로 시작,  ex)url주소 - /admin/member/list
//상대경로 -> . 혹은 아예 없이 시작  ex)파일 위치 - admin/member/member_list

//자바프로그램에선 진입점 main이 필요(java application으로 실행)하지만 스프링에선 필요x
@Controller
public class AdminController {
	
	@Inject
	private IF_BoardService boardService;
	
	@Inject
	private IF_MemberService memberService;
	
	@Inject
	private FileDataUtil fileDataUtil;
	
	//첨부파일 업로드 경로를 변수값으로 가져옴
	//uploadPath -> servlet-context.xml에서 가져옴
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	/**
	 * 게시물관리 리스트 입니다.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/admin/board/list", method = RequestMethod.GET)
	public String boardList(@ModelAttribute("pageVO") PageVO pageVO, Locale locale, Model model) throws Exception {
							//local -> 다국어 지원  model -> 데이터베이스 연동
		//PageVO pageVO = new PageVO(); //매개변수로 받기전에 만든 테스트용 
		if(pageVO.getPage() == null) { 
			pageVO.setPage(1); //초기 page변수값 지정
		}
		pageVO.setPerPageNum(10); //1페이 당 보여줄 게시물 수 (강제지정)
		pageVO.setTotalCount(boardService.countBno(pageVO)); //강제로 입력한 값을 쿼리로 대체ok
		List<BoardVO> list = boardService.selectBoard(pageVO);
		//모델클래스로 jsp화면에 boardService에서 셀렉트한 list값을 boardList변수명으로 보냄
	    //model { list -> boardList -> jsp }
		model.addAttribute("boardList", list);
		model.addAttribute("pageVO", pageVO);
		return "admin/board/board_list"; //(.jsp)가 생략된 것
	}
	/**
	 * 게시물관리 상세보기 입니다.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/admin/board/view", method = RequestMethod.GET)
	public String boardView(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("bno") Integer bno,Locale locale, Model model) throws Exception {
		BoardVO boardVO = boardService.viewBoard(bno);
		//여기서부터-------------------------------------------
		List<String> files = boardService.selectAttach(bno);
		String[] filenames = new String[files.size()];
		int cnt = 0;
		for(String fileName : files) {
			filenames[cnt++] = fileName;
		}
		//여러개 파일에서 1개 파일만 받는 것으로 변경
		//String[] filenames = new String[] {files};
		boardVO.setFiles(filenames); //String[]
		//여기까지 첨부파일 때문에 추가-------------------------------
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("pageVO", pageVO);
		return "admin/board/board_view";
	}
	
	/**
	 * 게시물 관리 > 등록 입니다.
	 * @throws Exception 
	 */
	//get용 -> VO값을 받아 업데이트 폼을 보여줌
	@RequestMapping(value = "/admin/board/write", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception {
		
		return "admin/board/board_write";
	}
	//post용 -> 실제 값을...보여줌..?
	@RequestMapping(value = "/admin/board/write", method = RequestMethod.POST)
	public String boardWrite(MultipartFile file, @Valid BoardVO boardVO,Locale locale, RedirectAttributes rdat) throws Exception {
	
		if(file.getOriginalFilename() == "") {
			//첨부파일 없이 첫 등록 할 때
			boardService.insertBoard(boardVO);
		} else {
			String[] files = fileDataUtil.fileUpload(file);
			boardVO.setFiles(files);
			boardService.insertBoard(boardVO);
		}
		rdat.addFlashAttribute("msg", "입력");
		return "redirect:/admin/board/list";
	}
	
	/**
	 * 게시물 관리 > 수정 입니다.
	 * @throws Exception 
	 */
	//get용 -> VO값을 받아 업데이트 폼을 보여줌(기존값)
	@RequestMapping(value = "/admin/board/update", method = RequestMethod.GET)
	public String boardUpdate(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("bno") Integer bno, Locale locale, Model model) throws Exception {
		BoardVO boardVO = boardService.viewBoard(bno);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("pageVO", pageVO);
		return "admin/board/board_update";
	}
	//post용 -> 실제 값을...보여줌..?
	@RequestMapping(value = "/admin/board/update", method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute("pageVO") PageVO pageVO, MultipartFile file,@Valid BoardVO boardVO,Locale locale, RedirectAttributes rdat) throws Exception {
		if(file.getOriginalFilename() == "") {//조건:첨부파일 전송 값이 없다면
			boardService.updateBoard(boardVO);
		}else {
			//기존등록된 첨부파일 삭제처리(아래)
			List<String> delFiles = boardService.selectAttach(boardVO.getBno());
			for(String fileName : delFiles) { //반복문 : delFiles 중에 fileName
				//실제 파일 삭제
				File target = new File(fileDataUtil.getUploadPath(), fileName);
				if(target.exists()) { //조건문 : 해당 경로에 타겟(fileName)이 존재한다면
					target.delete(); //그 타겟(파일)을 삭제함
				} //E.if
			} //E.for
			
			//아래부터 신규 파일 업로드
			String[] files = fileDataUtil.fileUpload(file); //실제파일 업로드 후 파일명 리턴			
			boardVO.setFiles(files); //DB <-> VO(get-set) <->DAO클래스
			boardService.updateBoard(boardVO);
		}
		
		rdat.addFlashAttribute("msg", "수정");
		return "redirect:/admin/board/view?bno=" + boardVO.getBno() + "&page=" + pageVO.getPage();
		// &=매개변수 구분
	}
	
	/**
	 * 게시물관리 > 삭제 입니다.
	 * @throws Exception 
	 */
	//DB만 트랜젝션이 되고 삭제는 안됨!
	@RequestMapping(value = "/admin/board/delete", method = RequestMethod.POST)
	public String boardDelete(@RequestParam("bno") Integer bno, Locale locale, RedirectAttributes rdat) throws Exception {
List<String> files = boardService.selectAttach(bno);
		
		boardService.deleteBoard(bno);
		
		//첨부파일 삭제(아래)
		for(String fileName : files) {
			//삭제 명령문 추가(아래)
			File target = new File(uploadPath, fileName);
			if(target.exists()) {
				target.delete();
			}
		}		
		
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/board/list";
	}
	
	/**
	 * 회원관리 리스트 입니다.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/admin/member/list", method = RequestMethod.GET)
	public String memberList(@ModelAttribute("pageVO") PageVO pageVO,Locale locale, Model model) throws Exception {
		if(pageVO.getPage() == null) {
			pageVO.setPage(1);
		}
		pageVO.setPerPageNum(10);
		pageVO.setTotalCount(memberService.countUserId(pageVO));
		List<MemberVO> list = memberService.selectMember(pageVO);
		//모델클래스로 jsp화면에 boardService에서 셀렉트한 list값을 boardList변수명으로 보냄
	    //model { list -> boardList -> jsp }
		model.addAttribute("memberList", list);
		model.addAttribute("pageVO", pageVO);
		return "admin/member/member_list";
	}
	
	/**
	 * 회원관리 상세보기 입니다.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/admin/member/view", method = RequestMethod.GET)
	public String memberView(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("user_id") String user_id, Locale locale, Model model) throws Exception {
		MemberVO memberVO = memberService.viewMember(user_id);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("memberVO", memberVO);
		return "admin/member/member_view";
	}
	
	/**
	 * 회원관리 > 등록 입니다.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/admin/member/write", method = RequestMethod.GET)
	public String memberWrite(Locale locale, Model model) throws Exception {
		
		return "admin/member/member_write";
	}
	@RequestMapping(value = "/admin/member/write", method = RequestMethod.POST)
	public String memberWrite(@Valid MemberVO memberVO, Locale locale, RedirectAttributes rdat) throws Exception {
		String new_pw = memberVO.getUser_pw(); //예: 현재 1234  // get으로 받아서 암호화 처리 후 set으로 받기
		if(new_pw !="") {
			//스프링 시큐리티 4.x. BCryptPasswordEncoder 암호 사용
			BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder(10);
			String bcryptPassword = bcryptPasswordEncoder.encode(new_pw); //현 비번1234가 암호화 됨
			memberVO.setUser_pw(bcryptPassword); //DB에 들어가기 전 값을 set 시키는 것
		}
		memberService.insertMember(memberVO);
		rdat.addFlashAttribute("msg", "입력");
		return "redirect:/admin/member/list";
	}
	
	/**
	 * 회원관리 > 수정 입니다.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/admin/member/update", method = RequestMethod.GET)
	public String memberUpdate(@ModelAttribute("pageVO") PageVO pageVO, @RequestParam("user_id") String user_id, Locale locale, Model model) throws Exception {
		MemberVO memberVO = memberService.viewMember(user_id);
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("pageVO", pageVO);
		return "admin/member/member_update";
	}
	@RequestMapping(value = "/admin/member/update", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute("pageVO") PageVO pageVO, MemberVO memberVO, Locale locale, RedirectAttributes rdat) throws Exception {
		String new_pw = memberVO.getUser_pw(); //예: 현재 1234  // get으로 받아서 암호화 처리 후 set으로 받기
		if(new_pw !="") {
			//스프링 시큐리티 4.x. BCryptPasswordEncoder 암호 사용
			BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder(10);
			String bcryptPassword = bcryptPasswordEncoder.encode(new_pw); //현 비번1234가 암호화 됨
			memberVO.setUser_pw(bcryptPassword); //DB에 들어가기 전 값을 set 시키는 것
		}
		memberService.updateMember(memberVO);
		rdat.addFlashAttribute("msg", "수정");
		return "redirect:/admin/member/view?user_id=" + memberVO.getUser_id() + "&page=" + pageVO.getPage();
	}
	
	/**
	 * 회원관리 > 삭제 입니다.
	 * @throws Exception 
	 */
	@RequestMapping(value = "/admin/member/delete", method = RequestMethod.POST)
	public String memberDelete(@RequestParam("user_id") String user_id, Locale locale, RedirectAttributes rdat) throws Exception {
		memberService.deleteMember(user_id);
		rdat.addFlashAttribute("msg", "삭제");
		return "redirect:/admin/member/list";
	}
	
	/**
	 * 관리자 홈 입니다.
	 */
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "admin/home";
	}
	
}
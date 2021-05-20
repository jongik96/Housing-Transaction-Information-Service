package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.ArticleDto;
import com.ssafy.happyhouse.service.ArticleService;

@RestController
@CrossOrigin("*")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	//이 컨트롤러에서는 무조건 JSON 결과값만 넘겨줘야함
	//페이지 이동이나 데이터 표시는 vue에서 처리

	@Autowired
	private ArticleService articleService;

	//	@RequestMapping(value="/article/mvwrite", method = RequestMethod.GET)
	//	public String mvWrite() {
	//		System.out.println("in write");
	//		return "write";
	//	}
	//
	//	@RequestMapping(value= "/article/mvmodify", method = RequestMethod.GET)
	//	public String mvModify(@RequestParam("articleno") int articleno, Model model, HttpSession session) throws SQLException {
	//		System.out.println(articleno);
	//		ArticleDto articleDto = articleService.getArticle(articleno);
	//		model.addAttribute("article", articleDto);
	//		return "noticemodify";
	//	}
	
	

	@RequestMapping(value = "/view/{articleno}", method = RequestMethod.GET)
	public ResponseEntity<ArticleDto> getArticle(@PathVariable("articleno") int articleno){
		try {
			ArticleDto notice = articleService.getArticle(articleno);
			return new ResponseEntity<ArticleDto>(notice, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}

	@RequestMapping(value = "/article", method = RequestMethod.GET)
	public ResponseEntity<List<ArticleDto>> ListArticle() {
		try {
			List<ArticleDto> list = articleService.listArticle(); // JSON 리턴
			return new ResponseEntity<List<ArticleDto>>(list, HttpStatus.OK);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}

	@RequestMapping(value = "/article", method = RequestMethod.PUT)
	public ResponseEntity<String> modify(@RequestBody ArticleDto articleDto, HttpSession session) {
		try {
			if(articleService.modifyArticle(articleDto)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			} // 수정 후
			//List<ArticleDto> list = articleService.listArticle(); // JSON 리턴
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		}
		
		// JSON으로 공지사항 리스트만 넘겨줄것.
		// 원래는 이 메서드가 오류처리와 페이지 이동까지 해줬는데
		// JSON만 넘겨서 vue에서 처리를 해줘야 한다.
	}

	@RequestMapping(value = "/article/{articleno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("articleno") int articleno, Model model, HttpSession session) {
		try {
			if(articleService.deleteArticle(articleno)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			} // 삭제 후
			//List<ArticleDto> list = articleService.listArticle(); // JSON 리턴
			return new ResponseEntity<String>(FAIL ,HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(FAIL ,HttpStatus.NO_CONTENT);
		}
	}

	@RequestMapping(value = "/article", method = RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ArticleDto articleDto, HttpSession session) {
		try {
			if(articleService.registerArticle(articleDto)) {
				return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
			}; // 등록 후
			//List<ArticleDto> list = articleService.listArticle(); // JSON 리턴
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		} 
	}

	//	
	//	@RequestMapping(value="/mvwrite", method = RequestMethod.GET)
	//	public String mvWrite() {
	//		System.out.println("in write");
	//		return "write";
	//	}
	//	@RequestMapping(value = "/write", method = RequestMethod.POST)
	//	public String write(ArticleDto articleDto,@RequestParam Map<String, String> map, Model model, HttpSession session) {
	//		
	//			try {
	//				articleService.registerArticle(articleDto);
	//				List<ArticleDto> list = articleService.listArticle(map);
	//				model.addAttribute("articles", list);
	//				return "notice";
	//			} catch (Exception e) {
	//				e.printStackTrace();
	//				model.addAttribute("msg", "글작성중 문제가 발생했습니다.");
	//				return "error/error";
	//			}
	//		
	//	}
	//	
	//	@RequestMapping(value= "/mvmodify", method = RequestMethod.GET)
	//    public String mvModify(@RequestParam("articleno") int articleno, Model model, HttpSession session) throws SQLException {
	//        System.out.println(articleno);
	//        ArticleDto articleDto = articleService.getArticle(articleno);
	//        model.addAttribute("article", articleDto);
	//        return "noticemodify";
	//    }
	//
	//    @RequestMapping(value = "/modify", method = RequestMethod.POST)
	//    public String modify(ArticleDto articleDto, Model model, HttpSession session) {
	//
	//    try {
	//            articleService.modifyArticle(articleDto);
	//            return "redirect:mvnotice";
	//        } catch (Exception e) {
	//            e.printStackTrace();
	//            model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
	//            return "error/error";
	//        }
	//}
	//	
	//	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	//	public String delete(@RequestParam("articleno") int articleno, Model model, HttpSession session) {
	//		try {
	//			articleService.deleteArticle(articleno);
	//			return "redirect:mvnotice";
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//			model.addAttribute("msg", "글삭제 처리 중 문제가 발생했습니다.");
	//			return "error/error";
	//		}
	//	}

}

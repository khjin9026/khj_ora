package org.edu.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileDataUtil {
	private ArrayList<String> extNameArray = new ArrayList<String>() {
		{
			add("gif");
			add("jpg");
			add("png");
		}
	};
	
	//첨부파일 업로드 경로를 변수값으로 가져옴
		//uploadPath -> servlet-context.xml에서 가져옴
		@Resource(name = "uploadPath")
		private String uploadPath;
		
		public String getUploadPath() {
			return uploadPath;
		}

		public void setUploadPath(String uploadPath) {
			this.uploadPath = uploadPath;
		}

		/**
		 * 게시물 상세보기에서 첨부파일 다운로드 메서드 구현(공통)
		 */
		@RequestMapping(value = "/download", method = RequestMethod. GET)
		@ResponseBody //서버가 응답을 받을때 , 첨부파일 값을 지정하고 헤더값까지 안가고 바디에서 받기위해 사용
		public FileSystemResource fileDownload(@RequestParam("filename")String fileName, HttpServletResponse response) {
			File file = new File(uploadPath + "/" + fileName);
			response.setContentType("application/download; utf-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
			return new FileSystemResource(file);
		}
		
	/**
	 * 파일 업로드 메서드 구현 (공통)
	 * @throws IOException 
	 */
	public String[] fileUpload(MultipartFile file) throws IOException {
		//첨부 파일 해서 넣을때
		String originalName = file.getOriginalFilename(); //jsp에서 전송받은 파일의 이름 가져오기
		UUID uid = UUID.randomUUID(); //랜덤문자 구하기
		String saveName = uid.toString() + "." + originalName.split("\\.")[1]; //한글파일명 처리
		String[] files = new String[] {saveName}; //형변환 //boardVO에 파일명을 배열로 해놨기 때문. 같이 배열로 해줘야 get-set이 됨
		byte[] fileData = file.getBytes();
		File target = new File(uploadPath, saveName);
		FileCopyUtils.copy(fileData, target);
		return files;
	}

	public ArrayList<String> getExtNameArray() {
		return extNameArray;
	}

	public void setExtNameArray(ArrayList<String> extNameArray) {
		this.extNameArray = extNameArray;
	}
}

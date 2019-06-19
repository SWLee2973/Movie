package com.spring.movie.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;


@Controller
public class FileDownloadController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\movie\\file_repo";
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("image") String movie_image_path, @RequestParam("movie_code") String movie_code,
            HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+movie_image_path;
		File image=new File(filePath);
		
		int lastIndex = movie_image_path.lastIndexOf(".");
		String imageFileName = movie_image_path.substring(0,lastIndex);
		if (image.exists()) { 
			Thumbnails.of(image).size(540, 740).outputFormat("jpg").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/thumbnails2.do")
	protected void thumbnails2(@RequestParam("movie_image_path") String movie_image_path, @RequestParam("movie_code") String movie_code,
            HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+"stillCutTemp"+"\\"+movie_image_path;
		File image=new File(filePath);
		
		int lastIndex = movie_image_path.lastIndexOf(".");
		String imageFileName = movie_image_path.substring(0,lastIndex);
		if (image.exists()) { 
			Thumbnails.of(image).size(500, 740).outputFormat("jpg").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}


}


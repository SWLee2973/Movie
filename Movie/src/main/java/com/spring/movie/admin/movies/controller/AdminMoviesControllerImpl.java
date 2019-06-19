package com.spring.movie.admin.movies.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.movie.admin.movies.service.AdminMoviesService;
import com.spring.movie.common.base.BaseController;
import com.spring.movie.movies.service.MoviesService;
import com.spring.movie.movies.vo.MoviesVO;
import com.spring.movie.movies.vo.TheaterVO;

@Controller("adminMoviesController")
//@RequestMapping(value="/movies")
public class AdminMoviesControllerImpl extends BaseController implements AdminMoviesController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\movie\\file_repo";
	@Autowired
	AdminMoviesService adminMoviesService;
	@Autowired
	MoviesService moviesService;
	
	@RequestMapping(value="/movies.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView moviesListMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

	@RequestMapping(value="/movies/theaters.do", method= RequestMethod.GET)
	public ModelAndView screenListMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List theatersList = adminMoviesService.listTheaters();
		List theaterAreas = adminMoviesService.getAreaList();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("theatersList", theatersList);
		mav.addObject("theaterAreas", theaterAreas);
		return mav;
	}
	
	@RequestMapping(value="/movies/theaterDetail.do", method=RequestMethod.GET)
	public ModelAndView theaterDetail(@RequestParam("theater_code") String theater_code, 
											HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		
		List theatersList = adminMoviesService.listTheaters();
		List theaterAreas = adminMoviesService.getAreaList();
		Map theaterMap = adminMoviesService.theaterDetail(theater_code);
		TheaterVO theaterSummary = adminMoviesService.getTheaterSummary(theater_code);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("theatersList", theatersList);
		mav.addObject("theaterAreas", theaterAreas);
		mav.addObject("theaterMap", theaterMap);
		mav.addObject("theaterSummary", theaterSummary);
		
		return mav;
	}

	@RequestMapping(value="/admin/movies/addNewMovies.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity addNewMovies(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		Map<String, Object> movieMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		String year = multipartRequest.getParameter("year");
		String month = multipartRequest.getParameter("month");
		String day = multipartRequest.getParameter("day");
		String openDate = year+"-"+month+"-"+day;
		movieMap.put("open_date", openDate);
		
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			movieMap.put(name, value);
		}
		
		String image = upload(multipartRequest);
		movieMap.put("image", image);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		try {
			int movieNO = adminMoviesService.addNewMovies(movieMap);
			message="<script>";
			message+="alert('새 영화 추가');";
			message+="location.href='"+multipartRequest.getContextPath()+"/movies/movies.do';";
			message+="</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message="<script>";
			message+="alert('error');";
			message+="location.href='"+multipartRequest.getContextPath()+"/movies/addNewMovies.do';";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@RequestMapping(value="/admin/movies/addNewStillCut.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity addNewStillCut(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		Map<String, Object> movieMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			movieMap.put(name, value);
		}
		
		String image = uploadStilCut(multipartRequest);
		movieMap.put("image", image);
		movieMap.put("movie_image_path", image);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-type", "text/html; charset=utf-8");
		
		try {
			adminMoviesService.addNewStillCut(movieMap);


			message="<script>";
			message+="alert('스틸컷 추가');";
			message+="location.href='"+multipartRequest.getContextPath()+"/movies/addNewStillCut.do';";
			message+="</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message="<script>";
			message+="alert('error');";
			message+="location.href='"+multipartRequest.getContextPath()+"/movies/addNewStillCut.do';";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	private String uploadStilCut(MultipartRequest multipartRequest) throws Exception{
		String image = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image = mFile.getOriginalFilename();
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+image); 
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\stillCutTemp\\"+image));
			}
		}
		return image;
	}
	
	@RequestMapping(value="/movies/addTimeStamp.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addNewTime(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String time_code = request.getParameter("time_code");
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String movie_date = year + "-" + month + "-" + day;
		String screen_code = request.getParameter("screen_code");
		String movie_code = request.getParameter("movie_code");
		String theater_code = request.getParameter("theater_code");
		
		Map<String, String> tool = new HashMap<String, String>();
		tool.put("time_code", time_code);
		tool.put("start_time", start_time);	tool.put("end_time", end_time);
		tool.put("movie_date", movie_date); tool.put("screen_code", screen_code);
		tool.put("movie_code", movie_code); tool.put("theater_code", theater_code);
		
		adminMoviesService.addNewTime(tool);
		mav.setViewName("redirect:/movies/addNewTime.do");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/movies/adminMovieList.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminMovieList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName= (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		List<MoviesVO> movieList = moviesService.getMoviesList();
		mav.addObject("movieList", movieList);

		return mav;
	}
	
	@RequestMapping(value="/movies/removeMovie.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView removeMovie(String movie_code, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName= (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		try {
			adminMoviesService.removeMovie(movie_code);
			mav.setViewName("redirect:/movies/adminMovieList.do");
		} catch (Exception e) {
			mav.setViewName("redirect:/movies/adminMovieList.do");
		}
		return mav;
	}

	protected String upload(MultipartRequest multipartRequest) throws Exception{
		String image = null;
		Map<String, String> movieMap = new HashMap<String, String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image = mFile.getOriginalFilename();
			File file = new File(CURR_IMAGE_REPO_PATH+"\\"+image); 
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+image));
			}
		}
		return image;
	}
	
}

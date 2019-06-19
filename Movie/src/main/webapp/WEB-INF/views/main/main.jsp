<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ page session="false" %>
<section id="photostack-1" class="photostack photostack-start">
    <div>
      <c:forEach var="i" items="${movieList}"> <!-- mainController의 movieList를 가져온다 -->
	      <figure>
		        <a href="${contextPath }/movies/moviesDetail.do?movie_code=${i.movie_code}" 
		        			class="photostack-img">
		        	<img src="${contextPath}/thumbnails.do?movie_code=${i.movie_code}&image=${i.image}" alt="${i.image}" style="height: 100%;"/> <!-- MOVIE_PICTURE테이블의 movie_image_path  -->
		        </a>
	        <figcaption>
	          <h2 class="photostack-title">${i.name}</h2> <!-- movie테이블의 name -->
	        </figcaption>
	      </figure>    
      </c:forEach>
    </div>
  </section>

  <div class="container">

    <div>
      <div id="filters-container" class="cbp-l-filters-alignRight container col-sm-12"
      				style="text-align: center;">
        <div data-filter="*" class="cbp-filter-item-active cbp-filter-item">
          	박스오피스
          <div class="cbp-filter-counter"></div>
        </div>
        <div data-filter=".new" class="cbp-filter-item">
          최신개봉작
          <div class="cbp-filter-counter"></div>
        </div>
        <div data-filter=".scheduled" class="cbp-filter-item">
          상영예정작
          <div class="cbp-filter-counter"></div>
        </div>
      </div>
      <!-- end:Filter -->
    </div>
  </div>

  
<div id="grid-container" class="cbp-l-grid-fullScreen">
    <ul>
    	<c:forEach var="i" items="${movieList }">
		<li class="cbp-item new">
			<a class="cbp-caption" data-title="images" 
					href="${contextPath }/movies/moviesDetail.do?movie_code=${i.movie_code}">
				<div class="cbp-caption-defaultWrap">
					<img src="${contextPath}/thumbnails.do?movie_code=${i.movie_code}&image=${i.image}"
							 alt="" class="img-responsive">
				</div>
				<div class="cbp-caption-activeWrap">
					<div class="cbp-l-caption-alignCenter">
						<div class="cbp-l-caption-body">
							<div class="cbp-l-caption-title">${i.name }</div>
							<div class="cbp-l-caption-desc">by ${i.director }</div>
						</div>
					</div>
				</div>
			</a>
		</li>
    	</c:forEach>
    </ul>
</div>

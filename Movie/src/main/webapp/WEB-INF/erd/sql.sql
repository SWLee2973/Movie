/* 회원 어드민 권한 주기 */
update m_member set admin_flag=1 where email='이메일';

drop table time cascade constraint;
drop table booking cascade constraint;
drop table m_member cascade constraint;
drop table movie cascade constraint;
drop table movie_picture cascade constraint;
drop table seat cascade constraint;
drop table screen cascade constraint;
drop table theater cascade constraint;

create table time(
	time_code varchar2(40),
	start_time varchar2(20),
	end_time varchar2(20),
	movie_date date,
	screen_code varchar2(20),
	movie_code varchar2(10),
	theater_code varchar2(20)
);

create table booking(
	booking_code varchar2(20),
	email varchar2(70),
	movie_name varchar2(30),
	phone_number varchar2(20),
	theater_name varchar2(20),
	screen_name varchar2(20),
	time varchar2(20),
	movie_date date,
	selected_seat varchar2(200),
	total_price integer
);

create table m_member(
	email varchar2(70),
	password varchar2(100),
	name varchar2(20),
	birth date,
	gender varchar2(3),
	admin_flag integer default 0,
	phone_number varchar2(20),
	zipcode varchar2(20),
	roadaddress varchar2(500),
	jibunaddress varchar2(500),
	namujiaddress varchar2(500),
	reg_date date default sysdate
);

create table movie(
	movie_code varchar2(10),
	name varchar2(30),
	genre varchar2(20),
	running_time integer,
	director varchar2(100),
	rating varchar2(20),
	company varchar2(30),
	country varchar2(30),
	actors varchar2(400),
	open_date date,
	summary varchar2(3000),
	movie_view integer default 0,
	image varchar2(100)
);

create table movie_picture(
	movie_code varchar2(10),
	movie_image_path varchar2(200),
	main_image integer default 0
);

create table seat(
	time varchar2(40),
	movie_date varchar2(50),
	movie_code varchar2(10),
	seat_code varchar2(200),
	screen_code varchar2(20),
	theater_code varchar2(20),
	booked_flag varchar2(10) default 0,
	booking_code varchar2(20)
);

create table screen(
	screen_code varchar2(20),
	screen_name varchar2(30),
	theater_code varchar2(20)
);

create table theater(
	theater_code varchar2(20),
	theater_name varchar2(30),
	theater_summary varchar2(1000),
	theater_area varchar2(20),
	seq integer
);

--------------------------------insert--------------------------
insert into theater values('seoul1', '강남', '강남의 중심! 강남 소비문화의 중심지인 지하철 2호선 , 신분당선 - 강남역과 연결<br>
로맨틱 멀티플렉스! 젊은 도시 강남이 한 눈에 보이는 최상의 View를 제공<br> 
<프라다>가 선택한 수려한 디자인의 상영관 의자를 체험해보세요!', '서울', 1);
insert into theater values('seoul2', '강남대로(씨티)', '2호선 강남역과 9호선 신논현역을 잇는 생동감 넘치는 강남의 중심 벨트!! 문화와 쇼핑을 한번에!!<br>
강남에서 가장 큰 상영관에서 압도되는 영상을 경험하세요.', '서울', 1);
insert into theater values('seoul3', '강동', '강동구청역 도보 5분 거리에 위치!<br>
10개관 총 1500석 규모! 249석의 대형 상영관에서 생생한 관람을!<br>
안락하고 쾌적한 관람을 위한 가죽시트 도입!', '서울', 1);
insert into theater values('seoul4', '군자', '군자역 도보 5분 거리에 위치!<br>
양 팔걸이와 쾌적한 관람을 위한 전관 가죽시트 도입!<br>
안락한 문화 생활을 위한 최고의 영화관!', '서울', 1);
insert into theater values('seoul5', '동대문', '전통과 현대가 공존하는 곳, 동대문 역사문화공원역 13, 14번 출구<br>
쾌적하고 멋스러운 로비, 지상 40m에서 즐기는 환상의 뷰! (8개 상영관/1,744석)<br>
매주 금요일, 토요일에는 잠 없는 올빼미족을 위한 무비올나잇 상영!', '서울', 1);
insert into theater values('seoul6', '마곡', '야외 테라스가 있는 마곡지구 최초 영화관<br>
발산역 9번출구, 도보 1분거리내 위치 6개관, 815석<br>
레이저 영사기 도입으로 깨끗한 화질, 전관 가죽시트 적용으로 쾌적한 영화관람', '서울', 1);

insert into theater values('gyeonggi1', '고양스타필드', '스타필드와 기가박스의 만남, "MEGABOX in 스타필드 고양"<br>
Meyer Sound와 Dolby ATMOS 시스템, 차세대 상영관의 표준 사운드 특화관 MX관<br>
아이와 함께 머물고 즐기는 특별한 영화관 MEGABOX KIDS관', '경기', 2);
insert into theater values('gyeonggi2', '동탄', '동탄신도시 남-북광장 한 가운데 위치<br>
8개관 총 1319석 규모', '경기', 2);
insert into theater values('gyeonggi3', '분당', '6개 상영관, 785석<br>
스칸디나비안 리클라이너 좌석, JBL만의 파워풀한 음향을 자랑하는 THE BOUTIQUE SUITE<br>
나만의 Private 공간, 나만의 소파에서 편안한 관람을 즐길 수 있는 BALCONY', '경기', 2);
insert into theater values('gyeonggi4', '수원', '수원 최초의 멀티플렉스 영화관, 총 5개관 1,129석 규모!<br>
전좌석 가죽시트로 안락하고 쾌적한 영화관람!<br>
수원버스터미널 내에 위치해 편리한 대중교통!', '경기', 2);
insert into theater values('gyeonggi5', '안산중앙', '중앙동 랜드마크 중앙역 도보 5분거리에 위치! 6개관 총 620석 규모', '경기', 2);
insert into theater values('gyeonggi6', '용인테크노밸리', '용인의 첫 번째 Life Theater, 기가박스 용인테크노밸리<br>
JBL스피커로 즐기는 실감나는 DOLBY 7.1 사운드 음향!<br>
안락하고 쾌적한 관람을 위한 전관 가죽시트와 앞, 뒤 좌석 간격이 확보된 컴포트 1관!', '경기', 2);
insert into theater values('gyeonggi7', '일산벨라시타', '국내 첫 라이프 스타일 쇼핑센터 벨라시타 내 PREMIUM CINEMA "기가박스 더 부티크 일산벨라시타"<br>
아르데코 양식으로 장식된 아늑한 라운지와 상영관, 그리고 105호 COUPLE SEAT<br>
유럽 스타일의 여유롭고 럭셔리한 당신의 하루를 "기가박스 더 부티크 일산벨라시타"에서 함께하세요', '경기', 2);

insert into theater values('incheon1', '검단', '더 밝고 깨끗한 화질 디지털 영사 줌렌즈 및 전 상영관 가죽시트!<br>
JBL스피커로 즐기는 실감나는 7.1 돌비사운드 음향!<br>
안락하고 쾌적한 관람을 위한 전관 가죽시트와 앞, 뒤 좌석 간격이 확보된 컴포트 1관!', '인천', 3);
insert into theater values('incheon2', '송도', '8개관 1,548석의 프리미엄 좌석 & 진정한 영화 사운드의 감동을 느낄 수 있는 MX관<br>
기존 영화관 로비의 전형성을 탈피한 카페형 로비', '인천', 3);
insert into theater values('incheon3', '영종', '영종도 시민의 여가 문화를 선도하는 최적의 문화 플렛폼<br>
영종도 중심 상권과 역세권에 위치한 탁월한 입지<br>
럭셔리 라운지를 품은', '인천', 3);
insert into theater values('incheon4', '인천논현', '남동구 논현동 랜드마크 스트리트몰 라피에스타 상가내 위치한 영화관<br>
수인선 인천논현역,소래포구역 도보 10분거리에 위치! 8개관 총 1221석 규모
', '인천', 3);
insert into theater values('incheon5', '청라', '청라국제도시 최초의 멀티 플렉스 영화관! 총 7개관 869석 규모!<br>
더 밝고 깨끗한 화질을 위한 레이저 상영관 도입!<br>
안락하고 쾌적한 관람을 위한 전관 가죽시트', '인천', 3);
insert into theater values('incheon6', '청라지젤', '인천서구 지역 최초 프리미엄 상영관 도입!<br>
청라커널웨이의 랜드마크, 도보 3분거리에 위치! 7개관 총 784석 규모<br>
넉넉한 주차 공간 확보
', '인천', 3);

insert into theater values('dcs1', '공주', '2005년 1월 개관 이래 공주시 랜드마크로 자리 매김<br>
전 좌석 스타디움 방식<br>
디지털4K / 디지털 4K 3D 상영', '대전/충청/세종', 4);
insert into theater values('dcs2', '대전', '8개 상영관, 1333석 규모의 대형 멀티 플렉스<br>
생생한 사운드와 감각적인 디자인이 어우러진 컴포트 상영관 도입(3,4,7,8관)<br>
전좌석 가죽시트로 안락하고 쾌적한 영화관람 제공, 야외정원이 있는 친환경적인 영화관<br>
', '대전/충청/세종', 4);
insert into theater values('dcs3', '대전중앙로', '대전의 중심 Life Theater, 기가박스 대전 중앙로!<br>
JBL스피커로 즐기는 실감나는 DOLBY 7.1 사운드 음향!<br>
중앙로역 도보 2분, 8개관 1124석/전좌석 가죽시트 연인들을 위한 커플석 완비
', '대전/충청/세종', 4);
insert into theater values('dcs4', '세종', '세종시민들을 위한<br>
5개관 총 749석 규모의 세종시 첫번째 오픈 영화관<br>
전좌석 가죽시트로 안락하고 쾌적한 영화관람 제공
', '대전/충청/세종', 4);
insert into theater values('dcs5', '천안', '9개관 1,300석 가죽시트 도입 / 전관 4k 디지털 시스템과 4way 사운드<br>
COMFORT 4,5관 (사이드테이블, 더블암체어) <br>
전철 1호선 두정역 1번 출구에 위치해 편리한 대중교통', '대전/충청/세종', 4);

insert into theater values('bdg1', '김천', '김천의 유일한 멀티플렉스 극장<br>
김천역에서 도보3분거리에 위치<br>
전관 디지털 영사기 및 돌비서라운드 시스템구축', '부산/대구/경상', 5);
insert into theater values('bdg2', '대구(칠성로)', '북구 최대의 10개 상영관, 2,008석<br>
최적의 관람환경을 대표하는 COMFORT 4관<br>
두 손을 자유롭게하는 Front Table의 COMFORT 3관', '부산/대구/경상', 5);
insert into theater values('bdg3', '대구신세계(동대구)', '기가박스가 대구 지역 최초로 고화질 영상과 생생한 사운드를 선사하는 기술 특화관 MX관<br>
전 좌석 가죽시트와 JBL사운드에서 즐기는 일반관으로 총 6개의 상영관을 오픈합니다.<br>
최고 수준의 영화 관람 환경을 제공하는 기가박스 대구 신세계점에서 안락한 문화생활을 즐겨보세요.
', '부산/대구/경상', 5);
insert into theater values('bdg4', '부산극장', '완벽한 조율의 3S System(Sound, Screen, Seat)<br>
4개관(1, 2, 3, TABLE관) 전좌석 Double Arm Chair(Premium Chair)<br>
SideTable(TABLE관)', '부산/대구/경상', 5);
insert into theater values('bdg5', '부산대', '부산대역 3분 거리에 위치! 7개관 총 1,065석 규모<br>
젊음이 넘치는 대학로 중심의 극장<br>
전관 디지털 영사기 및 돌비서라운드 시스템 구축
', '부산/대구/경상', 5);
insert into theater values('bdg6', '울산', '울산의 중심가 성남동에 위치<br>
전좌석 가죽시트로 안락하고 쾌적한 영화관람 제공<br>
최적의 관람환경을 대표하는 COMFORT관(3관, 6관)
', '부산/대구/경상', 5);

insert into theater values('gj1', '광주상무', '광주의 중심, 문화의 랜드마크<br>
지역최초, 최다관의 진정한 멀티플랙스<br>
편리한 주차공간', '광주/전라', 6);
insert into theater values('gj2', '목포하당(포르모)', '6채널 분리방식의 돌비 서라운드 음향시설
', '광주/전라', 6);
insert into theater values('gj3', '순천', '누워서 보는 영화관<br>
우아한 천연가죽의 리클라이너 소파<br>
좌석에 리클라이너 기능이 있어 각자 원하는 각도에서 편안한 자세로 관람이 가능합니다.
', '광주/전라', 6);
insert into theater values('gj4', '전주(객사)', '호남 최고 수준의 4-Way Sound System 구현<br>
양팔, 양발의 자유로운 COMPORT 10관<br>
전주국제영화제 공식 상영관
', '광주/전라', 6);

insert into theater values('gangwon1', '남춘천', '7개 상영관 전관이 같은층에 위치한 춘천 유일한 영화관으로 높은 층고가 주는 탁트인 공간과<br>
퍼스널 스페이스를 배려한 양팔걸이 좌석은 여유로운 문화생활을 가능케 합니다.', '강원', 7);
insert into theater values('gangwon2', '속초', '영동권 최초 멀티 플렉스 영화관<br>
당일 영화 관람객은 주차요금이 무료(관람일 무료)<br>
영화관을 위한 최상의 건물(5층 주차장에서 상영관과 바로 연결)', '강원', 7);
insert into theater values('gangwon3', '원주', '전 상영관 소니 디지털 4K 설치<br>
3시간 무료주차와 무료 발레파킹', '강원', 7);
insert into theater values('gangwon4', '원주센트럴', '원주혁신도시 내 유일한 멀티플렉스 영화관!<br>
원주시 최초 커플석 도입!<br>
편안한 관람을 위한 좌석간 간격 1.2m!', '강원', 7);

insert into theater values('jeju1', '제주', '제주시의 복합 어뮤즈먼트 빌딩 "재밋섬타워"의 기가박스 제주점<br>
제주도내 최초/최대 7M 높이의 실내 놀이시설을 갖춘 재밋섬 타워<br>
2012년 전관 디지털 영사 시스템으로 리모델링하여 새롭게 태어나는 기가박스 제주점
', '제주', 8);


insert into screen values('scr1', '제 1관', 'seoul1');
insert into screen values('scr2', '제 2관', 'seoul1');
insert into screen values('scr3', '제 3관', 'seoul1');
insert into screen values('scr4', '제 4관', 'seoul1');
insert into screen values('scr5', '제 5관', 'seoul1');
insert into screen values('scr6', '제 6관', 'seoul1');
insert into screen values('scr7', '제 7관', 'seoul1');
insert into screen values('scr1', '제 1관', 'seoul2');
insert into screen values('scr2', '제 2관', 'seoul2');
insert into screen values('scr3', '제 3관', 'seoul2');
insert into screen values('scr4', '제 4관', 'seoul2');
insert into screen values('scr5', '제 5관', 'seoul2');
insert into screen values('scr6', '제 6관', 'seoul2');
insert into screen values('scr7', '제 7관', 'seoul2');
insert into screen values('scr1', '제 1관', 'seoul3');
insert into screen values('scr2', '제 2관', 'seoul3');
insert into screen values('scr3', '제 3관', 'seoul3');
insert into screen values('scr4', '제 4관', 'seoul3');
insert into screen values('scr5', '제 5관', 'seoul3');
insert into screen values('scr6', '제 6관', 'seoul3');
insert into screen values('scr7', '제 7관', 'seoul3');
insert into screen values('scr1', '제 1관', 'seoul4');
insert into screen values('scr2', '제 2관', 'seoul4');
insert into screen values('scr3', '제 3관', 'seoul4');
insert into screen values('scr4', '제 4관', 'seoul4');
insert into screen values('scr5', '제 5관', 'seoul4');
insert into screen values('scr6', '제 6관', 'seoul4');
insert into screen values('scr7', '제 7관', 'seoul4');
insert into screen values('scr1', '제 1관', 'seoul5');
insert into screen values('scr2', '제 2관', 'seoul5');
insert into screen values('scr3', '제 3관', 'seoul5');
insert into screen values('scr4', '제 4관', 'seoul5');
insert into screen values('scr5', '제 5관', 'seoul5');
insert into screen values('scr6', '제 6관', 'seoul5');
insert into screen values('scr7', '제 7관', 'seoul5');
insert into screen values('scr1', '제 1관', 'seoul6');
insert into screen values('scr2', '제 2관', 'seoul6');
insert into screen values('scr3', '제 3관', 'seoul6');
insert into screen values('scr4', '제 4관', 'seoul6');
insert into screen values('scr5', '제 5관', 'seoul6');
insert into screen values('scr6', '제 6관', 'seoul6');
insert into screen values('scr7', '제 7관', 'seoul6');
insert into screen values('scr1', '제 1관', 'seoul7');
insert into screen values('scr2', '제 2관', 'seoul7');
insert into screen values('scr3', '제 3관', 'seoul7');
insert into screen values('scr4', '제 4관', 'seoul7');
insert into screen values('scr5', '제 5관', 'seoul7');
insert into screen values('scr6', '제 6관', 'seoul7');
insert into screen values('scr7', '제 7관', 'seoul7');
insert into screen values('scr1', '제 1관', 'bdg1');
insert into screen values('scr2', '제 2관', 'bdg1');
insert into screen values('scr3', '제 3관', 'bdg1');
insert into screen values('scr4', '제 4관', 'bdg1');
insert into screen values('scr5', '제 5관', 'bdg1');
insert into screen values('scr6', '제 6관', 'bdg1');
insert into screen values('scr7', '제 7관', 'bdg1');
insert into screen values('scr1', '제 1관', 'bdg2');
insert into screen values('scr2', '제 2관', 'bdg2');
insert into screen values('scr3', '제 3관', 'bdg2');
insert into screen values('scr4', '제 4관', 'bdg2');
insert into screen values('scr5', '제 5관', 'bdg2');
insert into screen values('scr6', '제 6관', 'bdg2');
insert into screen values('scr7', '제 7관', 'bdg2');
insert into screen values('scr1', '제 1관', 'bdg3');
insert into screen values('scr2', '제 2관', 'bdg3');
insert into screen values('scr3', '제 3관', 'bdg3');
insert into screen values('scr4', '제 4관', 'bdg3');
insert into screen values('scr5', '제 5관', 'bdg3');
insert into screen values('scr6', '제 6관', 'bdg3');
insert into screen values('scr7', '제 7관', 'bdg3');
insert into screen values('scr1', '제 1관', 'bdg4');
insert into screen values('scr2', '제 2관', 'bdg4');
insert into screen values('scr3', '제 3관', 'bdg4');
insert into screen values('scr4', '제 4관', 'bdg4');
insert into screen values('scr5', '제 5관', 'bdg4');
insert into screen values('scr6', '제 6관', 'bdg4');
insert into screen values('scr7', '제 7관', 'bdg4');
insert into screen values('scr1', '제 1관', 'bdg5');
insert into screen values('scr2', '제 2관', 'bdg5');
insert into screen values('scr3', '제 3관', 'bdg5');
insert into screen values('scr4', '제 4관', 'bdg5');
insert into screen values('scr5', '제 5관', 'bdg5');
insert into screen values('scr6', '제 6관', 'bdg5');
insert into screen values('scr7', '제 7관', 'bdg5');
insert into screen values('scr1', '제 1관', 'bdg6');
insert into screen values('scr2', '제 2관', 'bdg6');
insert into screen values('scr3', '제 3관', 'bdg6');
insert into screen values('scr4', '제 4관', 'bdg6');
insert into screen values('scr5', '제 5관', 'bdg6');
insert into screen values('scr6', '제 6관', 'bdg6');
insert into screen values('scr7', '제 7관', 'bdg6');
insert into screen values('scr1', '제 1관', 'dcs1');
insert into screen values('scr2', '제 2관', 'dcs1');
insert into screen values('scr3', '제 3관', 'dcs1');
insert into screen values('scr4', '제 4관', 'dcs1');
insert into screen values('scr5', '제 5관', 'dcs1');
insert into screen values('scr6', '제 6관', 'dcs1');
insert into screen values('scr7', '제 7관', 'dcs1');
insert into screen values('scr1', '제 1관', 'dcs2');
insert into screen values('scr2', '제 2관', 'dcs2');
insert into screen values('scr3', '제 3관', 'dcs2');
insert into screen values('scr4', '제 4관', 'dcs2');
insert into screen values('scr5', '제 5관', 'dcs2');
insert into screen values('scr6', '제 6관', 'dcs2');
insert into screen values('scr7', '제 7관', 'dcs2');
insert into screen values('scr1', '제 1관', 'dcs3');
insert into screen values('scr2', '제 2관', 'dcs3');
insert into screen values('scr3', '제 3관', 'dcs3');
insert into screen values('scr4', '제 4관', 'dcs3');
insert into screen values('scr5', '제 5관', 'dcs3');
insert into screen values('scr6', '제 6관', 'dcs3');
insert into screen values('scr7', '제 7관', 'dcs3');
insert into screen values('scr1', '제 1관', 'dcs4');
insert into screen values('scr2', '제 2관', 'dcs4');
insert into screen values('scr3', '제 3관', 'dcs4');
insert into screen values('scr4', '제 4관', 'dcs4');
insert into screen values('scr5', '제 5관', 'dcs4');
insert into screen values('scr6', '제 6관', 'dcs4');
insert into screen values('scr7', '제 7관', 'dcs4');
insert into screen values('scr1', '제 1관', 'dcs5');
insert into screen values('scr2', '제 2관', 'dcs5');
insert into screen values('scr3', '제 3관', 'dcs5');
insert into screen values('scr4', '제 4관', 'dcs5');
insert into screen values('scr5', '제 5관', 'dcs5');
insert into screen values('scr6', '제 6관', 'dcs5');
insert into screen values('scr7', '제 7관', 'dcs5');
insert into screen values('scr1', '제 1관', 'gangwon1');
insert into screen values('scr2', '제 2관', 'gangwon1');
insert into screen values('scr3', '제 3관', 'gangwon1');
insert into screen values('scr4', '제 4관', 'gangwon1');
insert into screen values('scr5', '제 5관', 'gangwon1');
insert into screen values('scr6', '제 6관', 'gangwon1');
insert into screen values('scr7', '제 7관', 'gangwon1');
insert into screen values('scr1', '제 1관', 'gangwon2');
insert into screen values('scr2', '제 2관', 'gangwon2');
insert into screen values('scr3', '제 3관', 'gangwon2');
insert into screen values('scr4', '제 4관', 'gangwon2');
insert into screen values('scr5', '제 5관', 'gangwon2');
insert into screen values('scr6', '제 6관', 'gangwon2');
insert into screen values('scr7', '제 7관', 'gangwon2');
insert into screen values('scr1', '제 1관', 'gangwon3');
insert into screen values('scr2', '제 2관', 'gangwon3');
insert into screen values('scr3', '제 3관', 'gangwon3');
insert into screen values('scr4', '제 4관', 'gangwon3');
insert into screen values('scr5', '제 5관', 'gangwon3');
insert into screen values('scr6', '제 6관', 'gangwon3');
insert into screen values('scr7', '제 7관', 'gangwon3');
insert into screen values('scr1', '제 1관', 'gangwon4');
insert into screen values('scr2', '제 2관', 'gangwon4');
insert into screen values('scr3', '제 3관', 'gangwon4');
insert into screen values('scr4', '제 4관', 'gangwon4');
insert into screen values('scr5', '제 5관', 'gangwon4');
insert into screen values('scr6', '제 6관', 'gangwon4');
insert into screen values('scr7', '제 7관', 'gangwon4');
insert into screen values('scr1', '제 1관', 'gj1');
insert into screen values('scr2', '제 2관', 'gj1');
insert into screen values('scr3', '제 3관', 'gj1');
insert into screen values('scr4', '제 4관', 'gj1');
insert into screen values('scr5', '제 5관', 'gj1');
insert into screen values('scr6', '제 6관', 'gj1');
insert into screen values('scr7', '제 7관', 'gj1');
insert into screen values('scr1', '제 1관', 'gj2');
insert into screen values('scr2', '제 2관', 'gj2');
insert into screen values('scr3', '제 3관', 'gj2');
insert into screen values('scr4', '제 4관', 'gj2');
insert into screen values('scr5', '제 5관', 'gj2');
insert into screen values('scr6', '제 6관', 'gj2');
insert into screen values('scr7', '제 7관', 'gj2');
insert into screen values('scr1', '제 1관', 'gj3');
insert into screen values('scr2', '제 2관', 'gj3');
insert into screen values('scr3', '제 3관', 'gj3');
insert into screen values('scr4', '제 4관', 'gj3');
insert into screen values('scr5', '제 5관', 'gj3');
insert into screen values('scr6', '제 6관', 'gj3');
insert into screen values('scr7', '제 7관', 'gj3');
insert into screen values('scr1', '제 1관', 'gj4');
insert into screen values('scr2', '제 2관', 'gj4');
insert into screen values('scr3', '제 3관', 'gj4');
insert into screen values('scr4', '제 4관', 'gj4');
insert into screen values('scr5', '제 5관', 'gj4');
insert into screen values('scr6', '제 6관', 'gj4');
insert into screen values('scr7', '제 7관', 'gj4');
insert into screen values('scr1', '제 1관', 'gyeonggi1');
insert into screen values('scr2', '제 2관', 'gyeonggi1');
insert into screen values('scr3', '제 3관', 'gyeonggi1');
insert into screen values('scr4', '제 4관', 'gyeonggi1');
insert into screen values('scr5', '제 5관', 'gyeonggi1');
insert into screen values('scr6', '제 6관', 'gyeonggi1');
insert into screen values('scr7', '제 7관', 'gyeonggi1');
insert into screen values('scr1', '제 1관', 'gyeonggi2');
insert into screen values('scr2', '제 2관', 'gyeonggi2');
insert into screen values('scr3', '제 3관', 'gyeonggi2');
insert into screen values('scr4', '제 4관', 'gyeonggi2');
insert into screen values('scr5', '제 5관', 'gyeonggi2');
insert into screen values('scr6', '제 6관', 'gyeonggi2');
insert into screen values('scr7', '제 7관', 'gyeonggi2');
insert into screen values('scr1', '제 1관', 'gyeonggi3');
insert into screen values('scr2', '제 2관', 'gyeonggi3');
insert into screen values('scr3', '제 3관', 'gyeonggi3');
insert into screen values('scr4', '제 4관', 'gyeonggi3');
insert into screen values('scr5', '제 5관', 'gyeonggi3');
insert into screen values('scr6', '제 6관', 'gyeonggi3');
insert into screen values('scr7', '제 7관', 'gyeonggi3');
insert into screen values('scr1', '제 1관', 'gyeonggi4');
insert into screen values('scr2', '제 2관', 'gyeonggi4');
insert into screen values('scr3', '제 3관', 'gyeonggi4');
insert into screen values('scr4', '제 4관', 'gyeonggi4');
insert into screen values('scr5', '제 5관', 'gyeonggi4');
insert into screen values('scr6', '제 6관', 'gyeonggi4');
insert into screen values('scr7', '제 7관', 'gyeonggi4');
insert into screen values('scr1', '제 1관', 'gyeonggi5');
insert into screen values('scr2', '제 2관', 'gyeonggi5');
insert into screen values('scr3', '제 3관', 'gyeonggi5');
insert into screen values('scr4', '제 4관', 'gyeonggi5');
insert into screen values('scr5', '제 5관', 'gyeonggi5');
insert into screen values('scr6', '제 6관', 'gyeonggi5');
insert into screen values('scr7', '제 7관', 'gyeonggi5');
insert into screen values('scr1', '제 1관', 'gyeonggi6');
insert into screen values('scr2', '제 2관', 'gyeonggi6');
insert into screen values('scr3', '제 3관', 'gyeonggi6');
insert into screen values('scr4', '제 4관', 'gyeonggi6');
insert into screen values('scr5', '제 5관', 'gyeonggi6');
insert into screen values('scr6', '제 6관', 'gyeonggi6');
insert into screen values('scr7', '제 7관', 'gyeonggi6');
insert into screen values('scr1', '제 1관', 'gyeonggi7');
insert into screen values('scr2', '제 2관', 'gyeonggi7');
insert into screen values('scr3', '제 3관', 'gyeonggi7');
insert into screen values('scr4', '제 4관', 'gyeonggi7');
insert into screen values('scr5', '제 5관', 'gyeonggi7');
insert into screen values('scr6', '제 6관', 'gyeonggi7');
insert into screen values('scr7', '제 7관', 'gyeonggi7');
insert into screen values('scr1', '제 1관', 'incheon1');
insert into screen values('scr2', '제 2관', 'incheon1');
insert into screen values('scr3', '제 3관', 'incheon1');
insert into screen values('scr4', '제 4관', 'incheon1');
insert into screen values('scr5', '제 5관', 'incheon1');
insert into screen values('scr6', '제 6관', 'incheon1');
insert into screen values('scr7', '제 7관', 'incheon1');
insert into screen values('scr1', '제 1관', 'incheon2');
insert into screen values('scr2', '제 2관', 'incheon2');
insert into screen values('scr3', '제 3관', 'incheon2');
insert into screen values('scr4', '제 4관', 'incheon2');
insert into screen values('scr5', '제 5관', 'incheon2');
insert into screen values('scr6', '제 6관', 'incheon2');
insert into screen values('scr7', '제 7관', 'incheon2');
insert into screen values('scr1', '제 1관', 'incheon3');
insert into screen values('scr2', '제 2관', 'incheon3');
insert into screen values('scr3', '제 3관', 'incheon3');
insert into screen values('scr4', '제 4관', 'incheon3');
insert into screen values('scr5', '제 5관', 'incheon3');
insert into screen values('scr6', '제 6관', 'incheon3');
insert into screen values('scr7', '제 7관', 'incheon3');
insert into screen values('scr1', '제 1관', 'incheon4');
insert into screen values('scr2', '제 2관', 'incheon4');
insert into screen values('scr3', '제 3관', 'incheon4');
insert into screen values('scr4', '제 4관', 'incheon4');
insert into screen values('scr5', '제 5관', 'incheon4');
insert into screen values('scr6', '제 6관', 'incheon4');
insert into screen values('scr7', '제 7관', 'incheon4');
insert into screen values('scr1', '제 1관', 'incheon5');
insert into screen values('scr2', '제 2관', 'incheon5');
insert into screen values('scr3', '제 3관', 'incheon5');
insert into screen values('scr4', '제 4관', 'incheon5');
insert into screen values('scr5', '제 5관', 'incheon5');
insert into screen values('scr6', '제 6관', 'incheon5');
insert into screen values('scr7', '제 7관', 'incheon5');
insert into screen values('scr1', '제 1관', 'incheon6');
insert into screen values('scr2', '제 2관', 'incheon6');
insert into screen values('scr3', '제 3관', 'incheon6');
insert into screen values('scr4', '제 4관', 'incheon6');
insert into screen values('scr5', '제 5관', 'incheon6');
insert into screen values('scr6', '제 6관', 'incheon6');
insert into screen values('scr7', '제 7관', 'incheon6');
insert into screen values('scr1', '제 1관', 'jeju1');
insert into screen values('scr2', '제 2관', 'jeju1');
insert into screen values('scr3', '제 3관', 'jeju1');
insert into screen values('scr4', '제 4관', 'jeju1');
insert into screen values('scr5', '제 5관', 'jeju1');
insert into screen values('scr6', '제 6관', 'jeju1');
insert into screen values('scr7', '제 7관', 'jeju1');

package com.prj.nicarnaecar.dao;

import java.util.List;

import com.prj.nicarnaecar.util.RecordCriteria;
import com.prj.nicarnaecar.vo.BookingVO;
import com.prj.nicarnaecar.vo.NoticeVO;
import com.prj.nicarnaecar.vo.VehicleVO;

public interface SearchDAO {

	// 차량 전체 목록
		public List<VehicleVO> AllVehicleList();
		
	// 날짜로 검색한 목록
		public List<VehicleVO> dateVehicleList(String bin, String bout, String eoffice);
		
	// 차량으로 검색한 목록
		public List<VehicleVO> vehicleList();
		
	// 예약 보기 (전)
		VehicleVO reservationView(String vnumber);
		
	// 인도 할 차량 보기
		public List<BookingVO> deliverySearch();
		List<BookingVO> deliverySearch(RecordCriteria recordCriteria);
		int deliverySearchCount();
		
					
	// 반납 할 차량 보기
		public List<BookingVO> returnSearch();
		List<BookingVO> returnSearch(RecordCriteria recordCriteria);
		int returnSearchCount();
		
	// 인도하기
		public void deliveryCar(int bnumber);
	// 반납하기
		public void returnCar(int bnumber);
		
/*	// 주행거리(전) 조회용
		public int viewVKM(String vnumber);*/
}

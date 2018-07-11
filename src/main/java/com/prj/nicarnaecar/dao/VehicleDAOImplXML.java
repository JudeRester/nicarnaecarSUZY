package com.prj.nicarnaecar.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.prj.nicarnaecar.vo.VehicleVO;

@Repository
public class VehicleDAOImplXML implements VehicleDAO{

   @Autowired
   SqlSession sqlSession;
   
   @Override
   public List<VehicleVO> VehicleList() {
      return sqlSession.selectList("VehicleList");
   }

   @Override
   public void insertCar(VehicleVO vehicleVO) {
      sqlSession.insert("insertVehicle", vehicleVO);
   }

   @Override
   public void updateCar(VehicleVO vehicleVO) {
      sqlSession.update("updateVehicle", vehicleVO);
   }

   @Override
   public void deleteCar(String vnumber) {
      sqlSession.delete("deleteVehicle", vnumber);
   }

}
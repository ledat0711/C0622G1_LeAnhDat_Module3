package service;

import model.Facility;

import java.util.List;
import java.util.Map;

public interface IFacilityService {
    List<Facility> selectAllFacility();
    boolean deleteFacility(int id);
    boolean updateRoom(Facility facility);
    boolean updateHouse(Facility facility);
    boolean updateVilla(Facility facility);
    List<Facility> searchFacility(String name);

    void insertRoom(Facility facility);

    void insertHouse(Facility facility);

    void insertVilla(Facility facility);

    Facility selectFacility(int id);
    Map<String,String> checkFacility(Facility facility);
}

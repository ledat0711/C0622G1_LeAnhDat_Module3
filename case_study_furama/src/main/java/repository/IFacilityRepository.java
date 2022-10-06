package repository;

import model.Facility;

import java.util.List;
import java.util.Map;

public interface IFacilityRepository {
    List<Facility> selectAllFacility();
   Facility selectFacility(int id);
    boolean deleteFacility(int id);
    List<Facility> searchFacilityByName(String name);
    boolean updateRoom(Facility facility);
    boolean updateHouse(Facility facility);
    boolean updateVilla(Facility facility);
    void insertRoom(Facility facility);

    void insertHouse(Facility facility);

    void insertVilla(Facility facility);
    Map<String,String> check(Facility facility);
}

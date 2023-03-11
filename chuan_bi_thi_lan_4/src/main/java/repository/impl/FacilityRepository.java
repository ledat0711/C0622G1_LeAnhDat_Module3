package repository.impl;

import connection.DBConnect;
import model.Facility;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityRepository implements IFacilityRepository {
    private static final String SELECT_ALL_FACILITY = " select * from dich_vu ";
    private static final String DELETE_FACILITY = " delete from dich_vu where ma_dich_vu = ? ";
    private static final String INSERT_ROOM = " INSERT INTO `dich_vu` (`ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `dich_vu_mien_phi_di_kem`, `ma_kieu_thue`, `ma_loai_dich_vu`) " +
            " VALUES (?, ?, ?, ?, ?, ?, ?) ";
    private static final String INSERT_HOUSE = " INSERT INTO `dich_vu` (`ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `so_tang`, `ma_kieu_thue`, `ma_loai_dich_vu`)  " +
            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
    private static final String INSERT_VILLA = " INSERT INTO `dich_vu` (`ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi` , `so_tang`, `ma_kieu_thue`, `ma_loai_dich_vu`) " +
            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

    private static final String UPDATE_VILLA = " UPDATE `dich_vu` " +
            " SET `ten_dich_vu` = ?, `dien_tich` = ?, `chi_phi_thue` = ?," +
            " `so_nguoi_toi_da` = ?, `tieu_chuan_phong` = ?, `mo_ta_tien_nghi_khac` = ?, " +
            " `dien_tich_ho_boi` = ?, `so_tang` = ?, `ma_kieu_thue` = ?, `ma_loai_dich_vu` = ? " +
            " WHERE (`ma_dich_vu` = ?) ";
    private static final String UPDATE_HOUSE = " UPDATE `dich_vu` " +
            " SET `ten_dich_vu` = ?, `dien_tich` = ?, `chi_phi_thue` = ?, " +
            " `so_nguoi_toi_da` = ?, `tieu_chuan_phong` = ?, `mo_ta_tien_nghi_khac` = ?, " +
            " `so_tang` = ?, `ma_kieu_thue` = ?, `ma_loai_dich_vu` = ? " +
            " WHERE (`ma_dich_vu` = ?) ";
    private static final String UPDATE_ROOM = "  UPDATE `dich_vu` " +
            " SET `ten_dich_vu` = ?, `dien_tich` = ?, `chi_phi_thue` = ?, " +
            " `so_nguoi_toi_da` = ?, `dich_vu_mien_phi_di_kem` = ?, `ma_kieu_thue` = ?, `ma_loai_dich_vu` = ? " +
            " WHERE (`ma_dich_vu` = ?) ";
    private static final String SELECT_FACILITY = " select * from dich_vu where ma_dich_vu =? ";
    private static final String SEARCH_FACILITY = " select * from dich_vu where ten_dich_vu  like ?";


    @Override
    public List<Facility> selectAllFacility() {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer id = resultSet.getInt("ma_dich_vu");
                String name = resultSet.getString("ten_dich_vu");
                Integer area = resultSet.getInt("dien_tich");
                Double cost = resultSet.getDouble("chi_phi_thue");
                Integer maxPeople = resultSet.getInt("so_nguoi_toi_da");
                Integer rentTypeId = resultSet.getInt("ma_kieu_thue");
                Integer facilityTypeId = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = resultSet.getString("mo_ta_tien_nghi_khac");
                Double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                String numberOfFloors = resultSet.getString("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                Facility facility = new Facility(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return facilityList;
    }

    @Override
    public Facility selectFacility(int id) {
        Facility facility = new Facility();
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FACILITY);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer idFacility = resultSet.getInt("ma_dich_vu");
                String name = resultSet.getString("ten_dich_vu");
                Integer area = resultSet.getInt("dien_tich");
                Double cost = resultSet.getDouble("chi_phi_thue");
                Integer maxPeople = resultSet.getInt("so_nguoi_toi_da");
                Integer rentTypeId = resultSet.getInt("ma_kieu_thue");
                Integer facilityTypeId = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = resultSet.getString("mo_ta_tien_nghi_khac");
                Double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                String numberOfFloors = resultSet.getString("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                facility = new Facility(idFacility, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }

    @Override
    public boolean deleteFacility(int id) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_FACILITY);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return true;
    }

    @Override
    public Map<String, String> check(Facility facility) {

        return null;
    }

    @Override
    public List<Facility> searchFacilityByName(String keyWork) {
        Connection connection = DBConnect.getConnectDB();
        List<Facility> facilityList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_FACILITY);
            preparedStatement.setString(1,"%" + keyWork +"%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Integer id= resultSet.getInt("ma_dich_vu");
                String nameFacility  = resultSet.getString("ten_dich_vu");
                Integer area = resultSet.getInt("dien_tich");
                Double cost = resultSet.getDouble("chi_phi_thue");
                Integer maxPeople = resultSet.getInt("so_nguoi_toi_da");
                Integer rentTypeId = resultSet.getInt("ma_kieu_thue");
                Integer facilityTypeId = resultSet.getInt("ma_loai_dich_vu");
                String standardRoom = resultSet.getString("tieu_chuan_phong");
                String descriptionOtherConvenience = resultSet.getString("mo_ta_tien_nghi_khac");
                Double poolArea = resultSet.getDouble("dien_tich_ho_boi");
                String numberOfFloors = resultSet.getString("so_tang");
                String facilityFree = resultSet.getString("dich_vu_mien_phi_di_kem");
                Facility facility = new Facility(id,nameFacility,area,cost,maxPeople,rentTypeId,facilityTypeId,standardRoom,descriptionOtherConvenience
                ,poolArea,numberOfFloors,facilityFree);
                facilityList.add(facility);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return facilityList;
    }

    @Override
    public boolean updateRoom(Facility facility) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ROOM);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getFacilityFree());
            preparedStatement.setInt(6, facility.getRentTypeId());
            preparedStatement.setInt(7, facility.getFacilityTypeId());
            preparedStatement.setInt(8, facility.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    @Override
    public boolean updateHouse(Facility facility) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_HOUSE);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setString(7, facility.getNumberOfFloors());
            preparedStatement.setInt(8, facility.getRentTypeId());
            preparedStatement.setInt(9, facility.getFacilityTypeId());
            preparedStatement.setInt(10, facility.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    @Override
    public boolean updateVilla(Facility facility) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VILLA);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setString(8, facility.getNumberOfFloors());
            preparedStatement.setInt(9, facility.getRentTypeId());
            preparedStatement.setInt(10, facility.getFacilityTypeId());
            preparedStatement.setInt(11, facility.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    @Override
    public void insertRoom(Facility facility) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(this.INSERT_ROOM);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getFacilityFree());
            preparedStatement.setInt(6, facility.getRentTypeId());
            preparedStatement.setInt(7, facility.getFacilityTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void insertHouse(Facility facility) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(this.INSERT_HOUSE);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setString(7, facility.getNumberOfFloors());
            preparedStatement.setInt(8, facility.getRentTypeId());
            preparedStatement.setInt(9, facility.getFacilityTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void insertVilla(Facility facility) {
        Connection connection = DBConnect.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(this.INSERT_VILLA);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setString(5, facility.getStandardRoom());
            preparedStatement.setString(6, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(7, facility.getPoolArea());
            preparedStatement.setString(8, facility.getNumberOfFloors());
            preparedStatement.setInt(9, facility.getRentTypeId());
            preparedStatement.setInt(10, facility.getFacilityTypeId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

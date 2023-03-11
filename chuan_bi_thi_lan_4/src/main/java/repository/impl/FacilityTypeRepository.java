package repository.impl;

import connection.DBConnect;
import model.Facility;
import model.FacilityType;
import repository.IFacilityTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeRepository {
    private static final String SELECT_ALL_FACILITY_TYPE = "  select * from loai_dich_vu";
    @Override
    public List<FacilityType> selectAllFacilityType() {
        Connection connection = DBConnect.getConnectDB();
        List<FacilityType> facilityTypeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("ma_loai_dich_vu");
                String name = resultSet.getString("ten_loai_dich_vu");
                FacilityType facilityType = new FacilityType(id,name);
                facilityTypeList.add(facilityType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return facilityTypeList;
    }
}

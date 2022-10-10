package repository.impl;

import connection.DBConnect;
import model.RentType;
import repository.IRentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private  static final  String SELECT_ALL_RENT_TYPE = " select * from kieu_thue ";
    @Override
    public List<RentType> selectAllRentType() {
        Connection connection = DBConnect.getConnectDB();
        List<RentType> rentTypeList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("ma_kieu_thue");
                String name = resultSet.getString("ten_kieu_thue");
                RentType rentType = new RentType(id,name);
                rentTypeList.add(rentType);
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
        return rentTypeList;
    }
}

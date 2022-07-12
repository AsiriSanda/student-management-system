package controller;

import db.DbConnection;
import javafx.event.ActionEvent;
import javafx.scene.control.TextField;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TeacherSaveFormController {
    public TextField txtId;
    public TextField txtName;
    public TextField txtAddress;
    public TextField txtNic;
    public TextField txtContact;

    public void SaveTeacherOnAction(ActionEvent actionEvent) {

    }

    boolean saveTeacher(Teacher t) throws SQLException, ClassNotFoundException {
        Connection con= DbConnection.getInstance().getConnection();
        String query="INSERT INTO Student VALUES(?,?,?,?,?,?)";
        PreparedStatement stm = con.prepareStatement(query);
        stm.setObject(1,s.getStudent_id());
        stm.setObject(2,s.getStudent_name());
        stm.setObject(3,s.getEmail());
        stm.setObject(4,s.getContact());
        stm.setObject(5,s.getAddress());
        stm.setObject(6,s.getNic());


        return stm.executeUpdate()>0;

    }
}

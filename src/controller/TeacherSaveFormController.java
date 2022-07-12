package controller;

import db.DbConnection;
import javafx.event.ActionEvent;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import model.Student;
import model.Teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TeacherSaveFormController {
    public TextField txtId;
    public TextField txtName;
    public TextField txtAddress;
    public TextField txtNic;
    public TextField txtContact;

    public void SaveTeacherOnAction(ActionEvent actionEvent) throws SQLException, ClassNotFoundException {
        Teacher t1 = new Teacher(
                txtId.getText(),txtName.getText(),
                txtAddress.getText(),txtNic.getText(),txtContact.getText()
        );


        if(saveTeacher(t1))
            new Alert(Alert.AlertType.CONFIRMATION, "Saved..").show();
        else
            new Alert(Alert.AlertType.WARNING, "Try Again..").show();




    }

    boolean saveTeacher(Teacher t) throws SQLException, ClassNotFoundException {
        Connection con= DbConnection.getInstance().getConnection();
        String query="INSERT INTO Teacher VALUES(?,?,?,?,?)";
        PreparedStatement stm = con.prepareStatement(query);
        stm.setObject(1,t.getTeacher_id());
        stm.setObject(2,t.getName());
        stm.setObject(3,t.getNic());
        stm.setObject(4,t.getContact());
        stm.setObject(5,t.getAddress());


        return stm.executeUpdate()>0;

    }
}

package controller;

import db.DbConnection;
import javafx.event.ActionEvent;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentSaveFormController {
    public TextField txtId;
    public TextField txtName;
    public TextField txtAddress;
    public TextField txtNic;
    public TextField txtEmail;
    public TextField txtContact;

    public void SaveStudentOnAction(ActionEvent actionEvent) throws SQLException, ClassNotFoundException {
        Student s1 = new Student(
                txtId.getText(),txtName.getText(),
                txtAddress.getText(),txtNic.getText(),txtEmail.getText(),txtContact.getText()
        );


        if(saveStudent(s1))
            new Alert(Alert.AlertType.CONFIRMATION, "Saved..").show();
        else
            new Alert(Alert.AlertType.WARNING, "Try Again..").show();


    }

    boolean saveStudent(Student s) throws SQLException, ClassNotFoundException {
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

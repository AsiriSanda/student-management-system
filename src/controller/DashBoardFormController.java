package controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

import java.io.IOException;

public class DashBoardFormController {
    public AnchorPane DashBoardFormContext;

    public void openStudentSaveForm(ActionEvent actionEvent) throws IOException {
        Parent load = FXMLLoader.load(getClass().getResource("../views/StudentSaveForm.fxml"));
        Scene scene = new Scene(load);
        Stage stage = new Stage();
        stage.setScene(scene);
        stage.show();
    }

    public void openTeacherSaveForm(ActionEvent actionEvent) {
    }

    public void openSubjectSaveForm(ActionEvent actionEvent) {
    }

    public void openCourseSaveForm(ActionEvent actionEvent) {
    }
}

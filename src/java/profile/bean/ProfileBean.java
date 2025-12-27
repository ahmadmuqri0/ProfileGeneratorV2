/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profile.bean;

/**
 *
 * @author muqri
 */
public class ProfileBean implements java.io.Serializable {
    private int id;
    private String fullName;
    private String studentID;
    private String program;
    private String email;
    private String hobbies;
    private String strengths;
    private String ambition;
    private String quotes;
    private String intro;
    
    public ProfileBean() {}
    
    public int getId() {
        return id;
    }
    
    public String getFullName() {
        return fullName;
    }
    
    public String getStudentId() {
        return studentID;
    }
        
    public String getProgram() {
        return program;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getHobbies() {
        return hobbies;
    }
    
    public String getStrengths() {
        return strengths;
    }
    
    public String getAmbition() {
        return ambition;
    }
        
    public String getQuotes() {
        return quotes;
    }
    
    public String getIntro() {
        return intro;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    public void setStudentId(String studentID) {
        this.studentID = studentID;
    }
        
    public void setProgram(String program) {
        this.program = program;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }
    
    public void setStrengths(String strengths) {
        this.strengths = strengths;
    }
    
    public void setAmbition(String ambition) {
        this.ambition = ambition;
    }
    
    public void setQuotes(String quotes) {
        this.quotes = quotes;
    }
    
    public void setIntro(String intro) {
        this.intro = intro;
    }
}

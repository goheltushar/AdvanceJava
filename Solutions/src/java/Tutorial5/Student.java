/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tutorial5;

//Create Employee Class
import javax.persistence.*;

@Entity
@Table(name = "StudentDb")
public class Student {

    @Id
    @Column(name = "ENROLLMENTNO")
    private int ENROLLMENTNO;
    
    @Column(name = "NAME")
    private String NAME;
    
    @Column(name = "SPI")
    private double SPI;
    
    @Column(name = "CPI")
    private double CPI;

    public Student() {
    }

    public int getENROLLMENTNO() {
        return ENROLLMENTNO;
    }

    public void setENROLLMENTNO(int ENROLLMENTNO) {
        this.ENROLLMENTNO = ENROLLMENTNO;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public double getSPI() {
        return SPI;
    }

    public void setSPI(double SPI) {
        this.SPI = SPI;
    }

    public double getCPI() {
        return CPI;
    }

    public void setCPI(double CPI) {
        this.CPI = CPI;
    }

   
}

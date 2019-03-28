//Create Application Class
package Tutorial5;

import java.util.*;
import org.hibernate.*;
import org.hibernate.cfg.*;

public class ManageStudent {

    private static SessionFactory factory;

    public static void main(String[] args) {
        try {
            factory = new AnnotationConfiguration().configure().addAnnotatedClass(Tutorial5.Student.class).
                    buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Failed to create sessionFactory object." + ex);
            throw new ExceptionInInitializerError(ex);
        }
        ManageStudent ME = new ManageStudent();

        ME.listStudents();

    }

    public void listStudents() {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            List students = session.createQuery("FROM Student").list();
            for (Iterator iterator = students.iterator(); iterator.hasNext();) {
                Student student = (Student) iterator.next();
                System.out.print("Enrollment No: " + student.getENROLLMENTNO());
                System.out.print("  Name: " + student.getNAME());
                System.out.print("  SPI: " + student.getSPI());
                System.out.println("  CPI: " + student.getCPI());
            }
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

} // class ManageStudent

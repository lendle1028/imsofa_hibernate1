/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rocks.imsofa.jpasample1;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

/**
 *
 * @author lendle
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        EntityManager em=Persistence.createEntityManagerFactory("database_systems").createEntityManager();
        Bar bar=em.find(Bar.class, "Joe's");
        System.out.println(bar);
        em.close();
        System.exit(0);
    }
    
}

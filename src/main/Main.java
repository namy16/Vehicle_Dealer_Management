package main;

import Dao.UserDaoImpl;
import org.hibernate.*;
import org.hibernate.query.Query;
import org.hibernate.cfg.Configuration;
import util.VehicleService;

import javax.persistence.metamodel.EntityType;

import java.util.Map;

/**
 * Created by parashan on 7/26/2017.
 */
public class Main {
    private static final SessionFactory ourSessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();

            ourSessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }

    public int vehicle_service(String model_no, String owner_name, int service_id, int reading, String service_type) {

        Session session = ourSessionFactory.openSession();
        Transaction tx = null;
        Integer employeeID = null;
        try {
            tx = session.beginTransaction();
            VehicleService v = new VehicleService(model_no, owner_name, service_id, reading, service_type);
            employeeID = (Integer) session.save(v);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return 1;
    }

   /* public static void main(final String[] args) throws Exception {
        // final Session session = getSession();


        Session session = ourSessionFactory.openSession();
       /* Transaction tx = null;
        //Integer employeeID = null;
        try{
            tx = session.beginTransaction();
            VehicleService v = new VehicleService("123","naman",12213,6000,"free");

            session.save(v);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            //session.close();
        }
        try {
            System.out.println("querying all the managed entities...");
            final Metamodel metamodel = session.getSessionFactory().getMetamodel();
            for (EntityType<?> entityType : metamodel.getEntities()) {
                final String entityName = entityType.getName();
                final Query query = session.createQuery("from " + entityName);
                System.out.println("executing: " + query.getQueryString());
                for (Object o : query.list()) {
                    System.out.println("  " + o);
                }
            }
        } finally {
            session.close();
        }
    }*/

}
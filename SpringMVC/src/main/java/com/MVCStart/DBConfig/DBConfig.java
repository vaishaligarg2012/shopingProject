package com.MVCStart.DBConfig;


import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.MVCStart.Models.Address;
import com.MVCStart.Models.Cart;
import com.MVCStart.Models.Category;
import com.MVCStart.Models.Item;
import com.MVCStart.Models.Order;
import com.MVCStart.Models.Payment;
import com.MVCStart.Models.Product;
import com.MVCStart.Models.Supplier;
import com.MVCStart.Models.User;
import com.MVCStart.Models.UserAddress;

@Configuration
@EnableTransactionManagement 
@ComponentScan(basePackages={"com.MVCStart"})
public class DBConfig {  

	@Bean(name="dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource= new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/SpringMvcORMProject");
		dataSource.setUsername("sa");
		dataSource.setPassword("");
		return dataSource;
	}

	@Bean(name="sessionFactory")  
	public SessionFactory getSessionFactory(){
		System.out.println("About to create  Sessionfactory");
		//will hold hibernate configuration
	
		Properties p=new Properties(); 
		p.setProperty("hibernate.dialect","org.hibernate.dialect.H2Dialect");
		p.setProperty("hibernate.hbm2ddl.auto", "update");
		p.setProperty("hibernate.show_sql","true");
		
		LocalSessionFactoryBuilder sb=new LocalSessionFactoryBuilder(getDataSource());
		sb.addProperties(p);
		sb.scanPackages("com.MVCStart");
		sb.addAnnotatedClass(Address.class);
		sb.addAnnotatedClass(Supplier.class);  
		sb.addAnnotatedClass(Category.class);
		sb.addAnnotatedClass(Product.class);
		sb.addAnnotatedClass(User.class);
		sb.addAnnotatedClass(Item.class);
		sb.addAnnotatedClass(Cart.class);
	    sb.addAnnotatedClass(Order.class);
		sb.addAnnotatedClass(UserAddress.class);
		sb.addAnnotatedClass(Payment.class);
		//sb.addAnnotatedClass(OrderItems.class);
		
		System.out.println("Session Factory Created");
		return sb.buildSessionFactory();
	}  
		 
	@Bean(name="hibernateTransection")
	@Autowired
	public HibernateTransactionManager getHibernateTransectionManager(SessionFactory sessionFactory) {
		System.out.println("About to create HibernateTransactionManager");
		HibernateTransactionManager txManager=new HibernateTransactionManager(sessionFactory);
		System.out.println("Hibernate Transaction created");
		return txManager;
	}

	@Bean(name="passwordEncoder")
	public PasswordEncoder passwordEncoder(){
		System.out.println("Creating password Encoder"); 
		return new BCryptPasswordEncoder();
	}
}

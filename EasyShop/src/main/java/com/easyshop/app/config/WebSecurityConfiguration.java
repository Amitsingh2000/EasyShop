package com.easyshop.app.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.DaoAuthenticationConfigurer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter
{
	@Autowired
	private UserDetailsService userDetailService;
	@Bean
	AuthenticationProvider authenticationProvider()
	{
		DaoAuthenticationProvider provider=new  DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailService);
		provider.setPasswordEncoder(new BCryptPasswordEncoder());
		
		return provider;
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception 
	{
		http.authorizeRequests()
			.antMatchers("/Home","/register","/registerUser").permitAll()
			.antMatchers("/adminDashboard/**").hasAuthority("ADMIN")
			.antMatchers("/userDashboard/**").hasAnyAuthority("USER")
			.anyRequest()
			.authenticated()
			.and()
			.formLogin()
			.loginPage("/login").permitAll()
			.defaultSuccessUrl("/Dashboard", true)
		    .and()
		    .logout()
		    .logoutSuccessUrl("/Home?logout")
		    .and()
		    .csrf().disable();
	}
	@Override
	public void configure(WebSecurity web) throws Exception 
	{
	  web.ignoring().antMatchers("/resources/**");
	 }
	

}

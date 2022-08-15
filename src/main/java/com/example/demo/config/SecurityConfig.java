package com.example.demo.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
@Configuration
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final AuthProvider authProvider;

    @Override
    public void configure(WebSecurity web) {
        web.ignoring()
                .antMatchers( "/js/**", "/css/**");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/login", "/signup", "/", "/board").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/")
                .and()
                .logout()
                .logoutSuccessUrl("/")
                .and()
                .authenticationProvider(authProvider);
    }

}


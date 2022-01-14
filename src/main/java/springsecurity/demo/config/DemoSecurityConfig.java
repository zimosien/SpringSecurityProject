package springsecurity.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

@Configuration
@EnableWebSecurity
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        // add our users for in memory authentication

        User.UserBuilder users = User.withDefaultPasswordEncoder();

        auth.inMemoryAuthentication()
                .withUser(users.username("john").password("test123").roles("EMPLOYEE"))
                .withUser(users.username("mary").password("test123").roles("EMPLOYEE","MANAGER"))
                .withUser(users.username("susan").password("test123").roles("ADMIN","EMPLOYEE"));
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        Restrict access based on the HttpServletRequest
        http.authorizeRequests()
                .antMatchers("/")
//                so there is sth you beware of. we want the home page to be accessible to every role.
//                there are 2 ways to do this:
//                1- use hasRole and mention the common role declared for all the users.
//                2- use hasAnyRole and mention the roles who can access our home url. if this is the case
//                then you don't need to declare the common role for the users.
                .hasRole("EMPLOYEE")
                .antMatchers("/manager/**")
                .hasRole("MANAGER")
                .antMatchers("/admin/**")
                .hasRole("ADMIN")
//                Any request to the app must be authenticated (i.e. logged in)
                .anyRequest().authenticated()
                .and()
//                Customizing the form login process
                .formLogin()
//                show our custom form at the request mapping "/showMyLoginPage"
                .loginPage("/showMyLoginPage")
//                login form should "POST" data to this URL for processing (check user id and password)
                .loginProcessingUrl("/authenticateTheUser")
//                allow everyone to see login page. no need to be logged in.
                .permitAll()
                .and()
                .logout()
                .permitAll()
                .and().exceptionHandling().accessDeniedPage("/accessDenied");

    }
}
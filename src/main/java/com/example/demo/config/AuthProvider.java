package com.example.demo.config;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.model.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AuthProvider implements AuthenticationProvider {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String username = (String) authentication.getPrincipal();
        String password = (String) authentication.getCredentials();

        Member user = memberMapper.getUserById(username);

        if (user == null) {
            throw new UsernameNotFoundException("user not found");
        }

        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new BadCredentialsException("id,pw X" + username);
        }
        if (!user.isEnabled()) {
            throw new AuthenticationCredentialsNotFoundException(username);
        }
        return new UsernamePasswordAuthenticationToken(user, password, user.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}

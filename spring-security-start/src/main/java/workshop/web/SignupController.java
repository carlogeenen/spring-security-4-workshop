package workshop.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import workshop.data.User;
import workshop.data.UserRepository;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/signup")
public class SignupController {

    private final UserRepository userRepository;

    @Autowired
    public SignupController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String signupForm(@ModelAttribute User user) {
        return "signup";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String signup(@Valid User user, BindingResult result, RedirectAttributes redirect) {
        if (result.hasErrors()) {
            return "signup";
        }
        user.setRole("ROLE_USER");
        user = userRepository.save(user);
        redirect.addFlashAttribute("globalMessage", "Successfully signed up.");

        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(user.getRole());
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.getEmail(),user.getPassword(), authorities);
        Authentication auth = new UsernamePasswordAuthenticationToken(userDetails, user.getPassword(), authorities);
        SecurityContextHolder.getContext().setAuthentication(auth);

        return "redirect:/";
    }

}

package workshop.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import workshop.data.Message;
import workshop.data.MessageRepository;
import workshop.data.User;
import workshop.data.UserRepository;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class MessageController {

    private final MessageRepository messageRepository;
    private final UserRepository userRepository;

    @Autowired
    public MessageController(MessageRepository messageRepository,UserRepository userRepository) {
        this.messageRepository = messageRepository;
        this.userRepository = userRepository;
    }

    @RequestMapping(method= RequestMethod.GET)
    public ModelAndView list(@AuthenticationPrincipal User currentUser) {
        Iterable<Message> messages = messageRepository.findByToId(currentUser.getId());
        return new ModelAndView("inbox", "messages", messages);
    }

    @RequestMapping(value = "{id}", method=RequestMethod.GET)
    public ModelAndView view(@PathVariable Long id) {
        Message message = messageRepository.findOne(id);
        return new ModelAndView("show", "message", message);
    }

    @RequestMapping(value = "{id}", method=RequestMethod.DELETE)
    public String delete(@PathVariable("id") Message message, RedirectAttributes redirect) {
        messageRepository.delete(message);
        redirect.addFlashAttribute("globalMessage", "Message removed successfully.");
        return "redirect:/";
    }

    @RequestMapping(params="form", method=RequestMethod.GET)
    public String createForm(@ModelAttribute MessageForm messageForm) {
        return "compose";
    }

    @RequestMapping(method=RequestMethod.POST)
    public String create(@Valid MessageForm messageForm, BindingResult result, RedirectAttributes redirect) {
        User to = userRepository.findByEmail(messageForm.getToEmail());
        if (to == null) {
            result.rejectValue("toEmail", "toEmail", "User not found.");
        }
        if (result.hasErrors()) {
            return "compose";
        }

        Message message = new Message();
        message.setSummary(messageForm.getSummary());
        message.setText(messageForm.getText());
        message.setTo(to);

        messageRepository.save(message);
        redirect.addFlashAttribute("globalMessage", "Message sent successfully.");
        return "redirect:/";
    }

}

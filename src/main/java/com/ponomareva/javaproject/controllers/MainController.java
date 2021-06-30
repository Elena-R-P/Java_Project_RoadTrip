package com.ponomareva.javaproject.controllers;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.oidc.user.OidcUser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ponomareva.javaproject.models.Day;
import com.ponomareva.javaproject.models.Trip;
import com.ponomareva.javaproject.models.User;
import com.ponomareva.javaproject.services.DayService;
import com.ponomareva.javaproject.services.TripService;
import com.ponomareva.javaproject.services.UserService;
import com.ponomareva.javaproject.validator.UserValidator;



@Controller
public class MainController {
	private final UserService userService;
	private final UserValidator userValidator;
	private final TripService tripService;
	private final DayService dayService;
	
	public MainController(
			UserService userService,
			UserValidator userValidator,
			TripService tripService,
			DayService dayService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.tripService = tripService;
		this.dayService = dayService;
	}
	
	private Map<String, LocalDateTime> usersLastAccess = new HashMap<>();
	
	
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("user", new User());
		return "index.jsp";
	}
//	@GetMapping("/oauth2/authorization/okta")
//    String helloUser(@AuthenticationPrincipal OidcUser user) {
//        return "Hello " + user.getAttributes().get("email");
//    }
//	
	
	@RequestMapping(value="/registration", method=RequestMethod.POST)
	public String register(
			@Valid @ModelAttribute ("user") User user,
			BindingResult result,
			HttpSession session) {
		userValidator.validate(user,  result);
		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			User u = userService.registerUser(user);
			session.setAttribute("userId", u.getId());
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
			@RequestParam(value="email") String email,
			@RequestParam(value="password") String password,
			HttpSession session,
			RedirectAttributes redirect) {
		// is authentic login
		if(userService.authenticateUser(email,  password)) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			redirect.addFlashAttribute("success", "");
			return "redirect:/dashboard";
		} else {
			// is not authentic, add errors
			redirect.addFlashAttribute("error", "Invalid Login Credentials");
			return "redirect:/";
		}
	}
	@RequestMapping("/dashboard")
	public String dashboard(
			Model model,
			HttpSession session,
			RedirectAttributes redirect,
			@Param("keyword") String keyword) {
		Long userId = (Long) session.getAttribute("userId");
// CHECK IF USER LOGED IN
		if(userId == null) {
			redirect.addFlashAttribute("please", "Please Login befre entering our site");
			return "redirect:/";
		}
		List<Trip> trips = tripService.listAll(keyword);
		model.addAttribute("trips", trips);
		model.addAttribute("keyword", keyword);
		model.addAttribute("user", userService.findUserById(userId));
		model.addAttribute("users", userService.findAllUsers());
		return "dashboard.jsp";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/mytrips")
	public String mytrips() {
		
		return "mytrips.jsp";
	}
	
// creating a new trip
	
	@RequestMapping("/trip/new")
	public String newTrip(Model model, HttpSession session, RedirectAttributes redirect) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			redirect.addFlashAttribute("please", "Please Login befre entering our site");
			return "redirect:/";
		}
		model.addAttribute("trip", new Trip());
		return "newtrip.jsp";
	}
	@RequestMapping(value="/trip/new", method=RequestMethod.POST)
	public String createTrip(@Valid @ModelAttribute("trip") Trip trip, BindingResult result) {
		if(result.hasErrors()) {
			return "newtrip.jsp";
		} else {
			tripService.saveTrip(trip);
			return "redirect:/day/new";
		}
	}
//show trips and days
	@RequestMapping("/trip/show/{id}")
	public String showTripDays(@PathVariable("id") Long id, Model model) {
		model.addAttribute("trip", tripService.findTripById(id));
		model.addAttribute("day", dayService.findDayById(id));
		model.addAttribute("days", dayService.findAllDays());
		return "showtrip.jsp";
	}
// Create a new day
	@RequestMapping("/day/new")
	public String newDay(Model model) {
		model.addAttribute("day", new Day());
		List<Trip> trips = tripService.findAllTrips();
		model.addAttribute("trips", trips);
		return "newday.jsp";
	}
	@RequestMapping(value="/day/new", method=RequestMethod.POST)
	public String createDay(@Valid @ModelAttribute("day") Day day, BindingResult result, Model model) {
		model.addAttribute("trips", tripService.findAllTrips());
		if (result.hasErrors()) {
			return "newday.jsp";
		} else {
			dayService.saveDay(day);
			return "redirect:/day/new";
		}
	}
// Edit day
	@RequestMapping("/day/{id}")
	public String editDay(
			@PathVariable("id") Long id,
			Model model) {
		model.addAttribute("day", dayService.findDayById(id));
		model.addAttribute("trips", tripService.findAllTrips());
		return "editday.jsp";
	}
	
	@RequestMapping(value="/day/{id}", method=RequestMethod.PUT)
	public String updateDay(@Valid @ModelAttribute("day") Day day, BindingResult result, Model model) {
		model.addAttribute("trips", tripService.findAllTrips());
		
		if(result.hasErrors()) {
			return "editday.jsp";
		} else {
			dayService.saveDay(day);
			return "redirect:/dashboard";
		}
	}
	
	
	
// Delete day
	@RequestMapping(value="/day/delete/{id}", method=RequestMethod.DELETE)
    public String deleteDay(@PathVariable("id") Long id) {
        dayService.deleteDay(id);
        return "redirect:/trip/new";
    }
	
	
	
}

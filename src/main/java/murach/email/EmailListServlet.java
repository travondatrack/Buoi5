package murach.email;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import murach.business.User;
import murach.data.UserDB;

public class EmailListServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(EmailListServlet.class.getName());

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        logger.info("Received POST request");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = "/index.html";

        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }

        if (action.equals("join")) {
            url = "/index.html";
        } else if (action.equals("add")) {
            String firstName = trimOrEmpty(request.getParameter("firstName"));
            String lastName  = trimOrEmpty(request.getParameter("lastName"));
            String email     = trimOrEmpty(request.getParameter("email"));

            String dob = trimOrEmpty(request.getParameter("dob"));
            String heardFrom = trimOrEmpty(request.getParameter("heardFrom"));
            String wantsUpdates = request.getParameter("wantsUpdates");
            String emailOK = request.getParameter("emailOK");
            String contact = trimOrEmpty(request.getParameter("contact"));

            logger.log(Level.INFO, "Action: {0}", action);
            logger.log(Level.INFO, "First Name: {0}", firstName);
            logger.log(Level.INFO, "Last Name: {0}", lastName);
            logger.log(Level.INFO, "Email: {0}", email);
            logger.log(Level.INFO, "DOB: {0}", dob);
            logger.log(Level.INFO, "Heard From: {0}", heardFrom);
            logger.log(Level.INFO, "Wants Updates: {0}", wantsUpdates);
            logger.log(Level.INFO, "Email OK: {0}", emailOK);
            logger.log(Level.INFO, "Contact: {0}", contact);

            String message = null;
            if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()) {
                message = "Vui lòng nhập đầy đủ họ, tên và email.";
            } else if (!isValidEmail(email)) {
                message = "Định dạng email không hợp lệ.";
            }

            if (message != null) {
                request.setAttribute("user", new User(firstName, lastName, email));
                request.setAttribute("message", message);
                url = "/index.html";
            } else {
                User user = new User(firstName, lastName, email);
                user.setDob(dob);
                user.setHeardFrom(heardFrom);
                user.setWantsUpdates(wantsUpdates != null);
                user.setEmailOK(emailOK != null);
                user.setContact(contact);
                
                UserDB.insert(user);

                // Copy scriptlet code from footer.jsp to get current year
                Calendar currentDate = new GregorianCalendar();
                int currentYear = currentDate.get(Calendar.YEAR);
                request.setAttribute("currentYear", currentYear);

                request.setAttribute("user", user);
                url = "/survey.jsp";
            }
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        getServletContext()
                .getRequestDispatcher("/index.html")
                .forward(request, response);
    }

    private static String trimOrEmpty(String s) {
        return s == null ? "" : s.trim();
    }

    private static boolean isValidEmail(String email) {
        return email != null && email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$");
    }
}

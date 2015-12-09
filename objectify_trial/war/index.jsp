<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.*" %>

<%@ page import="com.example.guestbook.Greeting" %>
<%@ page import="com.example.guestbook.Guestbook" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%@ page import="com.example.guestbook.Greeting" %>
<%@ page import="com.example.guestbook.Guestbook" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>

<%
	// some constants
	String guestbookName = "default";
	String content = new Date().toString();
	String userId = "test";
	String email = "test@test.com";

	Greeting newGreeting = new Greeting(guestbookName, content, userId, email);

	// Use Objectify to save the greeting and now() is used to make the call synchronously as we
	// will immediately get a new page using redirect and we want the data to be present.
	ObjectifyService.ofy().save().entity(newGreeting).now();
%>

<%
    // Create the correct Ancestor key
    
      Key<Guestbook> theBook = Key.create(Guestbook.class, guestbookName);

    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Guestbook.
      List<Greeting> greetings = ObjectifyService.ofy()
          .load()
          .type(Greeting.class) // We want only Greetings
          .ancestor(theBook)    // Anyone in this book
          .order("-date")       // Most recent first - date is indexed.
          .limit(5)             // Only show 5 of them.
          .list();

    if (greetings.isEmpty()) {
    	
    } else {
    	// Look at all of our greetings
        for (Greeting greeting : greetings) {
            String author;
            if (greeting.author_email == null) {
                author = "An anonymous person";
            } else {
                author = greeting.author_email;
                String author_id = greeting.author_id;
            }
        }
    }
%>

<pre>
Greetings:

<%=greetings %>
</pre>





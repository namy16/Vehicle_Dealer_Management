package session_tracking;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created by parashan on 7/21/2017.
 */
public class ActiveUsers implements HttpSessionListener{
    private static int activeSessions = 0;

    public void sessionCreated(HttpSessionEvent se)
    {
        activeSessions++;
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        if(activeSessions > 0)
            activeSessions--;
    }

    public static int getActiveSessions() {
        return activeSessions;
    }

}


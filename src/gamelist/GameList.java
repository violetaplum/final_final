package gamelist;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gamevo.GameVO;

public interface GameList {

	abstract void createL(HttpServletRequest request, HttpServletResponse response)	throws Exception;
	
}

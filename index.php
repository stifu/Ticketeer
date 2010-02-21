<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="swedish">
<?php 
require 'php/classes.php';
require 'php/snipets.php';

Head();

$pageid = 0;
$controller = new Controller();
$SQLmanager = new SQLmanager();

//if a session is active, skip directly to main inteface
session_start();

if (isset($_SESSION['user']))
	require 'php/mainpage.php';

else if (isset($_GET['pageid']))
	{
		$pageid = $_GET['pageid'];
		
		//if session isn't set this checks for database reference for the inputed username
		if ($pageid == 'login')
		{
			//does fuck all
						
			//gogo sql power rangers!
			if ($SQLmanager->checkname($_POST["username"], 'users'))
				{
					require 'php/mainpage.php';
				}
				
			else
			{
				require 'tpl/login.tpl';
				echo '<br/><span style="color: red">wrong username, please try again.</span><br/><br/>';
			}
		}
		
		else
			require 'tpl/404.tpl';
	}
else
	require 'tpl/login.tpl';

Foot();
?>
</body>
</html>
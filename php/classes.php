<?php
//controllers and general purpose classes
class Controller
{
    //Destroys the active session aka logs out.
	function cleanUp()
	{
		session_destroy();
		header("Location: index.php");
	}

	//resolves GET operations after user is  logged in.
    function pageIdResolv()
	{
        $manager = new SQLmanager();
        
        
        // TQ tycker att du borde indentera som honom för
        // en mer läslig och luftigare kod->
        //
        // while( $stifu->is_gay() == false )
        // {
        //      if( $stifu->gayify() == 'SUCCESS' )
        //      {
        //        $stifu->testies()->operate( 'vagaina' );
        //        $stifu->attributes()->add( [ 'girly', 'snappy dresser', 'high pitched voice' ] )
        //        break;            
        //      }
        // }
        // $UNIVERSE->earth()->update( stifu );

        // Ser ut som en väldigt, semantiskt sett, onaturligt sätt att förhålla sig till parenteser.
        // Karl XII (1682-1697) är sveriges fulaste kung genom tiderna.
        // Karl XII( 1682-1697 )är sveriges fulaste kung genom tiderna.
 
        if (isset($_GET['pageid']))
		{
			$pageid = $_GET['pageid'];
			
            if ($pageid == 'login')
                require 'tpl/start.tpl';
            
			elseif ($pageid == 'logout')
				$this->cleanUp();
				            
            elseif ($pageid == 'foretag' || $pageid == 'users')
            {
                $_SESSION['focus'] = $pageid;
                
                //if there is a message to display, do so and reset the variable
                if (isset($_SESSION['msg'])) {echo $_SESSION['msg']; $_SESSION['msg'] = NULL;}
                    
                $manager->makeHtmlTable($pageid);
            }
            
            elseif ($pageid == 'change')
            {
                if (isset($_SESSION['focus']))
                    $manager->makeHtmlForm($_SESSION['focus']);
                        
                else
                    require 'tpl/start.tpl';
            }
            
            elseif ($pageid == 'create')
                $manager->createSQLForm();
            
            elseif ($pageid == 'erase')
            {
                $manager->eraseSQLForm($_GET['row']);
            }
            
            elseif ($pageid == 'service')
            {
                $_SESSION['focus'] = $pageid;
                require 'tpl/service.tpl';
            }
            
            elseif ($pageid == 'maketicket')
            {
                require ('tpl/maketicket.tpl');
            }
            
            else
            require 'tpl/start.tpl';
        }
        else
            require 'tpl/start.tpl';
	}
}

class SQLmanager
{
	//does fuck all
    //oh wait I fixed it. This initializes the database. hella important.
	function initDB()
	{
        //add error handling here... :/
		$con = mysql_connect("localhost", "root", "");
        mysql_select_db("ticketer", $con);
        mysql_query( "SET NAMES utf8");
        mysql_query( "SET CHARACTER SET utf8");
        return $con;
	}

	//Evaluates the inputed string against the inputed table, returns 1 if a match is found
    //note changes in session array
	function checkname($who, $tablename)
	{
		$temp = 0;
		$con = $this->initDB();
		
		$sql = "SELECT * FROM $tablename WHERE username = $who";
		
		if ($temp = mysql_query($sql, $con))
		{
			if ($value = mysql_fetch_array($temp, MYSQL_BOTH))
			{
				$_SESSION['user'] = $value['Name'];
				return 1;
			}
			else
			return 0;
		}
		else
		return 0;
	}

    //Makes a html table out of a SQL table
    function makeHtmlTable($tablename)
    {
        $con = $this->initDB();
        $sql = "SELECT * FROM $tablename";
        $handler = mysql_query($sql, $con);
        
        echo '<div id="companytable">';
        echo '<table><tr><td id="emptytable"></td>';
        while ($filed = mysql_fetch_field($handler))
        {
            echo '<td id="listtable" style="font-weight: bold">' . $filed->name . '</td>';
        }
        echo '</tr>';
        while ($row = mysql_fetch_assoc($handler))
        {
            echo '<tr><td id="emptytable">';
            echo '<a style="text-decoration: none" href="index.php?pageid=erase&row='.$row['id'].'"><span id="ecks">X</span></a> </td>';
                foreach($row as $col=>$val)
                {
                    echo '<td id="listtable">'.$val.'</td>';
                }
            echo '</tr>';
        }
        echo '</table>';
        require 'tpl/buttons.tpl';
        echo '</div>';
    }
    
    //makes html forms with ids from database table field names
    function makeHtmlForm($tablename)
    {
        $con = $this->initDB();
        $sql = "SELECT * FROM $tablename";
        $handler = mysql_query($sql, $con);
        
        echo '<div id="companytable">';
        echo '<form method="post" action="index.php?pageid=create">';
        while ($field = mysql_fetch_field($handler))
            {
                if ($field->name == 'id')
                    echo '<br>';
                else
                {
                    echo $field->name.'<br>';
                    echo '<input type="text" size="30" name="'.$field->name.'"><br>';
                }
            }
        //this inline html is shit ugly, is there a better way to do this?
        echo '<br><input id="sendbutt" type="submit" value="Skapa"><br><br>';
        echo '</form><form method="post" action="index.php?pageid='.$tablename.'"><input id="sendbutt" type="submit" value="Tillbaks"></form><br></div>';
        
    }
    
    //Writes a SQL table with POST values
    function createSQLForm()
    {
        $table = $_SESSION["focus"];
        $columns = NULL;
        $values = NULL;
        
        $con = $this->initDB();
        
        //formating here looks retarded, but it has to be that way.
        foreach ($_POST as $col=>$val)
        {
            $columns .= ", ".$col;
            $values .= ", '".$val."'";
        }
            //Mash the final part of the strings together
            $columns = "id".$columns;
            $values = "NULL".$values;
            
            //Create an epic query
            $sql = "INSERT INTO $table ($columns) VALUES ($values)";
            if ($query = mysql_query($sql, $con))
                $_SESSION['msg'] = "Table created!";
            else
                $_SESSION['msg'] = mysql_error();
        
        //move along    
        header('Location: index.php?pageid='.$_SESSION['focus']);
    }
    
    //erase the row of the current table with suplied id
    function eraseSQLForm($row)
    {
        $con = $this->initDB();
        $table = $_SESSION["focus"];
        $sql = "DELETE FROM $table WHERE id = $row";
        
        if (mysql_query($sql, $con))
            $_SESSION['msg'] = "Table erased";
        else
            $_SESSION['msg'] = mysql_error();
        
        header('Location: index.php?pageid='.$_SESSION['focus']);
    }
}
?>
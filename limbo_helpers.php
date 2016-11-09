<?php
# Helpers.php 
# Authors: Kai Wong, Wendy Ni, Jae Kyoung Lee (LJ)
# Date: 11/02/2016

$debug = true;

# Shows the records in presidents
function show_records($dbc) {
		# Connect to MySQL server and the database
		require( 'includes/connect_limbo_db.php' ) ;

		# Create a query to get the number, first name, and last name sorted by number in descending order
		$query = 'SELECT number, fname, lname FROM presidents ORDER BY number DESC' ;

		# Execute the query
		$results = mysqli_query( $dbc , $query ) ;

		# Show results
		if( $results )
		{
		  # But...wait until we know the query succeeded before
		  # starting the table.
		  echo '<H1>Dead Presidents</H1>' ;
		  echo '<TABLE border=1 style = "font-family:courier;">';
		  echo '<TR>';
		  echo '<TH>Number</TH>';
		  echo '<TH>First Name</TH>';
		  echo '<TH>Last Name</TH>';
		  echo '</TR>';

		  # For each row result, generate a table row
		  while ( $row = mysqli_fetch_array( $results , MYSQLI_ASSOC ) )
		  {
			echo '<TR>' ;
			echo '<TD>' . $row['number'] . '</TD>' ;
			echo '<TD>' . $row['fname'] . '</TD>' ;
			echo '<TD>' . $row['lname'] . '</TD>' ;
			echo '</TR>' ;
		  }

		  # End the table
		  echo '</TABLE>';

		  # Free up the results in memory
		  mysqli_free_result( $results ) ;
		}
		else
		{
		  # If we get here, something has gone wrong
		  echo '<p>' . mysqli_error( $dbc ) . '</p>'  ;
		}

		# Close the connection
		mysqli_close( $dbc ) ;
}

function show_link_records($dbc) {
		# Connect to MySQL server and the database
		require( 'includes/connect_db.php' ) ;

		# Create a query to get the id and last name sorted by id in ascending order
		$query = 'SELECT id, lname FROM presidents ORDER BY id' ;

		# Execute the query
		$results = mysqli_query( $dbc , $query ) ;

		# Show results
		if( $results )
		{
		  # But...wait until we know the query succeeded before
		  # starting the table.
		  echo '<H1>Dead Presidents</H1>' ;
		  echo '<TABLE border=1 style = "font-family:courier;">';
		  echo '<TR>';
		  echo '<TH>ID</TH>';
		  echo '<TH>Last Name</TH>';
		  echo '</TR>';

		  # For each row result, generate a table row
		  while ( $row = mysqli_fetch_array( $results , MYSQLI_ASSOC ) )
		  {
			//Creates an anchor link to display more information about the president
			$alink = '<a href = linkypresidents.php?id=' . $row['id'] . '>' . $row['id'] . '</a>';
			echo '<TR>' ;
			echo '<TD align = right>' . $alink . '</TD>';
			echo '<TD>' . $row['lname'] . '</TD>' ;
			echo '</TR>' ;
		  }

		  # End the table
		  echo '</TABLE>';

		  # Free up the results in memory
		  mysqli_free_result( $results ) ;
		}
		else
		{
		  # If we get here, something has gone wrong
		  echo '<p>' . mysqli_error( $dbc ) . '</p>'  ;
		}

		# Close the connection
		mysqli_close( $dbc ) ;
}

function show_record($dbc, $id) {
		# Connect to MySQL server and the database
		require( 'includes/connect_db.php' ) ;

		# Create a query to get the number, first name, and last name sorted by number in descending order
		$query = 'SELECT number, lname, fname FROM presidents WHERE id = ' . $id;

		# Execute the query
		$results = mysqli_query( $dbc , $query ) ;

		# Show results
		if( $results )
		{
		  # But...wait until we know the query succeeded before
		  # starting the table.
		  echo '<H1>Dead Presidents</H1>' ;
		  echo '<TABLE border=1 style = "font-family:courier;">';
		  echo '<TR>';
		  echo '<TH>Number</TH>';
		  echo '<TH>Last Name</TH>';
		  echo '<TH>First Name</TH>';
		  echo '</TR>';

		  # For each row result, generate a table row
		  while ( $row = mysqli_fetch_array( $results , MYSQLI_ASSOC ) )
		  {
			echo '<TR>' ;
			echo '<TD>' . $row['number'] . '</TD>' ;
			echo '<TD>' . $row['lname'] . '</TD>' ;
			echo '<TD>' . $row['fname'] . '</TD>' ;
			echo '</TR>' ;
		  }

		  # End the table
		  echo '</TABLE>';

		  # Free up the results in memory
		  mysqli_free_result( $results ) ;
		}
		else
		{
		  # If we get here, something has gone wrong
		  echo '<p>' . mysqli_error( $dbc ) . '</p>'  ;
		}

		# Close the connection
		mysqli_close( $dbc ) ;
}

# Inserts a record into the presidents table with number, first name, and last name
function insert_record($dbc, $number, $fname, $lname) {
  $query = 'INSERT INTO presidents(number, fname, lname) VALUES (' . $number . ' , "' . $fname . '", "' . $lname . '" )' ;
  show_query($query);

  $results = mysqli_query($dbc,$query) ;
  check_results($results) ;

  return $results ;
}

# Shows the query as a debugging aid
function show_query($query) {
  global $debug;

  if($debug)
    echo "<p>Query = $query</p>" ;
}

# Checks the query results as a debugging aid
function check_results($results) {
  global $dbc;

  if($results != true)
    echo '<p>SQL ERROR = ' . mysqli_error( $dbc ) . '</p>'  ;
}

#Created function that validates a number
function valid_number($num) {
	if (empty($num) || !is_numeric($num))
			return false;
	else {
		$num = intval($num);
		if($num <= 0)
			return false;
	}
	return true;
}

#Created function that validates name input
function valid_name($name) {
	if (empty($name))
		return false;
	else 
		return true;
}


?>
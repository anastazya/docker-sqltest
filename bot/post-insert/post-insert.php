<?php
/*
 Plugin Name: POST INSERT
 Plugin URI: https://domain.com
 Description: Allows you to insert posts by calling http://domain.com/wp-admin/admin-ajax.php?action=insert_post
 Author: Zauan
 Version: 1.0
 Author URI: https://hogash.com/
 */

add_action( 'wp_ajax_insert_post', 'my_insert_post_function' );
add_action( 'wp_ajax_nopriv_insert_post', 'my_insert_post_function' );

function my_insert_post_function(){
	$my_post = array(
		'post_title'    => 'My post, happy posting '. rand(),
		'post_content'  => 'This is my post content '. rand(),
		'post_status'   => 'publish',
		'post_author'   => 1
	);

	// Insert the post into the database.
	var_dump(wp_insert_post( $my_post ));
	die();

}
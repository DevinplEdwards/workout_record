$(document).ready(function() {
    // Close the alert when the close button is clicked
    $('.close').on('click', function() {
      $(this).parent('.alert').fadeOut();
    });
  });
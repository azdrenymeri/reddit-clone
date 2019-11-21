
$(document).ready(function(){    
  // signup code for showing the uploaded profile picture name
  const fileInput = document.querySelector('#user_picture');
  if (fileInput) {
    fileInput.onchange = () => {
  
      if (fileInput.files.length > 0) {
        const fileName = document.querySelector('.file-name');
        fileName.textContent = fileInput.files[0].name;
      }
    }
    
  }
})

  
const sgMail = require('@sendgrid/mail');
sgMail.setApiKey(process.env.SENDGRID_API_KEY);

const fs = require("fs");


listOfPaths = ['E:\Codes\VS\testfiles\test.json'];

function transformToAttachment() {

    arrayOfAttachments = [];

    for (path of listOfPaths) {
        var split = path.split('/');

        var fileName = split[split.length-1];
        var extention = fileName.substring(fileName.indexOf('.') + 1, fileName.length);

        arrayOfAttachments.push({
            content: listOfPaths,
            fileName: fileName,
            extention: extention,
            disposition: "attachment"
        });
    }

    return arrayOfAttachments;
}


const msg = {
  to: [ 'buzatu.radu@gmail.com' ] ,
  from: 'radu@sjultra.com', 
  subject: 'Mars reports',
  text: 'Reports in attachment',
  html: '<strong>Reports in attachment</strong>',
  attachments: transformToAttachment,
};

sgMail
  .send(msg)
  .then(() => {}, error => {
    console.error(error);
 
    if (error.response) {
      console.error(error.response.body)
    }
  });
//ES8
(async () => {
  try {
    await sgMail.send(msg);
  } catch (error) {
    console.error(error);
 
    if (error.response) {
      console.error(error.response.body)
    }
  }
})();

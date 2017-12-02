// require ASCIIMathTeXKaTeX-2016-06-17.min
// require katex.min
// require autosize.min
// require cloudinary-widget

//
// if (typeof(katex) != "undefined") AMfunc(true);
//
//
// $('document').ready(function () {
//     $("[data-upload]").each(function (index, element) {
//         $(element).cloudinary_upload_widget(
//             {
//                 cloud_name: 'wiresandbytes', upload_preset: 'rails_admin_images',
//                 cropping: 'server', folder: 'question_images',
//                 multiple: false
//             },
//             function (error, result) {
//                 if (error) {
//                     console.error('Error', error)
//                 } else if (result) {
//                     console.log('Result', result[0].secure_url)
//
//                     var image_tag = '<img style="width:100%" src="' + result[0].secure_url + '">'
//                     var uploadTargetId = $(element).data("upload");
//                     var uploadTarget = $(uploadTargetId);
//                     uploadTarget
//                         .focus()
//                         .val(uploadTarget.val() + '\n<br>\n' + image_tag + '\n<br>\n')
//                         .trigger('keyup');
//                     autosize.update(uploadTarget);
//                 }
//             });
//     });
// });
//
//
// function putChoicesInRenderTarget(renderTargetId, choices) {
//     // Clear options
//     $(renderTargetId).html("");
//
//     // Recreate options
//     choices.forEach(function (choice, index) {
//         var choiceElement = '<li>\n' +
//             '  <span class="choice">' + String.fromCharCode(97 + index) + '</span>\n' +
//             '  <input type="radio" name="choices" value="a" id="a">\n' +
//             '  <label for="a">\n' +
//             '    <span class="check">\n' +
//             '      <span class="inside">\n' +
//             '      </span>\n' +
//             '    </span>\n' +
//             '    <span class="choice-span">' + choice + '</span>\n' +
//             '  </label>';
//
//         if (choices.length - 1 !== index) {
//             choiceElement += '<hr>';
//         }
//
//         choiceElement += '</li>';
//
//         $(renderTargetId).append(choiceElement);
//     });
// }
//
// // Code for rendering inputs
// $('document').ready(function () {
//     $("[data-render-in]")
//         .keyup(function () {
//             var renderTargetId = $(this).data("render-in");
//
//             var renderType = $(this).data("render-type");
//             if (renderType === 'array') {
//                 var choices = JSON.parse($(this).val());
//                 putChoicesInRenderTarget(renderTargetId, choices);
//             } else {
//                 // Replace .html() with .text() If you want html code to be escaped
//                 $(renderTargetId).html($(this).val());
//             }
//
//             // Render all the asciimath and latex on the page
//             if (typeof(katex) != "undefined") AMfunc(true);
//         })
//         .trigger('keyup');
// });
//
//
// $('document').ready(function () {
//     /* Hide certain inputs when the question_type is changed*/
//     var questionTypeField = $('#question_question_type');
//
//     var headerRelatedFields = $('#question_title_field, #question_content_field');
//     var mcqRelatedFields = $('#question_number_field, #question_question_field, ' +
//         '#question_choices_field, #question_answer_field, #question_explanation_field');
//     var fillInRelatedFields = $('#question_number_field, #question_question_field, ' +
//         '#question_answer_field, #question_explanation_field');
//     var essayRelatedFields = $('#question_number_field, #question_question_field, ' +
//         '#question_answer_field, #question_explanation_field');
//
//
//     function displayHeader() {
//         mcqRelatedFields.hide();
//         fillInRelatedFields.hide();
//         essayRelatedFields.hide();
//         headerRelatedFields.show();
//     }
//
//     function displayMCQ() {
//         headerRelatedFields.hide();
//         fillInRelatedFields.hide();
//         essayRelatedFields.hide();
//         mcqRelatedFields.show();
//     }
//
//     function displayFillIn() {
//         headerRelatedFields.hide();
//         mcqRelatedFields.hide();
//         essayRelatedFields.hide();
//         fillInRelatedFields.show();
//     }
//
//     function displayEssay() {
//         headerRelatedFields.hide();
//         mcqRelatedFields.hide();
//         fillInRelatedFields.hide();
//         essayRelatedFields.show();
//     }
//
//     function hideAllFields() {
//         headerRelatedFields.hide();
//         mcqRelatedFields.hide();
//         fillInRelatedFields.hide();
//         essayRelatedFields.hide();
//     }
//
//     function displayCorrectFields() {
//         if (questionTypeField.val() === '0') {
//             displayHeader();
//         } else if (questionTypeField.val() === '1') {
//             displayMCQ();
//         } else if (questionTypeField.val() === '2') {
//             displayFillIn();
//         } else if (questionTypeField.val() === '3') {
//             displayEssay();
//         } else {
//             hideAllFields();
//         }
//     }
//
//
//     questionTypeField.change(function () {
//         displayCorrectFields();
//     });
//
//     displayCorrectFields();
// });
//
//
// $('document').ready(function () {
//     // Expand textareas to fill content
//     autosize($('textarea'));
// });

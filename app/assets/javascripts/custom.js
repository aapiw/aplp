// $(function () {
$(document).ready(function() {
  // USERS
  if ($('.datepicker').length || $('.timepicker').length) {
    $('.datepicker').bootstrapMaterialDatePicker({
      format: 'DD MMMM YYYY',
      clearButton: true,
      weekStart: 1,
      time: false,
      lang: 'id'
    });

    $('.timepicker').bootstrapMaterialDatePicker({
      format: 'HH:mm',
      clearButton: true,
      date: false
    });
  }

  $(".js-profession").change(function(event) {
    if ($(this).val() != "pelajar") {
      $(".js-pekerjaan input").attr('disabled', false);
      $(".js-pekerjaan .form-line").addClass("focused");
    } else {
      $(".js-pekerjaan input").attr('disabled', true);
      $(".js-pekerjaan .form-line").removeClass("focused");
    }
  });

  $(".js-to-indonesia").change(function(event) {
    if ($(this).val() == "pernah") {
      $(".js-to-indonesia-details input, .js-to-indonesia-details select, .js-to-indonesia-details button, .js-to-indonesia-details a").attr('disabled', false);
      $(".js-to-indonesia-details button").removeClass('disabled');

      $(".js-to-indonesia-details .form-line").addClass("focused");
    } else {
      $(".js-to-indonesia-details input, .js-to-indonesia-details select, .js-to-indonesia-details button, .js-to-indonesia-details a").attr('disabled', true);
      $(".js-to-indonesia-details .form-line").removeClass("focused");

      $(".js-to-indonesia-details button").addClass('disabled');
    }
  });
  $(".js-add-dest").click(function(event) {
    if ($(this).attr('disabled') == "disabled") {
      return false
    } else {

      var template = '<div class="col-xs-12">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="text" class="form-control" placeholder="Tujuan" name="profession" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="number" class="form-control" placeholder="Berapa kali" name="long" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-line">' +
        '<select class="form-control show-tick" name="unit" required>' +
        '<option value="">-- Pilih Satuan --</option>' +
        '<option value="day">Hari</option>' +
        '<option value="month">Bulan</option>' +
        '<option value="year">Tahun</option>' +
        '</select>' +
        '</div>' +
        '</div>';
      valid = true;
      $("#space-dest input, #space-dest select").each(function(index, el) {
        if ($(el).val() == "") {
          valid = false;
        }
      });

      if (valid) {
        $("#space-dest").append(template);
        $.AdminBSB.select.activate();
      } else {
        alert("Mohon isi dulu tujuan sebelumnya");
      }
      return false
    }
  });

  $(".js-course-bipa").change(function(event) {
    if ($(this).val() == "pernah") {
      $(".js-course-details input, .js-course-details select, .js-course-details button, .js-course-details a").attr('disabled', false);
      $(".js-course-details button").removeClass('disabled');

      $(".js-course-details .form-line").addClass("focused");
    } else {
      $(".js-course-details input, .js-course-details select, .js-course-details button, .js-course-details a").attr('disabled', true);
      $(".js-course-details .form-line").removeClass("focused");

      $(".js-course-details button").addClass('disabled');
    }
  });

  $(".js-add-course").click(function(event) {
    if ($(this).attr('disabled') == "disabled") {
      return false
    } else {

      var template = '<div class="col-xs-12">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="text" class="form-control" placeholder="Lokasi" name="location" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="number" class="form-control" placeholder="Berapa Lama" name="long" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-line">' +
        '<select class="form-control show-tick" name="unit" required>' +
        '<option value="">-- Pilih Satuan --</option>' +
        '<option value="day">Hari</option>' +
        '<option value="month">Bulan</option>' +
        '<option value="year">Tahun</option>' +
        '</select>' +
        '</div>' +
        '</div>';
      valid = true;
      $("#space-course input, #space-course select").each(function(index, el) {
        if ($(el).val() == "") {
          valid = false;
        }
      });

      if (valid) {
        $("#space-course").append(template);
        $.AdminBSB.select.activate();
      } else {
        alert("Mohon isi dulu kursus sebelumnya");
      }
      return false
    }
  });
  // USER END
  if ($('#userShow').length) {
    // $('#userShow').editableTableWidget();
  }

  // VALIDATE
  $('#sign_in').validate({
    highlight: function(input) {
      console.log(input);
      $(input).parents('.form-line').addClass('error');
    },
    unhighlight: function(input) {
      $(input).parents('.form-line').removeClass('error');
    },
    errorPlacement: function(error, element) {
      $(element).parents('.input-group').append(error);
    }
  });
  // VALIDATE END

  // GLOBAL
  // $('#sign_up').waitMe({
  //    effect : 'facebook'
  //  });

  //SIGNUP
  $("#user_country_id").change(function(event) {

      var id = $(this).val();
      console.log(id);
      if (id != "") {
        $('#sign_up').waitMe({
          effect: 'facebook',
          color: "#2196F3"
        });
        $.ajax({
            url: '/countries/' + id + '/consulate_lists',
            type: 'GET',
            dataType: 'script'
          })
          .done(function() {
            console.log("success");
          })
          .fail(function() {
            console.log("error");
          })
          .always(function() {
            console.log("complete");
          });
      } else {
        $("#user_admin_id")
        .selectpicker('val', 'Pilih KBRI')
        .selectpicker('refresh')
        .prop('disabled', true);
      }
  });
  setTimeout(function() {
    $(".alert").remove();
  }, 5000);

}); //ready
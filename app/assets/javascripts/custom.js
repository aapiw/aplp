function js_remove_wrap(){
  $(".js-remove-wrap").click(function(event) {
    $(this).parents(".wrap").remove();
  });
}

$.action = {};
$.action.tableDataTable = {
  activate: function(){
    $('.js-data-table-export').DataTable({
        dom: 'lBfrtip',
        // lengthMenu: [ 10, 25, 50, 75, 100 ],
        responsive: true,
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    });
    $('.js-editable').editableTableWidget();

    $('.js-data-table').DataTable({
        responsive: true
    });
  }
}
// $(function () {
$(document).ready(function() {

  $.action.tableDataTable.activate();

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
    if ($(this).val() != "Pelajar") {
      $(".js-pekerjaan input").attr('disabled', false);
      $(".js-pekerjaan .form-line").addClass("focused");
    } else {
      $(".js-pekerjaan input").val("");
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
  js_remove_wrap();

  var index = 0;

  $(".js-add-dest").click(function(event) {
    if ($(this).attr('disabled') == "disabled") {
      return false
    } else {
    index = index+1; 

      var template = '<div class="wrap"><div class="col-xs-12">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="text" class="form-control" placeholder="Tujuan" name="user[to_indonesias_attributes]['+index+'][destination]" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="number" class="form-control" placeholder="Berapa kali" name="user[to_indonesias_attributes]['+index+'][long]" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-line">' +
        '<select class="form-control show-tick" name="user[to_indonesias_attributes]['+index+'][unit]" required>' +
        '<option value="">Pilih Satuan</option>' +
        '<option value="hari">Hari</option>' +
        '<option value="bulan">Bulan</option>' +
        '<option value="tahun">Tahun</option>' +
        '</select>' +
        '</div>' +
        '<a class="pull-right m-t-15 btn btn-danger waves-effect js-remove-wrap">Hapus Kunjungan</a>'+
        '</div>'+
        '</div>';
      
      valid = true;
      $(".js-to-indonesia-details input, .js-to-indonesia-details select").each(function(index, el) {
        if ($(el).val() == "") {
          valid = false;
        }
      });

      if (valid) {
        $(".js-to-indonesia-details").append(template);
        js_remove_wrap();
        $.AdminBSB.select.activate();
      } else {
        swal("Perhatian!", "Mohon isi dulu tujuan sebelumnya!", "warning");
        alert("Mohon isi dulu tujuan sebelumnya");
      }
      return false
    }
  });
  
  var index_course = 0;

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
    index_course = index_course+1;

      var template = '<div class="wrap"><div class="col-xs-12">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="text" class="form-control" placeholder="Lokasi" name="user[bipa_courses_attributes]['+index_course+'][location]" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-group form-float">' +
        '<div class="form-line">' +
        '<input type="number" class="form-control" placeholder="Berapa Lama" name="user[bipa_courses_attributes]['+index_course+'][long]" required>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-xs-6">' +
        '<div class="form-line">' +
        '<select class="form-control show-tick" name="user[bipa_courses_attributes]['+index_course+'][unit]" required>' +
        '<option value="">Pilih Satuan</option>' +
        '<option value="hari">Hari</option>' +
        '<option value="bulan">Bulan</option>' +
        '<option value="tahun">Tahun</option>' +
        '</select>' +
        '</div>' +
        '<a class="pull-right m-t-15 btn btn-danger waves-effect js-remove-wrap">Hapus Kursus</a>'+
        '</div>'+
        '</div>';

      valid = true;
      $(".js-course-details input, .js-course-details select").each(function(index, el) {
        if ($(el).val() == "") {
          valid = false;
        }
      });

      if (valid) {
        $(".js-course-details").append(template);
        js_remove_wrap();
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
  // $('#sign_in').validate({
  //   highlight: function(input) {
  //     console.log(input);
  //     $(input).parents('.form-line').addClass('error');
  //   },
  //   unhighlight: function(input) {
  //     $(input).parents('.form-line').removeClass('error');
  //   },
  //   errorPlacement: function(error, element) {
  //     $(element).parents('.input-group').append(error);
  //   }
  // });
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
    $(".flash").hide();
  }, 10000);

  $("#collapseFilter")
  .on('hidden.bs.collapse', function (e) {
    $("[href='#collapseFilter']").text("Tampilkan")
      // console.log(e.currentTarget.id)
  })
  .on('shown.bs.collapse', function (e) {
    $("[href='#collapseFilter']").text("Sembunyikan")
  });


  // $(".filters form").submit(function(event) {
  $(".filters form").change(function(event) {

    // $(this).submit();
    // console.log(event)
    // console.log(event.target)
    // autocomplete="off"
    // console.log( $(event.target).prop('autocomplete') == "off" );
    if ( $(event.target).prop('autocomplete') != "off" ) {
      $(this).find("[type='submit']").click();
      $('#all_users .card').waitMe({
        effect: 'facebook',
        color: "#2196F3"
      });
    }

    
  });

  // $(".img-view").click(function(event) {
  //   /* Act on the event */
  //   $("#fotoModalView .modal-view").html("<img src='"+$(this).prop('src')+"'></img>")
  //   $("#fotoModalView").modal()
    
  // });

}); //ready
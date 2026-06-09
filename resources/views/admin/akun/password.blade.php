<form action="{{ url('admin/akun/update-password') }}" enctype="multipart/form-data" method="post" id="passwordForm">
    {{ csrf_field() }}

    <p class="alert alert-warning">
            Password Baru Minimal 6 karakter, maksimal 32 karakter.
        
    </p>

    <div class="mb-3">
        <label class="form-label">Password Baru</label>
        <div class="input-group">
            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
            <button type="button" class="btn btn-outline-secondary" id="togglePassword">
                <i class="fa-solid fa-eye"></i>
            </button>
        </div>
        
        <div class="mt-1" id="passwordStrength"></div>
    </div>

    <div class="mb-3">
        <label class="form-label">Konfirmasi Password</label>
        <div class="input-group">
            <input type="password" name="konfirmasi_password" id="konfirmasi_password" class="form-control" placeholder="Konfirmasi Password" required>
            <button type="button" class="btn btn-outline-secondary" id="toggleKonfirmasi">
                <i class="fa-solid fa-eye"></i>
            </button>
        </div>
        <div class="mt-1" id="passwordMatch" style="color: red;"></div>
    </div>

    <div class="mb-3">
        <button type="reset" class="btn btn-success">
            <i class="fa-solid fa-recycle"></i> Reset
        </button>

        <button type="submit" class="btn btn-primary">
            <i class="fa-solid fa-save"></i> Simpan
        </button>
    </div>
</form>

<script>
$(document).ready(function(){

    const password = $('#password');
    const konfirmasi = $('#konfirmasi_password');
    const passwordStrength = $('#passwordStrength');
    const passwordMatch = $('#passwordMatch');
    const form = $('#passwordForm');

    // Show / Hide Password
    $('#togglePassword').click(function(){

        let type = password.attr('type') === 'password' ? 'text' : 'password';
        password.attr('type', type);

        $(this).html(
            type === 'password'
            ? '<i class="fa-solid fa-eye"></i>'
            : '<i class="fa-solid fa-eye-slash"></i>'
        );
    });

    $('#toggleKonfirmasi').click(function(){

        let type = konfirmasi.attr('type') === 'password' ? 'text' : 'password';
        konfirmasi.attr('type', type);

        $(this).html(
            type === 'password'
            ? '<i class="fa-solid fa-eye"></i>'
            : '<i class="fa-solid fa-eye-slash"></i>'
        );
    });


    // Password Strength
    password.on('input', function(){

        let val = $(this).val();
        let strength = '';
        let color = 'red';

        if(val.length < 6){
            strength = 'Terlalu pendek';
        }
        else if(val.length <= 8){
            strength = 'Lemah';
        }
        else if(val.length <= 12){
            strength = 'Sedang';
            color = 'orange';
        }
        else if(val.length <= 20){
            strength = 'Kuat';
            color = 'green';
        }
        else{
            strength = 'Sangat kuat';
            color = 'darkgreen';
        }

        passwordStrength
            .text('Kekuatan Password: ' + strength)
            .css('color', color);

        checkPasswordMatch();
    });


    // Cek kesamaan password
    konfirmasi.on('input', function(){
        checkPasswordMatch();
    });


    function checkPasswordMatch(){

        if(konfirmasi.val() === ''){
            passwordMatch.text('');
            return;
        }

        if(password.val() === konfirmasi.val()){
            passwordMatch
                .text('Password sesuai')
                .css('color','green');
        }else{
            passwordMatch
                .text('Password tidak sama')
                .css('color','red');
        }
    }


    // Validasi sebelum submit
    form.submit(function(e){

        let passVal = password.val();
        let konVal = konfirmasi.val();

        if(passVal.length < 6 || passVal.length > 32){
            alert('Password harus antara 6 sampai 32 karakter.');
            e.preventDefault();
            return false;
        }

        if(passVal !== konVal){
            alert('Password dan Konfirmasi Password tidak sama.');
            e.preventDefault();
            return false;
        }

    });

});
</script>
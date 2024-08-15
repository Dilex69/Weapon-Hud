$(function() {
    window.addEventListener('message', function(event) {
        let data = event.data;
         if (data.weapon !== 'Unarmed') {
            $('#weapon-name').text(data.weapon);
            $('#ammo-clip').text(data.ammo);
            $('#ammo-total').text(data.ammoTotal);
            $('#weapon-image').attr('src', `nui://qb-inventory/html/images/${data.weaponHash}.png`);
            $('#gun-hud').show();
            } else {
                $('#gun-hud').hide();
            }
        });
    });
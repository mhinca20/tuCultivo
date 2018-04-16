for entry in "$search_dir"/home/camilo/proyectoIntegrador/lechuga/conPlagas/*
do
    convert "$entry" "$entry" + ".jpg"
done


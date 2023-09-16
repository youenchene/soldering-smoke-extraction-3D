$fn=90;

tolerance=1.02;
diametre=40*tolerance;
largeur=120*tolerance;
epaisseur=3;
hauteur_ventilo=26;
hauteur_charbon=10;
hauteur=hauteur_ventilo*2+epaisseur+hauteur_charbon;
hauteur_prise_tuyau=40;
epaisseur_tuyau=4;
cable=3.8;
emplacement_cable=16;

part=1;
bas=1;
couvercle=1;
tuyere=1;


if (part==0) {
//bottom box
if(bas==1)
    difference() {
    linear_extrude(height =hauteur) difference() { 
        square(largeur+epaisseur*2);
        translate ([epaisseur,epaisseur,0]) square(largeur);
    };
        translate([emplacement_cable,2*epaisseur,0]) rotate([90,0,0]) 
    linear_extrude(height=epaisseur*3) union() {
        square([cable,hauteur_charbon+epaisseur_tuyau/2]);
        translate([cable/2,hauteur_charbon+epaisseur_tuyau/2,0]) circle(cable/2);
    };

    }

//top box
if(couvercle==1)
    translate ([0,0,hauteur]) difference() {
        cube([largeur+epaisseur*2,largeur+epaisseur*2,epaisseur]);
        translate ([largeur/2+epaisseur,largeur/2+epaisseur,-epaisseur/4]) cylinder(epaisseur*2,largeur/2,largeur/2);
    }


if(tuyere==1)
    difference() {
        translate ([largeur/2+epaisseur,largeur/2+epaisseur,epaisseur]) rotate_extrude($fn=200) 
        translate ([-largeur/2-epaisseur,0,0]) polygon( points=[
        [0,hauteur],
        [largeur/2-diametre/2,hauteur+hauteur],
        [largeur/2-diametre/2,hauteur+hauteur+hauteur_prise_tuyau],
        [largeur/2-diametre/2+epaisseur,hauteur+hauteur+hauteur_prise_tuyau],
        [largeur/2-diametre/2+epaisseur,hauteur+hauteur+epaisseur],
        [largeur/2-diametre/2+epaisseur+epaisseur_tuyau,hauteur+hauteur+epaisseur],
        [largeur/2-diametre/2+epaisseur+epaisseur_tuyau,hauteur+hauteur],
        [epaisseur,hauteur]]);
        translate([largeur/2+epaisseur,largeur/2-diametre/2-epaisseur,hauteur*2+hauteur_prise_tuyau+epaisseur*2]) rotate([0,90,0]) cube([hauteur_prise_tuyau*0.8,diametre+epaisseur*4,epaisseur*2]);
    }
    
}

       

if (part==1) {
    largeur=largeur*0.50;
    ratio_h=0.5;
    union(){
        difference () {
            difference() {
                translate ([-largeur/2-epaisseur,0,hauteur]) cube([largeur+epaisseur*2,largeur*0.75,hauteur*0.7]);
                
            color("red") translate ([0,0,hauteur]) rotate_extrude($fn=200) polygon(points=[
                [0,0],
                [0,hauteur*0.7],
                [diametre/2+epaisseur,hauteur*0.7],
                [largeur/2,0]]);
            }
            
            color("purple") translate ([-largeur/2+epaisseur,largeur/2,hauteur+epaisseur*2]) cube([largeur-epaisseur*2,largeur*0.20,hauteur*0.7]);
        
        }
        
        difference() {
        rotate_extrude($fn=200) 
        translate ([-largeur/2-epaisseur,0,0]) polygon(points=[
        [0,hauteur],
        [largeur/2-diametre/2,hauteur+hauteur*ratio_h],
        [largeur/2-diametre/2,hauteur+hauteur*ratio_h+hauteur_prise_tuyau],
        [largeur/2-diametre/2+epaisseur,hauteur+hauteur*ratio_h+hauteur_prise_tuyau],
        [largeur/2-diametre/2+epaisseur,hauteur+hauteur*ratio_h+epaisseur],
        [largeur/2-diametre/2+epaisseur+epaisseur_tuyau,hauteur+hauteur*ratio_h+epaisseur],
        [largeur/2-diametre/2+epaisseur+epaisseur_tuyau,hauteur+hauteur*ratio_h],
        [epaisseur,hauteur]]);
        translate([0,-diametre/2-2*epaisseur,hauteur*(1+ratio_h)+hauteur_prise_tuyau+epaisseur*2]) rotate([0,90,0]) cube([hauteur_prise_tuyau*0.8,diametre+epaisseur*4,epaisseur*2]);
    }
    }
}  
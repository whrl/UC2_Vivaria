//Cube insert: Perpendicular 

/* [Hiden] */
b2 = 33.6; 
p = 30; // prisma
h2 = 4; // ground

//UC2 Cube and Lid 

/* [User Parameters] */
// Which part would you like to print?
part = "first"; // [first:Both - Cube Body AND Lid,second:Cube Body ONLY,third:Lid ONLY]

/* [Hiden] */
$fn=80;
eps=.002;

a=33.8; //Edge length
b=8; //Edge width
c=3.616; //Chamber

e2 = (a+2*b-p)/2+1; // width vertical

crv=2; //Curvature
scoff=4.9; //Screw offset from outside (cube width (49,8)-screw pitch(40))/2
scr_d=2.8; // Screw hole diameter (M3)
scr_l=8; // Screw length (hole length)
scr_hd=5.5; // Screw head diameter (M3)
scr_hl=3.1; // Screw head length (M3)

//Comment or uncomment the following three lines, depending on which part you want to print OR use the Customizer window
//print_part();
//basecube();
//lid();



//Draw a prism based on a 
//right angled triangle
//l - length of prism
//w - width of triangle
//h - height of triangle
module prism(l, w, h) {
       polyhedron(points=[
               [0,0,h],           // 0    front top corner
               [0,0,0],[w,0,0],   // 1, 2 front left & right bottom corners
               [0,l,h],           // 3    back top corner
               [0,l,0],[w,l,0]    // 4, 5 back left & right bottom corners
       ], faces=[ // points for all faces must be ordered clockwise when looking in
               [0,2,1],    // top face
               [3,4,5],    // base face
               [0,1,4,3],  // h face
               [1,2,5,4],  // w face
               [0,3,5,2],  // hypotenuse face
       ]);
}

module ground(){
    // Bodenplatte v02 
    translate([00,0,b]){
    difference(){
cube([2*(a+2*b),a+2*b,h2]);

edge_z2();
        cube([4,4,5+h2]);
        translate([0,a+2*b-4,0])cube([4,4,5+h2]); 
translate([2*a+4*b,0,0])mirror([1,0,0])cube([4,4,5+h2]);
       
translate([2*a+4*b,a+2*b,0])mirror([1,0,0])rotate([0,0,-90])cube([4,4,5+h2]);    

translate([2*a+4*b,0,0])mirror([1,0,0])edge_z2();
translate([0,a+2*b,0])rotate([0,0,-90])edge_z2();
translate([2*a+4*b,a+2*b,0])mirror([1,0,0])rotate([0,0,-90])edge_z2();
    }
}
}

//translate([p,b+(b2-p)/2,b+a]){
//rotate(a=[0,-180,0]){
//prism(p, p, p);
//}}
//ground();
module insert2(){
    difference(){
        union(){
            
//// Bodenplatte v01         
//translate([a-b-crv/2+0,a+b-a/2,b+h2/2]){
//insert();
//}
//
//translate([2*a-b-crv+0.8,a+b-a/2,b+h2/2]){
//insert();
//}
ground();


//translate([2*a-b-crv+0.8,a+b-a/2,b+h2/2]){
//insert();
//}

// Wand Prisma aussen
translate([0,b,b+h2]){
                cube([e2,a,a-h2]);}



                              
                
// Wand lang 1
translate([b,0,b+h2]){
   // rotate(a=[0,0,90]){
                cube([2*a+2*b-2.1,e2,a-h2]);}
                //}


// Wand lang 2
translate([b,a+2*b-e2,b+h2]){
   // rotate(a=[0,0,90]){
                cube([2*a+2*b-2.1,e2,a-h2]);}


}



// Nut oben               
translate([0,b,a+b-2.1]){
    rotate(a=[0,0,0]){
                cube([3*a+b,a,2.1]);}}
p5=a+2*b;
// Nut für Plexiglas innen
translate([p+16,e2-3,b+h2]){

                cube([2.1,p5,2*a]);}
// Loch unten            
translate([p+2,(a+2*b-p)/2+2,0]){
    rotate(a=[0,0,0]){
                cube([2*a+3*b-p-2.1,p-4,4*h2]);}}



// Prisma Nut
translate([0,b+(b2-p)/2,a+b-3.5]){
cube([p, p, p]);
};

// Boden Nut
translate([p,b+(b2-p)/2,b+h2-2.1]){
cube([3*a, p, p]);
};

// Prisma
translate([p,b+(b2-p)/2,b+a-2.8]){
rotate(a=[0,-180,0]){
prism(p, p, p);
}};

p1=16;
// Plexiglas 1
translate([p-3,2.8,b+h2]){
                cube([p1,2.1,2*a]);}                
p1l=10;
// Plexiglas Gang 1
translate([p,0,b+h2]){

                cube([p1l,2*a,2*a]);}
                
                
p2=35;
// Plexiglas 2
translate([2*a-b-2-6,2.8,b+h2]){
                cube([p2,2.1,2*a]);}   
//               
//// Plexiglas 1-2
//translate([p+10,b-0.3,b+h2]){
//                cube([2.1,a+0.6,2*a]);}   
                

                
p3=16;
// Plexiglas 3
translate([p-3,a+2*b-2.1-2.8,b+h2]){
                cube([p3,2.1,2*a]);}            
                
     p4=35;
// Plexiglas 4
translate([2*a-b-2-6,a+b+b-2.1-2.8,b+h2]){
                cube([p4,2.1,2*a]);} 

//// Plexiglas 2-3 
//translate([2*a-b-2-6,e2-2.1,b+h2]){
//                cube([p2,2.1,2*a]);}  
//                
//// Plexiglas 3-4
//translate([2*a-b-2-6,a+b+b-e2,b+h2]){
//                cube([p4,2.1,2*a]);}                 
                
     p2l=29;
// Plexiglas Gang 2
translate([2*a-b-5,0,b+h2]){   
cube([p2l,2*a,2*a]);}    
            }
}
translate([0,0,-b]){
    insert2();}



module print_part() {   //choose part to print cube body/lid/both
	if (part == "first") {
		basecube();
        lid();
	} else if (part == "second") {
		basecube();
	} else if (part == "third") {
		lid();
	} 
    	 else if (part == "fourth") {
		lid2();
            insert2();
	} 
 
}

module basecube() {
    union() {
        tripod();
        translate([2*a+4*b,0,0])rotate([0,0,90])tripod();
     
        //translate([0,b,0])edge_y();
        translate([a,0,0])edge_x2();
        translate([a,a+2*b,0])rotate([90,0,0])edge_x2();
        
        translate([2*a+4*b,a+2*b,0])rotate([0,0,180])tripod();
        translate([0,a+2*b,0])rotate([0,0,270])tripod();
    }
}

module lid() {
    translate([90,0,0]){
        translate([a,0,b])mirror([0,0,1]) {
            union() {
                corner();
                translate([0,b,0])edge_y();
                translate([b,0,0])edge_x();
                translate([3*b+a,0,0])edge_x();
                translate([b+a,0,0])edge_x();
                translate([2*a+4*b,0,0])rotate([0,0,90]) {
                    corner();
                    translate([b,0,0])edge_x();
                }

                translate([2*a+4*b,a+2*b,0])rotate([0,0,180]) {
                    corner();
                    translate([b,0,0])edge_x();
                     translate([3*b,0,0])edge_x();
                }
                translate([a+2*b,a+2*b,0])rotate([0,0,180]) {
                 //   corner();
                    translate([b,0,0])edge_x();
                    
                }
                translate([0,a+2*b,0])rotate([0,0,270])corner();
            }
        }
    }
}

module lid2 () {
    difference(){
    translate([-3*a-3*b+1.6,0,a+b]){
    lid();}
    
p1=16;
// Plexiglas 1
translate([p-3,2.8,b+h2]){
                cube([p1,2.1,2*a]);}  

                
                p2=35;
                
// Plexiglas 2
translate([2*a-b-2-6,2.8,b+h2]){
                cube([p2,2.1,2*a]);}    
p3=16;
// Plexiglas 3
translate([p-3,a+b+b-2.1-2.8,b+h2]){
                cube([p3,2.1,2*a]);}            
                
     p4=35;
// Plexiglas 4
translate([2*a-b-2-6,a+b+b-2.1-2.8,b+h2]){
                cube([p4,2.1,2*a]);} 
                
// Skale markers

p1s=1;
translate([2*a+3*b-10,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
               
                translate([2*a+3*b-20,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
                
                                translate([2*a+3*b-30,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
               
                                translate([2*a+3*b-40,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
               
                                translate([2*a+3*b-50,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
              
                                translate([2*a+3*b-60,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
             
                                translate([2*a+3*b-70,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
               
                                translate([2*a+3*b-80,b-p1s,b+h2]){
                cube([p1s,p1s,2*a]);}  
           
                
translate([2*a+3*b,b-p1s+10,b+h2]){
                cube([p1s,p1s,2*a]);}  
                
                translate([2*a+3*b,b-p1s+20,b+h2]){
                cube([p1s,p1s,2*a]);}  
                             translate([2*a+3*b,b-p1s+30,b+h2]){
                cube([p1s,p1s,2*a]);}  
                
translate([b-p1s+10,b+a,b+h2]){
                cube([p1s,p1s,2*a]);}  
translate([b-p1s,b+a-10,b+h2]){
                cube([p1s,p1s,2*a]);}  
                
                translate([b-p1s+20,b+a,b+h2]){
                cube([p1s,p1s,2*a]);}  
translate([b-p1s,b+a-20,b+h2]){
                cube([p1s,p1s,2*a]);} 
                translate([b-p1s+30,b+a,b+h2]){
                cube([p1s,p1s,2*a]);}  
translate([b-p1s,b+a-30,b+h2]){
                cube([p1s,p1s,2*a]);} 
                translate([b-p1s+40,b+a,b+h2]){
                cube([p1s,p1s,2*a]);}  

              
                
}
}

translate([0,2*a,-a-b]){
lid2();
}
//translate([0,0,0]){
//lid2();
//}

module tripod() {
    union() {
        corner();
        translate([0,0,b])edge_z();
        translate([0,b,0])edge_y();
        translate([b,0,0])edge_x();
    }
}

//Edge
module edge_z() {
    difference() {
        union() {
            translate([crv,crv,0])cylinder(r=crv,h=a);
            translate([crv,0,0])cube([b-crv,b,a]);
            translate([0,crv,0])cube([b,b-crv,a]);
        }
        //Inner chamfer
        translate([b,c,-eps])rotate([0,0,45])cube([1.5*b,1.5*b,a+2*eps]);
        //Holes for screws
        translate([scoff,scoff,-eps])cylinder(d=scr_d,h=scr_l); //bottom
        translate([scoff,scoff,a-scr_l+eps])cylinder(d=scr_d,h=scr_l); //top
    }
}

module edge_x() {
    rotate([0,0,90])rotate([90,0,0])edge_z();
}

module edge_y() {
    translate([0,a,0])rotate([90,0,0])edge_z();
}
//Edge now screw
module edge_z2() {
    difference() {
        union() {
            translate([crv,crv,0])cylinder(r=crv,h=a);
            translate([crv,0,0])cube([b-crv,b,a]);
            translate([0,crv,0])cube([b,b-crv,a]);
        }
        //Inner chamfer
        translate([b,c,-eps])rotate([0,0,45])cube([1.5*b,1.5*b,a+2*eps]);
        //Holes for screws
       // translate([scoff,scoff,-eps])cylinder(d=scr_d,h=scr_l); //bottom
       // translate([scoff,scoff,a-scr_l+eps])cylinder(d=scr_d,h=scr_l); //top
    }
}

module edge_x2() {
    rotate([0,0,90])rotate([90,0,0])edge_z2();
}

module edge_y2() {
    translate([0,a,0])rotate([90,0,0])edge_z2();
}

//Corner
module corner() {
    difference() {
        union() {
            translate([crv,crv,crv])sphere(r=crv);
            translate([crv,crv,crv])cylinder(r=crv,h=b-crv);
            translate([crv,0,crv])cube([b-crv,b,b-crv]);
            translate([0,crv,crv])cube([b,b-crv,b-crv]);
            translate([crv,crv,crv])rotate([0,90,0])cylinder(r=crv,h=b-crv);
            translate([crv,crv,crv])rotate([-90,0,0])cylinder(r=crv,h=b-crv);
            translate([crv,crv,0])cube([b-crv,b-crv,b]);
        } 
        //Holes for Screws
        translate([scoff,scoff,-eps])cylinder(d=scr_d,h=b+2*eps); //z direction
        rotate([90,0,0])translate([scoff,scoff,-b-eps])cylinder(d=scr_d,h=b+2*eps); //y direction
        rotate([0,90,0])translate([-scoff,scoff,-eps])cylinder(d=scr_d,h=b+2*eps); //x direction
        
        //Screw heads
        translate([scoff,scoff,-eps])cylinder(d=scr_hd,h=scr_hl);
    }
}

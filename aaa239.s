.data

; VARIABLES DE ENTRADA: NO MODIFICAR ORDEN (Se pueden modificar los valores)
		a1: .float 1.1
		a2: .float 2.2
		a3: .float 3.3
		a4: .float 4.4

;;;;; VARIABLES DE SALIDA: NO MODIFICAR ORDEN
		; m11, m12, m13, m14
		; m21, m22, m23, m24
		; m31, m32, m33, m34
		; m41, m42, m43, m44
		
	M:  .float 0.0, 0.0, 0.0, 0.0
		.float 0.0, 0.0, 0.0, 0.0
		.float 0.0, 0.0, 0.0, 0.0
		.float 0.0, 0.0, 0.0, 0.0

; hm1, hm2, hm3, hm4
	HM: .float 0.0, 0.0, 0.0, 0.0

; vm1, vm2, vm3, vm4

	VM: 	.float 0.0, 0.0, 0.0, 0.0
	check:  .float 0.0

;;;;; FIN NO MODIFICAR ORDEN

.text

main:
										;CARGO VALORES DE MATRICES (DIVISIONES Y MULTIPLICACIONES)


	;CARGO a3 y a2
	lf f3, a3
	lf f2, a2
	

	nef f3,f0					;IF f3==0
 	bfpf fin					;SALTA A FIN 
	divf f30, f2, f3
	
	multf f6, f2, f3
	lf f4, a4
	

	
	lf f1, a1
	nef f2,f0					;IF f2==0
 						;SALTA A FIN 
	
	bfpf fin
	multf f27, f2, f6 ;primera diagonal determinante
	addf f28, f1, f4	;HAGO SUMA DE A1 + A4
	multf f5, f1, f2
	
	multf f7, f3, f4
	nef f4,f0					;IF f4==0
 	bfpf fin					;SALTA A FIN 
	
	multf f26, f3, f30 ;segunda diagonal determinante
	divf f31, f1, f2
	
	multf f8, f1, f3 ;a11*b11

	
	

	
	
	;PUESTO QUE NO PUEDO SEGUIR CON EL CALCULO IZQUIERDA SIN PERDER CICLOS COMIENZO KRONECKER

	

	multf f12, f1, f4 ;a11*b21
	multf f13, f1, f7 ;a11*b22
	multf f16, f2, f3 ;a21*b11
	
	divf f29, f3, f4
	multf f18, f5, f3 ;a22*b11
	multf f20, f2, f4 ;a21*b21
	multf f21, f2, f7 ;a21*b22
	multf f23, f5, f7 ;a22*b22

	
	
	;AQUI SE ME LIBERA LA LA DIVISION DE LA LINEA 40
	
	
	multf f22, f5, f4 ;a22*b21
	multf f10, f31, f3 ;a12*b11
	subf f25, f27, f26; resultado determinante
	multf f11, f31, f29 ;a12*b12
	nef f25,f0					;IF DETERMINANTE==0
 	bfpf fin					;SALTA A FIN 

	divf f27, f28, f25 ;division suma/determinante

	multf f14, f31, f4 ;a12*b21
	multf f15, f31, f7 ;a12*b22
	multf f19, f5, f29 ;a22*b12
	multf f9, f1, f29  ;a11*b12
	multf f17, f2, f29 ;a21*b12

	;multiplicación por constante
	multf f8, f8, f27
	multf f9, f9, f27
	sf M,f8
	multf f10, f10, f27
	sf M+4,f9
	multf f11, f11, f27
	sf M+8,f10

	multf f12, f12, f27
	sf M+12,f11
	multf f13, f13, f27
	sf M+16,f12
	multf f14, f14, f27
	sf M+20,f13
	multf f15, f15, f27
	sf M+24,f14

	multf f16, f16, f27
	sf M+28,f15
	multf f17, f17, f27
	sf M+32,f16
	multf f18, f18, f27
	sf M+36,f17
	multf f19, f19, f27
	sf M+40,f18

	multf f20, f20, f27
	sf M+44,f19
	multf f21, f21, f27
	sf M+48,f20
	multf f22, f22, f27
	sf M+52,f21
	multf f23, f23, f27
	sf M+56,f22	

	multf f8, f8, f12; ;hm1
	sf M+60, f23;
	multf f9, f9, f13 ;hm2
	sf HM, f8

	multf f16, f16, f20 ;vm1
	addf f1, f8, f9
	sf HM+4, f9
	multf f17, f17, f21 ;vm2
	addf f1, f1, f16
	sf VM, f16

	multf f10, f10, f14 ;hm3
	addf f1, f1, f17
	sf VM+4, f17
	multf f18, f18, f22 ;vm3
	sf HM+8, f10
	
	
	multf f11, f11, f15 ;hm4
	
	sf VM+8, f18
	addf f1, f1, f10
	multf f19, f19, f23 ;vm4
	
	addf f1, f1, f18
	sf HM+12, f11
	addf f1, f1, f11
	sf VM+12, f19
	addf f1, f1, f19
		
	sf check, f1
	
	
	
	
	
 	trap 0

 	fin:
	
 	
	trap 0

	


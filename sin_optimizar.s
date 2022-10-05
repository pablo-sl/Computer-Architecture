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
										;CARGO VALORES DE a

	lf f1, a1
	lf f2, a2
	lf f3, a3
	lf f4, a4

										;CARGAMOS MATRIZ MF(A2,A3)
	lf f5, a2
	divf f6, f2, f3
	lf f7, a3
	multf f8, f2, f3



										;HACEMOS EL DETERMINANTE Y SUMA A1 A4
	multf f9, f5, f8
	multf f10, f6, f7
	subf f5, f9, f10
	addf f6, f1, f4
										;COMPROBAMOS SI F5 ES 0 Y DIVIDIMOS
	nef f5,f0							
 	bfpf fin

	divf f7, f6, f5


										;CARGAMOS MATRIZ MF A1 A2
	lf f5, a1
	divf f6, f1, f2
	lf f8, a2
	multf f9, f1, f2
										;CARGAMOS MATRIZ MF A3 A4

	lf f10, a3
	divf f11, f3, f4
	lf f12, a4
	multf f13, f3, f4

										
										;REALIZAMOS PRODUCTO KRONECKER

	multf f14, f5, f10
	multf f15, f5, f11
	multf f16, f6, f10
	multf f17, f6, f11

	multf f18, f5, f12
	multf f19, f5, f13
	multf f20, f6, f12
	multf f21, f6, f13

	multf f22, f8, f10
	multf f23, f8, f11
	multf f24, f9, f10
	multf f25, f9, f11

	multf f26, f8, f12
	multf f27, f8, f13
	multf f28, f9, f12
	multf f29, f9, f13

										;MULTIPLICAMOS POR F7
	multf f14, f14, f7
	multf f15, f15, f7
	multf f16, f16, f7
	multf f17, f17, f7

	multf f18, f18, f7
	multf f19, f19, f7
	multf f20, f20, f7
	multf f21, f21, f7

	multf f22, f22, f7
	multf f23, f23, f7
	multf f24, f24, f7
	multf f25, f25, f7

	multf f26, f26, f7
	multf f27, f27, f7
	multf f28, f28, f7
	multf f29, f29, f7

										;CALCULAMOS VM
	
	multf f5, f14, f18
	multf f6, f15, f19
	multf f7, f16, f20
	multf f8, f17, f21

	sf VM,f5
	sf VM+4, f6
	sf VM+8, f7
	sf VM+12, f8

										;CALCULAMOS HM

	multf f9, f22, f26
	multf f10, f23, f27
	multf f11, f24, f28
	multf f12, f25, f29

	sf HM,f9
	sf HM+4, f10
	sf HM+8, f11
	sf HM+12, f12

										;CALCULAMOS CHECK
	addf f5, f6, f5
	addf f5, f7, f5
	addf f5, f8, f5
	addf f5, f9, f5

	addf f5, f10, f5
	addf f5, f11, f5
	addf f5, f12, f5

	sf M,f14							;GUARDAMOS MATRIZ M
 	sf M+4,f15
 	sf M+8,f16
 	sf M+12,f17

 	sf M+16,f18
 	sf M+20,f19
 	sf M+24,f20
 	sf M+28,f21

 	sf M+32,f22
	sf M+36,f23
 	sf M+40,f24
 	sf M+44,f25

 	sf M+48,f26
 	sf M+52,f27
 	sf M+56,f28
 	sf M+60,f29

	
	

	

	sf CHECK, f5

 	trap 0

 	fin:
	
 	
	trap 0

	


c:C_VWN5RPAsubrstart

c    Generated: Tue Mar  9 16:27:09 GMT 2004

      subroutine uks_c_vwn5rpa
     & (ideriv,npt,rhoa1,rhob1,sigmaaa1,sigmabb1,sigmaab1,
     &  zk,vrhoa,vrhob,vsigmaaa,vsigmabb,vsigmaab,
     &  v2rhoa2,v2rhob2,v2rhoab,
     &  v2rhoasigmaaa,v2rhoasigmaab,v2rhoasigmabb,
     &  v2rhobsigmabb,v2rhobsigmaab,v2rhobsigmaaa,
     &  v2sigmaaa2,v2sigmaaaab,v2sigmaaabb,
     &  v2sigmaab2,v2sigmaabbb,v2sigmabb2)
c
c     S.H. Vosko, L. Wilk, and M. Nusair
c     Accurate spin-dependent electron liquid correlation energies for
c     local spin density calculations: a critical analysis
c     Can. J. Phys. 58 (1980) 1200-1211
c
c
c     CITATION:
c
c     Functionals were obtained from the Density Functional Repository 
c     as developed and distributed by the Quantum Chemistry Group, 
c     CCLRC Daresbury Laboratory, Daresbury, Cheshire, WA4 4AD 
c     United Kingdom. Contact Huub van Dam (h.j.j.vandam@dl.ac.uk) or 
c     Paul Sherwood for further information.
c
c     COPYRIGHT:
c
c     Users may incorporate the source code into software packages and
c     redistribute the source code provided the source code is not
c     changed in anyway and is properly cited in any documentation or
c     publication related to its use.
c
c     ACKNOWLEDGEMENT:
c
c     The source code was generated using Maple 8 through a modified
c     version of the dfauto script published in:
c
c        R. Strange, F.R. Manby, P.J. Knowles
c        Automatic code generation in density functional theory
c        Comp. Phys. Comm. 136 (2001) 310-318.
c
      implicit real*8 (a-h,o-z)
      integer ideriv,npt
      real*8 rhoa1(npt),rhob1(npt)
      real*8 sigmaaa1(npt),sigmabb1(npt),sigmaab1(npt)
      real*8 zk(npt),vrhoa(npt),vrhob(npt)
      real*8 vsigmaaa(npt),vsigmabb(npt),vsigmaab(npt)
      real*8 v2rhoa2(npt),v2rhob2(npt),v2rhoab(npt)
      real*8 v2rhoasigmaaa(npt),v2rhoasigmaab(npt)
      real*8 v2rhoasigmabb(npt),v2rhobsigmabb(npt)
      real*8 v2rhobsigmaab(npt),v2rhobsigmaaa(npt)
      real*8 v2sigmaaa2(npt),v2sigmaaaab(npt),v2sigmaaabb(npt)
      real*8 v2sigmaab2(npt),v2sigmaabbb(npt),v2sigmabb2(npt)
      parameter(tol=1.0d-20)
      
      if (ideriv.eq.0) then
      
      do i=1,npt
      rhoa = dmax1(0.D0,rhoa1(i))
      rhob = dmax1(0.D0,rhob1(i))
      rho = rhoa+rhob
      if(rho.gt.tol) then
      if(rhoa.lt.tol) then
      rho = rhob
      t1 = 1/rhob
      t2 = t1**(1.D0/3.D0)
      t4 = t1**(1.D0/6.D0)
      t7 = 1/(0.6203504908994D0*t2+0.1584942278842832D2*t4+0.101578D3)
      t10 = dlog(0.6203504908994D0*t2*t7)
      t16 = datan(0.1171685277708993D1/(0.1575246635799487D1*t4
     #+0.201231D2))
      t20 = (0.7876233178997433D0*t4+0.743294D0)**2
      t22 = dlog(t20*t7)
      zk(i) = rhob*(0.1554535D-1*t10+0.6188180297906063D0*t16
     #+0.2667310007273315D-2*t22)
      elseif(rhob.lt.tol) then
      rho = rhoa
      t1 = 1/rhoa
      t2 = t1**(1.D0/3.D0)
      t4 = t1**(1.D0/6.D0)
      t7 = 1/(0.6203504908994D0*t2+0.1584942278842832D2*t4+0.101578D3)
      t10 = dlog(0.6203504908994D0*t2*t7)
      t16 = datan(0.1171685277708993D1/(0.1575246635799487D1*t4
     #+0.201231D2))
      t20 = (0.7876233178997433D0*t4+0.743294D0)**2
      t22 = dlog(t20*t7)
      zk(i) = rhoa*(0.1554535D-1*t10+0.6188180297906063D0*t16
     #+0.2667310007273315D-2*t22)
      else ! (.not.(rhoa.lt.tol).and..not.(rhob.lt.tol))
      t1 = 1/rho
      t2 = t1**(1.D0/3.D0)
      t3 = 0.6203504908994D0*t2
      t4 = t1**(1.D0/6.D0)
      t7 = 1/(t3+0.1029581201158544D2*t4+0.427198D2)
      t10 = dlog(0.6203504908994D0*t2*t7)
      t12 = 0.1575246635799487D1*t4
      t16 = datan(0.448998886412873D-1/(t12+0.13072D2))
      t18 = 0.7876233178997433D0*t4
      t20 = (t18+0.409286D0)**2
      t22 = dlog(t20*t7)
      t26 = 1/(t3+0.8414573716781907D0*t4+0.114813D2)
      t29 = dlog(0.6203504908994D0*t2*t26)
      t33 = datan(0.6692072046645941D1/(t12+0.106835D1))
      t36 = (t18+0.228344D0)**2
      t38 = dlog(t36*t26)
      t40 = t29+0.3232383690605507D0*t33+0.2160871036089827D-1*t38
      t42 = rhoa-1.D0*rhob
      t43 = t42*t1
      t44 = 1.D0+t43
      t45 = t44**(1.D0/3.D0)
      t48 = 1.D0-1.D0*t43
      t49 = t48**(1.D0/3.D0)
      t55 = 1/(t3+0.1584942278842832D2*t4+0.101578D3)
      t58 = dlog(0.6203504908994D0*t2*t55)
      t63 = datan(0.1171685277708993D1/(t12+0.201231D2))
      t66 = (t18+0.743294D0)**2
      t68 = dlog(t66*t55)
      t78 = t42**2
      t79 = t78**2
      t81 = rho**2
      t82 = t81**2
      zk(i) = rho*(0.310907D-1*t10+0.205219729378375D2*t16
     #+0.4431373767749538D-2*t22-0.1899772193293833D-1*t40*(t45*t44
     #+t49*t48-2.D0)*(1.D0+(-0.101257459063883D3*(0.1554535D-1*t58
     #+0.6188180297906063D0*t63+0.2667310007273315D-2*t68-0.310907D-1
     #*t10-0.205219729378375D2*t16-0.4431373767749538D-2*t22)/t40-1.D0
     #)*t79/t82))
      endif ! rhoa,rhob
      else ! rho
      zk(i) = 0.0d0
      endif ! rho
      enddo
      
      else if(ideriv.eq.1) then
      
      do i=1,npt
      rhoa = dmax1(0.D0,rhoa1(i))
      rhob = dmax1(0.D0,rhob1(i))
      rho = rhoa+rhob
      if(rho.gt.tol) then
      if(rhoa.lt.tol) then
      rho = rhob
      t1 = 1/rhob
      t2 = t1**(1.D0/3.D0)
      t3 = 0.6203504908994D0*t2
      t4 = t1**(1.D0/6.D0)
      t6 = t3+0.1584942278842832D2*t4+0.101578D3
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.1554535D-1*t10
      t13 = 0.1575246635799487D1*t4+0.201231D2
      t16 = datan(0.1171685277708993D1/t13)
      t17 = 0.6188180297906063D0*t16
      t19 = 0.7876233178997433D0*t4+0.743294D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.2667310007273315D-2*t22
      zk(i) = rhob*(t11+t17+t23)
      vrhoa(i) = 0.D0
      t25 = t2**2
      t26 = 1/t25
      t28 = t3+0.1029581201158544D2*t4+0.427198D2
      t31 = rhob**2
      t32 = 1/t31
      t35 = t28**2
      t39 = 0.2067834969664667D0*t26*t32
      t40 = t4**2
      t41 = t40**2
      t43 = 1/t41/t4
      t44 = t43*t32
      t50 = 1/t2
      t57 = t6**2
      t58 = 1/t57
      t61 = -t39-0.2641570464738054D1*t44
      t68 = t13**2
      t69 = 1/t68
      vrhob(i) = t11+t17+t23+rhob*(0.2D-21*(-0.2067834969664667D0*t26
     #/t28*t32-0.6203504908994D0*t2/t35*(-t39-0.1715968668597574D1*t44
     #))*t50*t28+0.2505897912236993D-1*(-0.2067834969664667D0*t26*t7
     #*t32-0.6203504908994D0*t2*t58*t61)*t50*t6+0.1903580477513215D0
     #*t69*t43*t32/(1.D0+0.137284639D1*t69)+0.2667310007273315D-2*(
     #-0.2625411059665811D0*t19*t7*t44-1.D0*t20*t58*t61)/t20*t6)
      elseif(rhob.lt.tol) then
      rho = rhoa
      t1 = 1/rhoa
      t2 = t1**(1.D0/3.D0)
      t3 = 0.6203504908994D0*t2
      t4 = t1**(1.D0/6.D0)
      t6 = t3+0.1584942278842832D2*t4+0.101578D3
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.1554535D-1*t10
      t13 = 0.1575246635799487D1*t4+0.201231D2
      t16 = datan(0.1171685277708993D1/t13)
      t17 = 0.6188180297906063D0*t16
      t19 = 0.7876233178997433D0*t4+0.743294D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.2667310007273315D-2*t22
      zk(i) = rhoa*(t11+t17+t23)
      t25 = t2**2
      t26 = 1/t25
      t28 = t3+0.1029581201158544D2*t4+0.427198D2
      t31 = rhoa**2
      t32 = 1/t31
      t35 = t28**2
      t39 = 0.2067834969664667D0*t26*t32
      t40 = t4**2
      t41 = t40**2
      t43 = 1/t41/t4
      t44 = t43*t32
      t50 = 1/t2
      t57 = t6**2
      t58 = 1/t57
      t61 = -t39-0.2641570464738054D1*t44
      t68 = t13**2
      t69 = 1/t68
      vrhoa(i) = t11+t17+t23+rhoa*(0.2D-21*(-0.2067834969664667D0*t26
     #/t28*t32-0.6203504908994D0*t2/t35*(-t39-0.1715968668597574D1*t44
     #))*t50*t28+0.2505897912236993D-1*(-0.2067834969664667D0*t26*t7
     #*t32-0.6203504908994D0*t2*t58*t61)*t50*t6+0.1903580477513215D0
     #*t69*t43*t32/(1.D0+0.137284639D1*t69)+0.2667310007273315D-2*(
     #-0.2625411059665811D0*t19*t7*t44-1.D0*t20*t58*t61)/t20*t6)
      vrhob(i) = 0.D0
      else ! (.not.(rhoa.lt.tol).and..not.(rhob.lt.tol))
      t1 = 1/rho
      t2 = t1**(1.D0/3.D0)
      t3 = 0.6203504908994D0*t2
      t4 = t1**(1.D0/6.D0)
      t6 = t3+0.1029581201158544D2*t4+0.427198D2
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.310907D-1*t10
      t12 = 0.1575246635799487D1*t4
      t13 = t12+0.13072D2
      t16 = datan(0.448998886412873D-1/t13)
      t17 = 0.205219729378375D2*t16
      t18 = 0.7876233178997433D0*t4
      t19 = t18+0.409286D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.4431373767749538D-2*t22
      t25 = t3+0.8414573716781907D0*t4+0.114813D2
      t26 = 1/t25
      t29 = dlog(0.6203504908994D0*t2*t26)
      t30 = t12+0.106835D1
      t33 = datan(0.6692072046645941D1/t30)
      t35 = t18+0.228344D0
      t36 = t35**2
      t38 = dlog(t36*t26)
      t40 = t29+0.3232383690605507D0*t33+0.2160871036089827D-1*t38
      t42 = rhoa-1.D0*rhob
      t43 = t42*t1
      t44 = 1.D0+t43
      t45 = t44**(1.D0/3.D0)
      t48 = 1.D0-1.D0*t43
      t49 = t48**(1.D0/3.D0)
      t51 = t45*t44+t49*t48-2.D0
      t52 = t40*t51
      t54 = t3+0.1584942278842832D2*t4+0.101578D3
      t55 = 1/t54
      t58 = dlog(0.6203504908994D0*t2*t55)
      t60 = t12+0.201231D2
      t63 = datan(0.1171685277708993D1/t60)
      t65 = t18+0.743294D0
      t66 = t65**2
      t68 = dlog(t66*t55)
      t73 = 0.1554535D-1*t58+0.6188180297906063D0*t63
     #+0.2667310007273315D-2*t68-0.310907D-1*t10-0.205219729378375D2
     #*t16-0.4431373767749538D-2*t22
      t74 = 1/t40
      t77 = -0.101257459063883D3*t73*t74-1.D0
      t78 = t42**2
      t79 = t78**2
      t80 = t77*t79
      t81 = rho**2
      t82 = t81**2
      t83 = 1/t82
      t85 = 1.D0+t80*t83
      t87 = 0.1899772193293833D-1*t52*t85
      zk(i) = rho*(t11+t17+t23-t87)
      t93 = 0.1333333333333333D1*t45*t1-0.1333333333333333D1*t49*t1
      t100 = t52*t77*t78*t42*t83
      t104 = t2**2
      t105 = 1/t104
      t107 = 1/t81
      t110 = t6**2
      t111 = 1/t110
      t114 = 0.2067834969664667D0*t105*t107
      t115 = t4**2
      t116 = t115**2
      t118 = 1/t116/t4
      t119 = t118*t107
      t121 = -t114-0.1715968668597574D1*t119
      t125 = 1/t2
      t127 = (-0.2067834969664667D0*t105*t7*t107-0.6203504908994D0*t2
     #*t111*t121)*t125*t6
      t129 = t13**2
      t130 = 1/t129
      t136 = t130*t118*t107/(1.D0+0.2016D-2*t130)
      t147 = (-0.2625411059665811D0*t19*t7*t119-1.D0*t20*t111*t121)
     #/t20*t6
      t152 = t25**2
      t153 = 1/t152
      t156 = -t114-0.1402428952796985D0*t119
      t163 = t30**2
      t164 = 1/t163
      t183 = 0.161199195401647D1*(-0.2067834969664667D0*t105*t26*t107
     #-0.6203504908994D0*t2*t153*t156)*t125*t25+0.5679117119058793D0
     #*t164*t118*t107/(1.D0+0.447838282775D2*t164)
     #+0.2160871036089827D-1*(-0.2625411059665811D0*t35*t26*t119-1.D0
     #*t36*t153*t156)/t36*t25
      t200 = t54**2
      t201 = 1/t200
      t204 = -t114-0.2641570464738054D1*t119
      t211 = t60**2
      t212 = 1/t211
      t237 = t40**2
      t253 = rho*(0.5011795824473985D-1*t127+0.2419143800947354D0*t136
     #+0.4431373767749538D-2*t147-0.1899772193293833D-1*t183*t51*t85
     #-0.1899772193293833D-1*t40*(-0.1333333333333333D1*t45*t42*t107
     #+0.1333333333333333D1*t49*t42*t107)*t85-0.1899772193293833D-1
     #*t52*((-0.101257459063883D3*(0.2505897912236993D-1*(
     #-0.2067834969664667D0*t105*t55*t107-0.6203504908994D0*t2*t201
     #*t204)*t125*t54+0.1903580477513215D0*t212*t118*t107/(1.D0
     #+0.137284639D1*t212)+0.2667310007273315D-2*(
     #-0.2625411059665811D0*t65*t55*t119-1.D0*t66*t201*t204)/t66*t54
     #-0.5011795824473985D-1*t127-0.2419143800947354D0*t136
     #-0.4431373767749538D-2*t147)*t74+0.101257459063883D3*t73/t237
     #*t183)*t79*t83-4.D0*t80/t82/rho))
      vrhoa(i) = rho*(-0.1899772193293833D-1*t40*t93*t85
     #-0.7599088773175333D-1*t100)+t11+t17+t23-t87+t253
      vrhob(i) = rho*(0.1899772193293833D-1*t40*t93*t85
     #+0.7599088773175333D-1*t100)+t11+t17+t23-t87+t253
      endif ! rhoa,rhob
      else ! rho
      zk(i) = 0.0d0
      vrhoa(i) = 0.0d0
      vrhob(i) = 0.0d0
      endif ! rho
      enddo
      
      else if(ideriv.eq.2) then
      
      do i=1,npt
      rhoa = dmax1(0.D0,rhoa1(i))
      rhob = dmax1(0.D0,rhob1(i))
      rho = rhoa+rhob
      if(rho.gt.tol) then
      if(rhoa.lt.tol) then
      rho = rhob
      t1 = 1/rhob
      t2 = t1**(1.D0/3.D0)
      t3 = 0.6203504908994D0*t2
      t4 = t1**(1.D0/6.D0)
      t6 = t3+0.1584942278842832D2*t4+0.101578D3
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.1554535D-1*t10
      t12 = 0.1575246635799487D1*t4
      t13 = t12+0.201231D2
      t16 = datan(0.1171685277708993D1/t13)
      t17 = 0.6188180297906063D0*t16
      t19 = 0.7876233178997433D0*t4+0.743294D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.2667310007273315D-2*t22
      zk(i) = rhob*(t11+t17+t23)
      vrhoa(i) = 0.D0
      t25 = t2**2
      t26 = 1/t25
      t28 = t3+0.1029581201158544D2*t4+0.427198D2
      t29 = 1/t28
      t30 = t26*t29
      t31 = rhob**2
      t32 = 1/t31
      t35 = t28**2
      t36 = 1/t35
      t37 = t2*t36
      t39 = 0.2067834969664667D0*t26*t32
      t40 = t4**2
      t41 = t40**2
      t42 = t41*t4
      t43 = 1/t42
      t44 = t43*t32
      t46 = -t39-0.1715968668597574D1*t44
      t50 = 1/t2
      t51 = (-0.2067834969664667D0*t30*t32-0.6203504908994D0*t37*t46)
     #*t50
      t54 = t26*t7
      t57 = t6**2
      t58 = 1/t57
      t59 = t2*t58
      t61 = -t39-0.2641570464738054D1*t44
      t64 = -0.2067834969664667D0*t54*t32-0.6203504908994D0*t59*t61
      t65 = t64*t50
      t66 = t65*t6
      t68 = t13**2
      t69 = 1/t68
      t70 = t69*t43
      t72 = 1.D0+0.137284639D1*t69
      t73 = 1/t72
      t75 = t70*t32*t73
      t77 = t19*t7
      t80 = t20*t58
      t83 = -0.2625411059665811D0*t77*t44-1.D0*t80*t61
      t84 = 1/t20
      t85 = t83*t84
      t86 = t85*t6
      vrhob(i) = t11+t17+t23+rhob*(0.2D-21*t51*t28
     #+0.2505897912236993D-1*t66+0.1903580477513215D0*t75
     #+0.2667310007273315D-2*t86)
      v2rhoa2(i) = 0.D0
      v2rhoab(i) = 0.D0
      t91 = (t12+0.13072D2)**2
      t92 = 1/t91
      t104 = 1/t25/t1
      t106 = t31**2
      t107 = 1/t106
      t115 = 1/t31/rhob
      t121 = t46**2
      t125 = 0.1378556646443111D0*t104*t107
      t127 = 0.4135669939329333D0*t26*t115
      t129 = 1/t42/t1
      t130 = t129*t107
      t132 = t43*t115
      t152 = t107*t73
      t161 = t68**2
      t165 = t72**2
      t171 = t104*t7*t107
      t180 = 1/t57/t6
      t182 = t61**2
      t187 = -t125+t127-0.2201308720615045D1*t130+0.5283140929476108D1
     #*t132
      s1 = 0.2D-21*(-0.1378556646443111D0*t104*t29*t107
     #+0.4135669939329333D0*t26*t36*t32*t46+0.4135669939329333D0*t30
     #*t115+0.12407009817988D1*t2/t35/t28*t121-0.6203504908994D0*t37*(
     #-t125+t127-0.1429973890497978D1*t130+0.3431937337195148D1*t132))
     #*t50*t28+0.2D-21*t51*t46+0.8352993040789975D-2*t64/t2/t1*t6*t32
     #+0.9995362477254242D-1/t68/t13*t104*t152+0.1586317064594346D0
     #*t69*t129*t152-0.3807160955026431D0*t70*t115*t73
      t223 = s1-0.1372209729363994D0/t161/t13*t104*t107/t165
     #+0.2505897912236993D-1*(-0.1378556646443111D0*t171
     #+0.4135669939329333D0*t26*t58*t32*t61+0.4135669939329333D0*t54
     #*t115+0.12407009817988D1*t2*t180*t182-0.6203504908994D0*t59*t187
     #)*t50*t6+0.2505897912236993D-1*t65*t61+0.2667310007273315D-2*
     #(0.3446391616107778D-1*t171+0.5250822119331622D0*t19*t58*t44*t61
     #-0.2187842549721509D0*t77*t130+0.5250822119331622D0*t77*t132
     #+2.D0*t20*t180*t182-1.D0*t80*t187)*t84*t6+0.7002785192652656D-3
     #*t83/t20/t19*t6*t43*t32+0.2667310007273315D-2*t85*t61
      v2rhob2(i) = 0.1D-20*t92*t43*t32/(1.D0+0.2016D-2*t92)
     #+0.5011795824473985D-1*t66+0.3807160955026431D0*t75
     #+0.533462001454663D-2*t86+rhob*t223
      elseif(rhob.lt.tol) then
      rho = rhoa
      t1 = 1/rhoa
      t2 = t1**(1.D0/3.D0)
      t3 = 0.6203504908994D0*t2
      t4 = t1**(1.D0/6.D0)
      t6 = t3+0.1584942278842832D2*t4+0.101578D3
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.1554535D-1*t10
      t12 = 0.1575246635799487D1*t4
      t13 = t12+0.201231D2
      t16 = datan(0.1171685277708993D1/t13)
      t17 = 0.6188180297906063D0*t16
      t19 = 0.7876233178997433D0*t4+0.743294D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.2667310007273315D-2*t22
      zk(i) = rhoa*(t11+t17+t23)
      t25 = t2**2
      t26 = 1/t25
      t28 = t3+0.1029581201158544D2*t4+0.427198D2
      t29 = 1/t28
      t30 = t26*t29
      t31 = rhoa**2
      t32 = 1/t31
      t35 = t28**2
      t36 = 1/t35
      t37 = t2*t36
      t39 = 0.2067834969664667D0*t26*t32
      t40 = t4**2
      t41 = t40**2
      t42 = t41*t4
      t43 = 1/t42
      t44 = t43*t32
      t46 = -t39-0.1715968668597574D1*t44
      t50 = 1/t2
      t51 = (-0.2067834969664667D0*t30*t32-0.6203504908994D0*t37*t46)
     #*t50
      t54 = t26*t7
      t57 = t6**2
      t58 = 1/t57
      t59 = t2*t58
      t61 = -t39-0.2641570464738054D1*t44
      t64 = -0.2067834969664667D0*t54*t32-0.6203504908994D0*t59*t61
      t65 = t64*t50
      t66 = t65*t6
      t68 = t13**2
      t69 = 1/t68
      t70 = t69*t43
      t72 = 1.D0+0.137284639D1*t69
      t73 = 1/t72
      t75 = t70*t32*t73
      t77 = t19*t7
      t80 = t20*t58
      t83 = -0.2625411059665811D0*t77*t44-1.D0*t80*t61
      t84 = 1/t20
      t85 = t83*t84
      t86 = t85*t6
      vrhoa(i) = t11+t17+t23+rhoa*(0.2D-21*t51*t28
     #+0.2505897912236993D-1*t66+0.1903580477513215D0*t75
     #+0.2667310007273315D-2*t86)
      vrhob(i) = 0.D0
      t91 = (t12+0.13072D2)**2
      t92 = 1/t91
      t104 = 1/t25/t1
      t106 = t31**2
      t107 = 1/t106
      t115 = 1/t31/rhoa
      t121 = t46**2
      t125 = 0.1378556646443111D0*t104*t107
      t127 = 0.4135669939329333D0*t26*t115
      t129 = 1/t42/t1
      t130 = t129*t107
      t132 = t43*t115
      t152 = t107*t73
      t161 = t68**2
      t165 = t72**2
      t171 = t104*t7*t107
      t180 = 1/t57/t6
      t182 = t61**2
      t187 = -t125+t127-0.2201308720615045D1*t130+0.5283140929476108D1
     #*t132
      s1 = 0.2D-21*(-0.1378556646443111D0*t104*t29*t107
     #+0.4135669939329333D0*t26*t36*t32*t46+0.4135669939329333D0*t30
     #*t115+0.12407009817988D1*t2/t35/t28*t121-0.6203504908994D0*t37*(
     #-t125+t127-0.1429973890497978D1*t130+0.3431937337195148D1*t132))
     #*t50*t28+0.2D-21*t51*t46+0.8352993040789975D-2*t64/t2/t1*t6*t32
     #+0.9995362477254242D-1/t68/t13*t104*t152+0.1586317064594346D0
     #*t69*t129*t152-0.3807160955026431D0*t70*t115*t73
      t223 = s1-0.1372209729363994D0/t161/t13*t104*t107/t165
     #+0.2505897912236993D-1*(-0.1378556646443111D0*t171
     #+0.4135669939329333D0*t26*t58*t32*t61+0.4135669939329333D0*t54
     #*t115+0.12407009817988D1*t2*t180*t182-0.6203504908994D0*t59*t187
     #)*t50*t6+0.2505897912236993D-1*t65*t61+0.2667310007273315D-2*
     #(0.3446391616107778D-1*t171+0.5250822119331622D0*t19*t58*t44*t61
     #-0.2187842549721509D0*t77*t130+0.5250822119331622D0*t77*t132
     #+2.D0*t20*t180*t182-1.D0*t80*t187)*t84*t6+0.7002785192652656D-3
     #*t83/t20/t19*t6*t43*t32+0.2667310007273315D-2*t85*t61
      v2rhoa2(i) = 0.1D-20*t92*t43*t32/(1.D0+0.2016D-2*t92)
     #+0.5011795824473985D-1*t66+0.3807160955026431D0*t75
     #+0.533462001454663D-2*t86+rhoa*t223
      v2rhob2(i) = 0.D0
      v2rhoab(i) = 0.D0
      else ! (.not.(rhoa.lt.tol).and..not.(rhob.lt.tol))
      t1 = 1/rho
      t2 = t1**(1.D0/3.D0)
      t3 = 0.6203504908994D0*t2
      t4 = t1**(1.D0/6.D0)
      t6 = t3+0.1029581201158544D2*t4+0.427198D2
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.310907D-1*t10
      t12 = 0.1575246635799487D1*t4
      t13 = t12+0.13072D2
      t16 = datan(0.448998886412873D-1/t13)
      t17 = 0.205219729378375D2*t16
      t18 = 0.7876233178997433D0*t4
      t19 = t18+0.409286D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.4431373767749538D-2*t22
      t25 = t3+0.8414573716781907D0*t4+0.114813D2
      t26 = 1/t25
      t29 = dlog(0.6203504908994D0*t2*t26)
      t30 = t12+0.106835D1
      t33 = datan(0.6692072046645941D1/t30)
      t35 = t18+0.228344D0
      t36 = t35**2
      t38 = dlog(t36*t26)
      t40 = t29+0.3232383690605507D0*t33+0.2160871036089827D-1*t38
      t42 = rhoa-1.D0*rhob
      t43 = t42*t1
      t44 = 1.D0+t43
      t45 = t44**(1.D0/3.D0)
      t48 = 1.D0-1.D0*t43
      t49 = t48**(1.D0/3.D0)
      t51 = t45*t44+t49*t48-2.D0
      t52 = t40*t51
      t54 = t3+0.1584942278842832D2*t4+0.101578D3
      t55 = 1/t54
      t58 = dlog(0.6203504908994D0*t2*t55)
      t60 = t12+0.201231D2
      t63 = datan(0.1171685277708993D1/t60)
      t65 = t18+0.743294D0
      t66 = t65**2
      t68 = dlog(t66*t55)
      t73 = 0.1554535D-1*t58+0.6188180297906063D0*t63
     #+0.2667310007273315D-2*t68-0.310907D-1*t10-0.205219729378375D2
     #*t16-0.4431373767749538D-2*t22
      t74 = 1/t40
      t77 = -0.101257459063883D3*t73*t74-1.D0
      t78 = t42**2
      t79 = t78**2
      t80 = t77*t79
      t81 = rho**2
      t82 = t81**2
      t83 = 1/t82
      t85 = 1.D0+t80*t83
      t87 = 0.1899772193293833D-1*t52*t85
      zk(i) = rho*(t11+t17+t23-t87)
      t93 = 0.1333333333333333D1*t45*t1-0.1333333333333333D1*t49*t1
      t94 = t40*t93
      t95 = t94*t85
      t96 = 0.1899772193293833D-1*t95
      t97 = t78*t42
      t98 = t77*t97
      t99 = t98*t83
      t100 = t52*t99
      t104 = t2**2
      t105 = 1/t104
      t106 = t105*t7
      t107 = 1/t81
      t110 = t6**2
      t111 = 1/t110
      t112 = t2*t111
      t114 = 0.2067834969664667D0*t105*t107
      t115 = t4**2
      t116 = t115**2
      t117 = t116*t4
      t118 = 1/t117
      t119 = t118*t107
      t121 = -t114-0.1715968668597574D1*t119
      t124 = -0.2067834969664667D0*t106*t107-0.6203504908994D0*t112*t121
      t125 = 1/t2
      t126 = t124*t125
      t127 = t126*t6
      t129 = t13**2
      t130 = 1/t129
      t131 = t130*t118
      t133 = 1.D0+0.2016D-2*t130
      t134 = 1/t133
      t136 = t131*t107*t134
      t138 = t19*t7
      t141 = t20*t111
      t144 = -0.2625411059665811D0*t138*t119-1.D0*t141*t121
      t145 = 1/t20
      t146 = t144*t145
      t147 = t146*t6
      t149 = t105*t26
      t152 = t25**2
      t153 = 1/t152
      t154 = t2*t153
      t156 = -t114-0.1402428952796985D0*t119
      t159 = -0.2067834969664667D0*t149*t107-0.6203504908994D0*t154*t156
      t160 = t159*t125
      t163 = t30**2
      t164 = 1/t163
      t165 = t164*t118
      t167 = 1.D0+0.447838282775D2*t164
      t168 = 1/t167
      t172 = t35*t26
      t175 = t36*t153
      t178 = -0.2625411059665811D0*t172*t119-1.D0*t175*t156
      t179 = 1/t36
      t180 = t178*t179
      t183 = 0.161199195401647D1*t160*t25+0.5679117119058793D0*t165
     #*t107*t168+0.2160871036089827D-1*t180*t25
      t184 = t183*t51
      t185 = t184*t85
      t187 = t45*t42
      t190 = t49*t42
      t193 = -0.1333333333333333D1*t187*t107+0.1333333333333333D1*t190
     #*t107
      t194 = t40*t193
      t195 = t194*t85
      t197 = t105*t55
      t200 = t54**2
      t201 = 1/t200
      t202 = t2*t201
      t204 = -t114-0.2641570464738054D1*t119
      t207 = -0.2067834969664667D0*t197*t107-0.6203504908994D0*t202*t204
      t208 = t207*t125
      t211 = t60**2
      t212 = 1/t211
      t213 = t212*t118
      t215 = 1.D0+0.137284639D1*t212
      t216 = 1/t215
      t220 = t65*t55
      t223 = t66*t201
      t226 = -0.2625411059665811D0*t220*t119-1.D0*t223*t204
      t227 = 1/t66
      t228 = t226*t227
      t234 = 0.2505897912236993D-1*t208*t54+0.1903580477513215D0*t213
     #*t107*t216+0.2667310007273315D-2*t228*t54-0.5011795824473985D-1
     #*t127-0.2419143800947354D0*t136-0.4431373767749538D-2*t147
      t237 = t40**2
      t238 = 1/t237
      t239 = t73*t238
      t242 = -0.101257459063883D3*t234*t74+0.101257459063883D3*t239*t183
      t243 = t242*t79
      t246 = 1/t82/rho
      t249 = t243*t83-4.D0*t80*t246
      t250 = t52*t249
      t253 = rho*(0.5011795824473985D-1*t127+0.2419143800947354D0*t136
     #+0.4431373767749538D-2*t147-0.1899772193293833D-1*t185
     #-0.1899772193293833D-1*t195-0.1899772193293833D-1*t250)
      vrhoa(i) = rho*(-t96-0.7599088773175333D-1*t100)+t11+t17+t23-t87
     #+t253
      t254 = -t93
      t255 = t40*t254
      t256 = t255*t85
      t257 = 0.1899772193293833D-1*t256
      vrhob(i) = rho*(-t257+0.7599088773175333D-1*t100)+t11+t17+t23
     #-t87+t253
      t261 = t45**2
      t262 = 1/t261
      t265 = t49**2
      t266 = 1/t265
      t269 = 0.4444444444444444D0*t262*t107+0.4444444444444444D0*t266
     #*t107
      t272 = 0.1899772193293833D-1*t40*t269*t85
      t273 = t94*t99
      t277 = t52*t77*t78*t83
      t278 = 0.22797266319526D0*t277
      t285 = 0.1899772193293833D-1*t183*t93*t85
      t286 = t184*t99
      t287 = 0.7599088773175333D-1*t286
      t290 = 1/t81/rho
      t300 = -0.4444444444444444D0*t262*t42*t290-0.1333333333333333D1
     #*t45*t107-0.4444444444444444D0*t266*t42*t290
     #+0.1333333333333333D1*t49*t107
      t303 = 0.1899772193293833D-1*t40*t300*t85
      t304 = t194*t99
      t305 = 0.7599088773175333D-1*t304
      t307 = 0.1899772193293833D-1*t94*t249
      t309 = t242*t97*t83
      t311 = t98*t246
      t313 = 4.D0*t309-16.D0*t311
      t317 = rho*(-t285-t287-t303-t305-t307-0.1899772193293833D-1*t52
     #*t313)
      t318 = t52*t309
      t320 = t52*t311
      t323 = rho*(-t285-t303-t307-t287-t305-0.7599088773175333D-1*t318
     #+0.3039635509270133D0*t320)
      t324 = 0.1002359164894797D0*t127
      t325 = 0.4838287601894708D0*t136
      t326 = 0.8862747535499077D-2*t147
      t327 = 0.3799544386587666D-1*t185
      t328 = 0.3799544386587666D-1*t195
      t329 = 0.3799544386587666D-1*t250
      t331 = 1/t104/t1
      t333 = t331*t7*t83
      t342 = 1/t110/t6
      t344 = t121**2
      t348 = 0.1378556646443111D0*t331*t83
      t350 = 0.4135669939329333D0*t105*t290
      t352 = 1/t117/t1
      t353 = t352*t83
      t355 = t118*t290
      t357 = -t348+t350-0.1429973890497978D1*t353+0.3431937337195148D1
     #*t355
      t362 = (-0.1378556646443111D0*t333+0.4135669939329333D0*t105
     #*t111*t107*t121+0.4135669939329333D0*t106*t290
     #+0.12407009817988D1*t2*t342*t344-0.6203504908994D0*t112*t357)
     #*t125*t6
      t365 = 1/t2/t1
      t368 = t124*t365*t6*t107
      t370 = t126*t121
      t375 = t83*t134
      t376 = 1/t129/t13*t331*t375
      t379 = t130*t352*t375
      t382 = t131*t290*t134
      t384 = t129**2
      t388 = t133**2
      t391 = 1/t384/t13*t331*t83/t388
      t409 = (0.3446391616107778D-1*t333+0.5250822119331622D0*t19*t111
     #*t119*t121-0.2187842549721509D0*t138*t353+0.5250822119331622D0
     #*t138*t355+2.D0*t20*t342*t344-1.D0*t141*t357)*t145*t6
      t416 = t144/t20/t19*t6*t118*t107
      t418 = t146*t121
      t421 = t331*t26*t83
      t430 = 1/t152/t25
      t432 = t156**2
      t437 = -t348+t350-0.1168690793997487D0*t353+0.2804857905593969D0
     #*t355
      t453 = t83*t168
      t462 = t163**2
      t466 = t167**2
      t498 = 0.161199195401647D1*(-0.1378556646443111D0*t421
     #+0.4135669939329333D0*t105*t153*t107*t156+0.4135669939329333D0
     #*t149*t290+0.12407009817988D1*t2*t430*t432-0.6203504908994D0
     #*t154*t437)*t125*t25+0.5373306513388232D0*t159*t365*t25*t107
     #+0.161199195401647D1*t160*t156+0.2982003378702879D0/t163/t30
     #*t331*t453+0.4732597599215661D0*t164*t352*t453
     #-0.1135823423811759D1*t165*t290*t168-0.1335455272347545D2/t462
     #/t30*t331*t83/t466+0.2160871036089827D-1*(0.3446391616107778D-1
     #*t421+0.5250822119331622D0*t35*t153*t119*t156
     #-0.2187842549721509D0*t172*t353+0.5250822119331622D0*t172*t355
     #+2.D0*t36*t430*t432-1.D0*t175*t437)*t179*t25
     #+0.567317471666175D-2*t178/t36/t35*t25*t118*t107
     #+0.2160871036089827D-1*t180*t156
      t524 = t331*t55*t83
      t533 = 1/t200/t54
      t535 = t204**2
      t540 = -t348+t350-0.2201308720615045D1*t353+0.5283140929476108D1
     #*t355
      t556 = t83*t216
      t565 = t211**2
      t569 = t215**2
      s1 = 0.2505897912236993D-1*(-0.1378556646443111D0*t524
     #+0.4135669939329333D0*t105*t201*t107*t204+0.4135669939329333D0
     #*t197*t290+0.12407009817988D1*t2*t533*t535-0.6203504908994D0
     #*t202*t540)*t125*t54+0.8352993040789975D-2*t207*t365*t54*t107
     #+0.2505897912236993D-1*t208*t204+0.9995362477254242D-1/t211/t60
     #*t331*t556+0.1586317064594346D0*t212*t352*t556
     #-0.3807160955026431D0*t213*t290*t216-0.1372209729363994D0/t565
     #/t60*t331*t83/t569+0.2667310007273315D-2*(0.3446391616107778D-1
     #*t524+0.5250822119331622D0*t65*t201*t119*t204
     #-0.2187842549721509D0*t220*t353+0.5250822119331622D0*t220*t355
     #+2.D0*t66*t533*t535-1.D0*t223*t540)*t227*t54
     #+0.7002785192652656D-3*t226/t66/t65*t54*t118*t107
     #+0.2667310007273315D-2*t228*t204
      t611 = s1-0.5011795824473985D-1*t362-0.1670598608157995D-1*t368
     #-0.5011795824473985D-1*t370-0.1270249377985834D0*t376
     #-0.2015953167456128D0*t379+0.4838287601894708D0*t382
     #+0.2560822746019441D-3*t391-0.4431373767749538D-2*t409
     #-0.1163417769936259D-2*t416-0.4431373767749538D-2*t418
      t620 = t183**2
      t637 = 0.5011795824473985D-1*t362+0.1670598608157995D-1*t368
     #+0.5011795824473985D-1*t370+0.1270249377985834D0*t376
     #+0.2015953167456128D0*t379-0.4838287601894708D0*t382
     #-0.2560822746019441D-3*t391+0.4431373767749538D-2*t409
     #+0.1163417769936259D-2*t416+0.4431373767749538D-2*t418
     #-0.1899772193293833D-1*t498*t51*t85-0.3799544386587666D-1*t183
     #*t193*t85-0.3799544386587666D-1*t184*t249-0.1899772193293833D-1
     #*t40*(0.4444444444444444D0*t262*t78*t83+0.2666666666666667D1
     #*t187*t290+0.4444444444444444D0*t266*t78*t83
     #-0.2666666666666667D1*t190*t290)*t85-0.3799544386587666D-1*t194
     #*t249-0.1899772193293833D-1*t52*((-0.101257459063883D3*t611*t74
     #+0.2025149181277661D3*t234*t238*t183-0.2025149181277661D3*t73
     #/t237/t40*t620+0.101257459063883D3*t239*t498)*t79*t83-8.D0*t243
     #*t246+20.D0*t80/t82/t81)
      t638 = rho*t637
      v2rhoa2(i) = rho*(-t272-0.1519817754635067D0*t273-t278)
     #-0.3799544386587666D-1*t95-0.1519817754635067D0*t100+t317+t323
     #+t324+t325+t326-t327-t328-t329+t638
      t639 = t255*t99
      t647 = 0.1899772193293833D-1*t183*t254*t85
      t648 = 0.7599088773175333D-1*t286
      t652 = -0.1899772193293833D-1*t40*t300*t85
      t653 = 0.7599088773175333D-1*t304
      t655 = 0.1899772193293833D-1*t255*t249
      t660 = rho*(-t647+t648-t652+t653-t655+0.1899772193293833D-1*t52
     #*t313)
      t664 = rho*(-t647-t652-t655+t648+t653+0.7599088773175333D-1*t318
     #-0.3039635509270133D0*t320)
      v2rhob2(i) = rho*(-t272+0.1519817754635067D0*t639-t278)
     #-0.3799544386587666D-1*t256+0.1519817754635067D0*t100+t660+t664
     #+t324+t325+t326-t327-t328-t329+t638
      v2rhoab(i) = rho*(0.1899772193293833D-1*t40*t269*t85
     #+0.7599088773175333D-1*t273-0.7599088773175333D-1*t639
     #+0.22797266319526D0*t277)-t257+0.5D0*t660-t96+0.5D0*t323+t324
     #+t325+t326-t327-t328-t329+t638+0.5D0*t317+0.5D0*t664
      endif ! rhoa,rhob
      else ! rho
      zk(i) = 0.0d0
      vrhoa(i) = 0.0d0
      vrhob(i) = 0.0d0
      v2rhoa2(i) = 0.0d0
      v2rhob2(i) = 0.0d0
      v2rhoab(i) = 0.0d0
      endif ! rho
      enddo
      
      endif ! ideriv
      return
      end
      
      
      subroutine rks_c_vwn5rpa
     & (ideriv,npt,rhoa1,sigmaaa1,
     &  zk,vrhoa,vsigmaaa,
     &  v2rhoa2,v2rhoasigmaaa,v2sigmaaa2)
c
c     S.H. Vosko, L. Wilk, and M. Nusair
c     Accurate spin-dependent electron liquid correlation energies for
c     local spin density calculations: a critical analysis
c     Can. J. Phys. 58 (1980) 1200-1211
c
c
c     CITATION:
c
c     Functionals were obtained from the Density Functional Repository 
c     as developed and distributed by the Quantum Chemistry Group, 
c     CCLRC Daresbury Laboratory, Daresbury, Cheshire, WA4 4AD 
c     United Kingdom. Contact Huub van Dam (h.j.j.vandam@dl.ac.uk) or 
c     Paul Sherwood for further information.
c
c     COPYRIGHT:
c
c     Users may incorporate the source code into software packages and
c     redistribute the source code provided the source code is not
c     changed in anyway and is properly cited in any documentation or
c     publication related to its use.
c
c     ACKNOWLEDGEMENT:
c
c     The source code was generated using Maple 8 through a modified
c     version of the dfauto script published in:
c
c        R. Strange, F.R. Manby, P.J. Knowles
c        Automatic code generation in density functional theory
c        Comp. Phys. Comm. 136 (2001) 310-318.
c
      implicit real*8 (a-h,o-z)
      integer ideriv,npt
      real*8 rhoa1(npt)
      real*8 sigmaaa1(npt)
      real*8 zk(npt),vrhoa(npt),vsigmaaa(npt)
      real*8 v2rhoa2(npt),v2rhoasigmaaa(npt),v2sigmaaa2(npt)
      parameter(tol=1.0d-20)
      
      if(ideriv.eq.0) then
      
      do i=1,npt
      rho = dmax1(0.D0,rhoa1(i))
      if(rho.gt.tol) then
      t1 = 1/rho
      t2 = t1**(1.D0/3.D0)
      t4 = t1**(1.D0/6.D0)
      t7 = 1/(0.6203504908994D0*t2+0.1029581201158544D2*t4+0.427198D2)
      t10 = dlog(0.6203504908994D0*t2*t7)
      t16 = datan(0.448998886412873D-1/(0.1575246635799487D1*t4
     #+0.13072D2))
      t20 = (0.7876233178997433D0*t4+0.409286D0)**2
      t22 = dlog(t20*t7)
      zk(i) = rho*(0.310907D-1*t10+0.205219729378375D2*t16
     #+0.4431373767749538D-2*t22)
      else ! rho
      zk(i) = 0.0d0
      endif ! rho
      enddo
      
      else if(ideriv.eq.1) then
      
      do i=1,npt
      rho = dmax1(0.D0,rhoa1(i))
      if(rho.gt.tol) then
      t1 = 1/rho
      t2 = t1**(1.D0/3.D0)
      t4 = t1**(1.D0/6.D0)
      t6 = 0.6203504908994D0*t2+0.1029581201158544D2*t4+0.427198D2
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.310907D-1*t10
      t13 = 0.1575246635799487D1*t4+0.13072D2
      t16 = datan(0.448998886412873D-1/t13)
      t17 = 0.205219729378375D2*t16
      t19 = 0.7876233178997433D0*t4+0.409286D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.4431373767749538D-2*t22
      zk(i) = rho*(t11+t17+t23)
      t25 = t2**2
      t26 = 1/t25
      t28 = rho**2
      t29 = 1/t28
      t32 = t6**2
      t33 = 1/t32
      t37 = t4**2
      t38 = t37**2
      t40 = 1/t38/t4
      t41 = t40*t29
      t43 = -0.2067834969664667D0*t26*t29-0.1715968668597574D1*t41
      t51 = t13**2
      t52 = 1/t51
      vrhoa(i) = t11+t17+t23+rho*(0.5011795824473985D-1*(
     #-0.2067834969664667D0*t26*t7*t29-0.6203504908994D0*t2*t33*t43)
     #/t2*t6+0.2419143800947354D0*t52*t40*t29/(1.D0+0.2016D-2*t52)
     #+0.4431373767749538D-2*(-0.2625411059665811D0*t19*t7*t41-1.D0
     #*t20*t33*t43)/t20*t6)
      else ! rho
      zk(i) = 0.0d0
      vrhoa(i) = 0.0d0
      endif ! rho
      enddo
      
      else if(ideriv.eq.2) then
      
      do i=1,npt
      rho = dmax1(0.D0,rhoa1(i))
      if(rho.gt.tol) then
      t1 = 1/rho
      t2 = t1**(1.D0/3.D0)
      t4 = t1**(1.D0/6.D0)
      t6 = 0.6203504908994D0*t2+0.1029581201158544D2*t4+0.427198D2
      t7 = 1/t6
      t10 = dlog(0.6203504908994D0*t2*t7)
      t11 = 0.310907D-1*t10
      t13 = 0.1575246635799487D1*t4+0.13072D2
      t16 = datan(0.448998886412873D-1/t13)
      t17 = 0.205219729378375D2*t16
      t19 = 0.7876233178997433D0*t4+0.409286D0
      t20 = t19**2
      t22 = dlog(t20*t7)
      t23 = 0.4431373767749538D-2*t22
      zk(i) = rho*(t11+t17+t23)
      t25 = t2**2
      t26 = 1/t25
      t27 = t26*t7
      t28 = rho**2
      t29 = 1/t28
      t32 = t6**2
      t33 = 1/t32
      t34 = t2*t33
      t37 = t4**2
      t38 = t37**2
      t39 = t38*t4
      t40 = 1/t39
      t41 = t40*t29
      t43 = -0.2067834969664667D0*t26*t29-0.1715968668597574D1*t41
      t46 = -0.2067834969664667D0*t27*t29-0.6203504908994D0*t34*t43
      t47 = 1/t2
      t48 = t46*t47
      t49 = t48*t6
      t51 = t13**2
      t52 = 1/t51
      t53 = t52*t40
      t55 = 1.D0+0.2016D-2*t52
      t56 = 1/t55
      t58 = t53*t29*t56
      t60 = t19*t7
      t63 = t20*t33
      t66 = -0.2625411059665811D0*t60*t41-1.D0*t63*t43
      t67 = 1/t20
      t68 = t66*t67
      t69 = t68*t6
      vrhoa(i) = t11+t17+t23+rho*(0.5011795824473985D-1*t49
     #+0.2419143800947354D0*t58+0.4431373767749538D-2*t69)
      t77 = 1/t25/t1
      t79 = t28**2
      t80 = 1/t79
      t81 = t77*t7*t80
      t88 = 1/t28/rho
      t92 = 1/t32/t6
      t94 = t43**2
      t102 = 1/t39/t1
      t103 = t102*t80
      t105 = t40*t88
      t107 = -0.1378556646443111D0*t77*t80+0.4135669939329333D0*t26
     #*t88-0.1429973890497978D1*t103+0.3431937337195148D1*t105
      t125 = t80*t56
      t134 = t51**2
      t138 = t55**2
      s1 = 0.2004718329789594D0*t49+0.9676575203789416D0*t58
      v2rhoa2(i) = s1+0.1772549507099815D-1*t69+2.D0*rho*
     #(0.5011795824473985D-1*(-0.1378556646443111D0*t81
     #+0.4135669939329333D0*t26*t33*t29*t43+0.4135669939329333D0*t27
     #*t88+0.12407009817988D1*t2*t92*t94-0.6203504908994D0*t34*t107)
     #*t47*t6+0.1670598608157995D-1*t46/t2/t1*t6*t29
     #+0.5011795824473985D-1*t48*t43+0.1270249377985834D0/t51/t13*t77
     #*t125+0.2015953167456128D0*t52*t102*t125-0.4838287601894708D0
     #*t53*t88*t56-0.2560822746019441D-3/t134/t13*t77*t80/t138
     #+0.4431373767749538D-2*(0.3446391616107778D-1*t81
     #+0.5250822119331622D0*t19*t33*t41*t43-0.2187842549721509D0*t60
     #*t103+0.5250822119331622D0*t60*t105+2.D0*t20*t92*t94-1.D0*t63
     #*t107)*t67*t6+0.1163417769936259D-2*t66/t20/t19*t6*t40*t29
     #+0.4431373767749538D-2*t68*t43)
      else ! rho
      zk(i) = 0.0d0
      vrhoa(i) = 0.0d0
      v2rhoa2(i) = 0.0d0
      endif ! rho
      enddo
      
      endif ! ideriv
      return
      end

c:C_VWN5RPAsubrend

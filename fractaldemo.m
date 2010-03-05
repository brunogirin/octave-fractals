% Copyright 2008--2010 Bruno Girin, brunogirin@gmail.com
% 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%
% Fractal demo
%

% hpx values
% if arguments have been given to the script, use
% the first argument for hpx1, otherwise default
% to 320; then calculate hpx2 from hpx1
if(nargin > 0)
  hpx1=str2num(argv(){1});
else
  hpx1=320;
endif
hpx2=hpx1*3/4;

% Colour maps
bluemap=cat(1,
  gradient([0,0,0.5],[0,0.2,1],17)(1:16,:),
  gradient([0,0.2,1],[0,0.8,1],33)(1:32,:),
  gradient([0,0.8,1],[1,1,1],16)
);
greenmap=cat(1,
  gradient([0,0.5,0],[0,1,0.2],17)(1:16,:),
  gradient([0,1,0.2],[0,1,0.8],33)(1:32,:),
  gradient([0,1,0.8],[1,1,1],16)
);
redmap1=cat(1,
  gradient([0.5,0,0],[1,0.2,0],17)(1:16,:),
  gradient([1,0.2,0],[1.0,0.8,0],33)(1:32,:),
  gradient([1,1,0],[1,1,1],16)
);
redmap2=cat(1,
  gradient([0.5,0,0],[1,0.2,0],9)(1:8,:),
  gradient([1,0.2,0],[1.0,0.8,0],17)(1:16,:),
  gradient([1,0.8,0],[1,1,1],40)
);

%
% Article 1: Classic Mandelbrot and Julia
%
% Classic Mandelbrot
Mc=mandelbrot(-2.1+1.05i,0.7-1.05i,hpx1,64);
saveimage("f1.1-mandelbrot-classic.ppm", Mc, "ppm", colormap);
% Classic Julia with c=-0.75+0.2i
Jc1=julia(-1.6+1.2i,1.6-1.2i,hpx1,64,-0.75+0.2i);
saveimage("f1.2-julia-classic-c_0.75+0.2i.ppm", Jc1, "ppm", colormap);
%
% Article 2: More on the Classic Sets
%
% Mandelbrot zoom top centre
Mcz=mandelbrot(-0.27+i,0.05+0.76i,hpx1,64);
saveimage("f2.1-mandelbrot-classic-zoom.ppm", Mcz, "ppm", colormap);
% Mandelbrot with z0=0.2+0.2i
Mz0=mandelbrot(-2.1+1.05i,0.7-1.05i,hpx1,64,:,:,0.2+0.2i);
saveimage("f2.2-mandelbrot-z0_0.2+0.2i.ppm", Mz0, "ppm", colormap);
% Classic Julia with c=-0.1+0.9i
Jc2=julia(-1.6+1.2i,1.6-1.2i,hpx1,64,-0.1+0.9i);
saveimage("f2.3-julia-classic-c_-0.1+0.9i.ppm", Jc2, "ppm", colormap);
% Classic Julia with c=-0.1+0.9i zoom x10 off centre
Jc2z=julia(-0.16+0.24i,0.16,hpx1,64,-0.1+0.9i);
saveimage("f2.4-julia-classic-c_-0.1+0.9i-zoom-x10.ppm", Jc2z, "ppm", colormap);
% Classic Julia with c=-0.1+0.9i zoom x100 off centre
Jc2zz=julia(-0.016+0.072i,0.016+0.048i,hpx1,64,-0.1+0.9i);
saveimage("f2.5-julia-classic-c_-0.1+0.9i-zoom-x100.ppm", Jc2zz, "ppm", colormap);
%
% Article 3: Other Polynomials
%
% Cubic series
fn3=@(z,c) z.^3.+c;
% Mandelbrot
Mn3=mandelbrot(-1.2+1.6i,1.2-1.6i,hpx2,64,fn3);
saveimage("f3.1-mandelbrot-cubic.ppm", Mn3, "ppm", colormap);
% Julia with c=0.4
Jn3=julia(-1.6+1.2i,1.6-1.2i,hpx1,64,0.4,fn3);
saveimage("f3.2-julia-cubic-c_0.4.ppm", Jn3, "ppm", colormap);
%
% Quartic series
fn4=@(z,c) z.^4.+c;
% Mandelbrot
Mn4=mandelbrot(-1.6+1.2i,1.6-1.2i,hpx1,64,fn4);
saveimage("f3.3-mandelbrot-quartic.ppm", Mn4, "ppm", colormap);
% Julia with c=-0.95i
Jn4=julia(-1.6+1.2i,1.6-1.2i,hpx1,64,-1,fn4);
saveimage("f3.4-julia-quartic-c_-1.ppm", Jn4, "ppm", colormap);
%
% Decimal power, n=2.5
fn2_5=@(z,c) z.^2.5.+c;
Mn2_5=mandelbrot(-1.6+1.2i,1.6-1.2i,hpx1,64,fn2_5);
saveimage("f3.5-mandelbrot-n2.5.ppm", Mn2_5, "ppm", colormap);
%
% Complex power, n=2+0.1i
fn2_01i=@(z,c) z.^(2+.1i).+c;
Mn2_01i=mandelbrot(-2.2+1.2i,1.0-1.2i,hpx1,64,fn2_01i);
saveimage("f3.6-mandelbrot-n2+0.1i.ppm", Mn2_01i, "ppm", colormap);
% Polyomial f=z^2+z+c
fp=@(z,c) z.^2.+z.+c;
Mp=mandelbrot(-2+1.05i,0.8-1.05i,hpx1,64,fp);
saveimage("f3.7-mandelbrot-poly.ppm", Mp, "ppm", colormap);
%
% Article 4: Trigonometric Functions and Exponential
%
% sine
fsin=@(z,c) c.*sin(z);
rtrig=@(z) abs(imag(z))<=50;
% sin Mandelbrot
Msin=mandelbrot(-1.2*pi+0.9*pi*i,1.2*pi-0.9*pi*i,hpx1,64,fsin,rtrig,"c");
saveimage("f4.1-mandelbrot-sin.ppm", Msin, "ppm", redmap1);
% sin Julia with c=1+0.5i
Jsin=julia(-2.4*pi+1.8*pi*i,2.4*pi-1.8*pi*i,hpx1,64,1+0.5i,fsin,rtrig);
saveimage("f4.2-julia-sin-c_1+0.5i.ppm", Jsin, "ppm", redmap2);
%
% cosine
fcos=@(z,c) i.*c.*cos(z);
% cos Mandelbrot
Mcos=mandelbrot(-1.2*pi+0.9*pi*i,1.2*pi-0.9*pi*i,hpx1,64,fcos,rtrig,"c");
saveimage("f4.3-mandelbrot-cos.ppm", Mcos, "ppm", redmap1);
% cos Julia with c=0.55+1.195i
Jcos=julia(-2.4*pi+1.8*pi*i,2.4*pi-1.8*pi*i,hpx1,64,0.55+1.195i,fcos,rtrig);
saveimage("f4.4-julia-cos-c_0.55+1.195i.ppm", Jcos, "ppm", redmap2);
%
% tangent
ftan=@(z,c) c.*tan(z);
% tan Mandelbrot
Mtan=mandelbrot(-1.4+1.4i,1.4-1.4i,hpx1,64,ftan,:,"c");
saveimage("f4.5-mandelbrot-tan.ppm", Mtan, "ppm", redmap1);
% tan Julia with c=(1+i)*sqrt(2)/2
Jtan=julia(-1.4+1.4i,1.4-1.4i,hpx1,64,(1+i)*sqrt(2)/2,ftan);
saveimage("f4.6-julia-tan.ppm-c_1+i_sqrt2_2.ppm", Jtan, "ppm", colormap);
%
% exp mult Mandelbrot
fexp1=@(z,c) c.*exp(z.^2);
Mexp1=mandelbrot(-1.4+2i,1.4-2i,hpx2,64,fexp1);
saveimage("f4.7-mandelbrot-exp_mult.ppm", Mexp1, "ppm", redmap2);
% exp plus Mandelbrot
fexp2=@(z,c) exp(z.^2).+c;
Mexp2=mandelbrot(-2.2+2i,1-2i,hpx2,64,fexp2);
saveimage("f4.8-mandelbrot-exp_plus.ppm", Mexp2, "ppm", colormap);
%
% Cactus (http://local.wasp.uwa.edu.au/~pbourke/fractals/cactus/)
fcactus=@(z,c) z.^3.+(c.-1).*z.-c;
Mcactus=mandelbrot(-0.8+0.6i,0.8-0.6i,hpx1,64,fcactus,:,"c");
saveimage("f4.9-mandelbrot-cactus.ppm", Mcactus, "ppm", colormap);
%
% Article 5: Burning Ship
%
fbs=@(z,c) (abs(real(z))+i*abs(imag(z))).^2.+c;
rbs=200;
% burning ship
Mbs=mandelbrot(-2.5-2i,1.5+i,hpx1,64,fbs,rbs);
saveimage("f5.1-mandelbrot-burningship.ppm", Mbs, "ppm", bluemap);
% burning ship zoom centre left
Mbsz=mandelbrot(-1.8-0.06i,-1.7+0.02i,hpx1,64,fbs,rbs);
saveimage("f5.2-mandelbrot-burningship-zoom-x30.ppm", Mbsz, "ppm", redmap1);
% burning ship with n=3 (bird of prey)
fbs3=@(z,c) (abs(real(z))+i*abs(imag(z))).^3.+c;
Mbs3=mandelbrot(-1.5-1.5i,1.5+1.5i,hpx1,64,fbs3,rbs);
saveimage("f5.3-mandelbrot-burningship-cubic.ppm", Mbs3, "ppm", greenmap);
%
% Article 6: The Original Julia Function
%
fj=@(z,c) z.^4.+z.^3./(z-1)+z.^2./(z.^3.+4*z.^2.+5).+c;
% Mandelbrot
Mj=mandelbrot(-1.4+1.05i,1.4-1.05i,hpx1,64,fj);
saveimage("f6.1-mandelbrot-original.ppm", Mj, "ppm", colormap);
Mjz=mandelbrot(0.25-0.65i,0.45-0.8i,hpx1,64,fj);
saveimage("f6.2-mandelbrot-original-zoom-x10.ppm", Mjz, "ppm", colormap);
Mjzz=mandelbrot(0.378-0.725i,0.398-0.74i,hpx1,64,fj);
saveimage("f6.3-mandelbrot-original-zoom-x100.ppm", Mjzz, "ppm", colormap);
Mjzzz=mandelbrot(0.3863-0.7314i,0.3883-0.7329i,hpx1,64,fj);
saveimage("f6.4-mandelbrot-original-zoom-x1000.ppm", Mjzzz, "ppm", colormap);
% Julia with c=0.3873-0.7314i
Jj=julia(-1.2+1.6i,1.2-1.6i,hpx2,64,0.3873-0.7314i,fj);
saveimage("f6.5-julia-original-c_0.3873-0.7314i.ppm", Jj, "ppm", colormap);
Jjz=julia(0.2+0.1i,0.4-0.05i,hpx1,64,0.3873-0.7314i,fj);
saveimage("f6.6-julia-original-c_0.3873-0.7314i-zoom-x10.ppm", Jjz, "ppm", colormap);
Jjzz=julia(0.366+0.09i,0.386+0.075i,hpx1,64,0.3873-0.7314i,fj);
saveimage("f6.7-julia-original-c_0.3873-0.7314i-zoom-x100.ppm", Jjzz, "ppm", colormap);
Jjzzz=julia(0.384+0.089i,0.386+0.0875i,hpx1,64,0.3873-0.7314i,fj);
saveimage("f6.8-julia-original-c_0.3873-0.7314i-zoom-x1000.ppm", Jjzzz, "ppm", colormap);


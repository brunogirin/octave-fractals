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
% Mandelbrot function
%
function M=mandelbrot(cmin,cmax,hpx,niter,
                      f=@(z,c) z.^2.+c,r=2,
                      z0=0)
  vpx=round(hpx*abs(imag(cmax-cmin)/real(cmax-cmin)));
  [cRe,cIm]=meshgrid(linspace(real(cmin),real(cmax),hpx),
                     linspace(imag(cmin),imag(cmax),vpx));
  c=cRe+i*cIm;
  if(strcmp("c",z0))
    z=c;
  else
    z=zeros(vpx,hpx).+z0;
  endif
  M=mjcore(z,c,niter,f,r);
endfunction


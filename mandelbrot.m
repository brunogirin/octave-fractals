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
% This function generates a matrix of integers from a fractal series
% and an initial value of z0, as per the Mandelbrot algorithm.
%
% Parameters:
%  zmin: the minimal value of z for which the Mandelbrot set is calculated
%  zmax: the maximum value of z for which the Mandelbrot set is calculated
%  hpx: the horizontal resolution of the calculation; this will equate
%       the number of columns in the matrix; the number of rows is
%       calculated in such a way that the ratio hpx / vpx is equal to
%       Re(zmax - zmin) / Im(zmax - zmin)
% niter: the maximum number of iterations
% f: the function of z and c that generates the fractal series
% r: the divergence condition; this can be a function or a number, in
%    which case, z(n) is considered to diverge as soon as z is greater
%    than r
% z0: the initial value of z for the fractal series; this must be a
%     real or complex number or the string constant "c" to indicate that
%     for each element in the matrix, z0 should be equal to the value of
%     c at that position
%
% Returns: a matrix of integers that identify for each point in the
% original matrix the index of the iteration at which the fractal series
% diverges for that point; for any value in the matrix,
% 0 <= value < niter, which means that those values can be used as
% indices in a colour map to produce an image.
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


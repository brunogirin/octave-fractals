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
% Julia function
%
% This function generates a matrix of integers from a fractal series
% and an initial value of c, as per the Julia algorithm.
%
% Parameters:
%  zmin: the minimal value of z for which the Julia set is calculated
%  zmax: the maximum value of z for which the Julia set is calculated
%  hpx: the horizontal resolution of the calculation; this will equate
%       the number of columns in the matrix; the number of rows is
%       calculated in such a way that the ratio hpx / vpx is equal to
%       Re(zmax - zmin) / Im(zmax - zmin)
% niter: the maximum number of iterations
% c: the value of the constant c in the fractal series
% f: the function of z and c that generates the fractal series
% r: the divergence condition; this can be a function or a number, in
%    which case, z(n) is considered to diverge as soon as z is greater
%    than r
%
% Returns: a matrix of integers that identify for each point in the
% original matrix the index of the iteration at which the fractal series
% diverges for that point; for any value in the matrix,
% 0 <= value < niter, which means that those values can be used as
% indices in a colour map to produce an image.
%
function M=julia(zmin,zmax,hpx,niter,c,
                 f=@(z,c) z.^2.+c,
                 r=2)
  vpx=round(hpx*abs(imag(zmax-zmin)/real(zmax-zmin)));
  [zRe,zIm]=meshgrid(linspace(real(zmin),real(zmax),hpx),
                     linspace(imag(zmin),imag(zmax),vpx));
  z=zRe+i*zIm;
  cc=zeros(vpx,hpx)+c;
  M=mjcore(z,cc,niter,f,r);
endfunction


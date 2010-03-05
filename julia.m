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


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
% Mandelbrot/Julia core function
%
function M=mjcore(z,c,niter,f,r)
  if(isa(r,"function_handle"))
    rf=r;
  else
    rf=@(z) abs(z)<r;
  endif
  M=zeros(length(z(:,1)),length(z(1,:)));
  for s=1:niter
    mask=rf(z);
    M(mask)=M(mask)+1;
    z(mask)=f(z(mask),c(mask));
  endfor
  M(mask)=0;
endfunction


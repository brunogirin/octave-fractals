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
% This function generates a matrix of integers from two initial matrices,
% a complex series and a convergence condition. The integers in the
% resulting matrix are the indices of the iterations at which each
% number diverges, as defined by the convergence condition.
%
% This function is not meant to be called on its own but is meant to be
% called via the mandelbrot and julia functions.
%
% Attributes:
%  z: the complex matrix that holds the values of the complex series
%  c: a constant complex matrix used in the series
%  niter: the maximum number of iterations
%  f: a function of z and c that defines z(n+1) in terms of z(n) and c
%  r: the convergence condition; this can be a function or a number that
%     indicates the uppser limit for z over which it is considered to
%     diverge
%
% Returns: a matrix of integers such that for any value in the matrix,
% 0 <= value < niter
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


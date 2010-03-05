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
% gradient function
% Generate a linear gradient from colour c1 to colour c2 with
% n colours in total
%
function g=gradient(c1, c2, n)
  g=[];
  % extend both colour matrices with zeros so that
  % they have the same length
  m=max(length(c1),length(c2));
  c1(length(c1)+1:m)=0;
  c2(length(c2)+1:m)=0;
  % create a gradient for each colour component
  for s=1:m;
    g=cat(2,
      g,
      linspace(c1(s),c2(s),n)'
    );
  endfor
endfunction


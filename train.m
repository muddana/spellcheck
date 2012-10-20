## Copyright (C) 2012 srinivas muddana
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## train

## Author: srinivas muddana <srinivas.muddana@gmail.com>
## Created: 2012-10-15

function [ s ] = train (datafile)
   data = strrep(fileread(datafile), char(10), ' ');
   words = strsplit(data, ' ', true);
   s = struct;
   for word = words
     word = tolower(strtrim(word{1}));
     if any(toascii(word) < 97) || any(toascii(word) > 122)
        continue;
     end
     if isfield(s, word)
       s.(word) = s.(word) + 1;
     else
       s.(word) = 1;
     end
   end
end

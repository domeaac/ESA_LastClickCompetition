%                           function coe2rv
%
%  this function finds the position and velocity vectors in geocentric
%    equatorial (ijk) system given the classical orbit elements.
%
%  inputs          description                    range / units
%    p           - semilatus rectum               km
%    ecc         - eccentricity
%    incl        - inclination                    0.0  to pi rad
%    omega       - longitude of ascending node    0.0  to 2pi rad
%    argp        - argument of perigee            0.0  to 2pi rad
%    nu          - true anomaly                   0.0  to 2pi rad
%    arglat      - argument of latitude      (ci) 0.0  to 2pi rad
%    truelon     - true longitude            (ce) 0.0  to 2pi rad
%    lonper      - longitude of periapsis    (ee) 0.0  to 2pi rad
%    eps         - precision for checking eccentricity/inclination
%  outputs       :
%    r           - ijk position vector            km
%    v           - ijk velocity vector            km / s
%
% ------------------------------------------------------------------------------



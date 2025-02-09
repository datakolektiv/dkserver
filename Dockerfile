### ---------------------------------------------------------------------------
### --- DataKolektiv SERVER 2020/21
### --- Version 1.0.0
### --- 2021.
### --- Author: Goran S. Milovanovic, DataKolektiv
### --- Contact: goran.milovanovic@datakolektiv.com
### ---------------------------------------------------------------------------
### --- LICENSE:
### ---------------------------------------------------------------------------
### --- GPL v2
### --- This file is part of Intro Data Science Non-Technical Background (IDSNT)
### --- IDSNT is free software: you can redistribute it and/or modify
### --- it under the terms of the GNU General Public License as published by
### --- the Free Software Foundation, either version 2 of the License, or
### --- (at your option) any later version.
### ---
### --- IDSNT is distributed in the hope that it will be useful,
### --- but WITHOUT ANY WARRANTY; without even the implied warranty of
### --- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
### --- GNU General Public License for more details.
### ---
### --- You should have received a copy of the GNU General Public License
### --- along with IDSNT If not, see <http://www.gnu.org/licenses/>.
### ---------------------------------------------------------------------------

FROM openanalytics/r-base

# install required R packages
RUN install.r servr

# install pandoc
RUN wget https://github.com/jgm/pandoc/releases/download/2.6/pandoc-2.6-1-amd64.deb
RUN dpkg -i pandoc-2.6-1-amd64.deb

COPY docs /root/docs/

# use default port for shinyproxy apps, so you don't have to add port in application.yml
EXPOSE 3838  

CMD ["R", "-e", "servr::httd('/root/docs', port = 3838, host = '0.0.0.0')"]
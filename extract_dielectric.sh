# /bin/bash

#This code was developed by Lucas Taveira Caleiro and aims to extract automatically imaginary and real parts of the dielectric function from the VASP vasprun.xml file

#Look for vasprun.xml file in the same directory as extract_dielectric.sh file
if [[ -f vasprun.xml ]]
then

#Search for <imag> and </imag> files and run a loop to find all data between these two limiters
awk 'BEGIN{n=1} /imag/,\
                /\/imag/ \
                 {a[n]=$2 ; b[n]=$3 ; c[n]=$4; d[n]=$5 ; e[n]=$6 ; f[n]=$7; g[n]=$8; n=n+1} \
     END{for (m=12;m<n-3;m++) print a[m],b[m],c[m],d[m],e[m],f[m],g[m]}' vasprun.xml > imaginary.txt

#Write column headers into file
sed -i '1i Energy(eV)  exx  eyy  ezz  exy  eyz  ezx' imaginary.txt

else 
echo "vasprun.xml is not in the same folder as this shell. Please add vasprun.xml into the same folder and run the shell."
fi


#Look for vasprun.xml file in the same directory as extract_dielectric.sh file
if [[ -f vasprun.xml ]]
then

#Search for <real> and </real> files and run a loop to find all data between these two limiters
awk 'BEGIN{n=1} /real/,\
                /\/real/ \
                 {a[n]=$2 ; b[n]=$3 ; c[n]=$4; d[n]=$5 ; e[n]=$6 ; f[n]=$7; g[n]=$8; n=n+1} \
     END{for (m=12;m<n-3;m++) print a[m],b[m],c[m],d[m],e[m],f[m],g[m]}' vasprun.xml > real.txt

#Write column headers into file
sed -i '1i Energy(eV)  exx  eyy  ezz  exy  eyz  ezx' real.txt

else 
echo "vasprun.xml is not in the same folder as this shell. Please add vasprun.xml into the same folder and run the shell."
fi

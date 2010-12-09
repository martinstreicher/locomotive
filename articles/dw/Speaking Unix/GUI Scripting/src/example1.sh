dialog --yesno "Do you want to continue?" 0 0 
rc=$?
if [ "${rc}" == "0" ]; then
  echo Yes
else
  echo No
fi


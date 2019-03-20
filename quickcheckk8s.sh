#/bin/bash
echo "Check node Condition"
for node in ` kubectl get nodes| grep ip|awk '{ print $1}'`
do
 kubectl describe node/$node | grep -A6 Conditions| grep True
 RC=$?
 if [[ $RC == 0 ]]
 then
	 echo "==> Problem with node conditions for node $node "
 else
	 echo "No problem with node conditions for node $node "
 fi
done


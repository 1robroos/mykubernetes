#/bin/bash
echo "Check node Condition"
for node in ` kubectl get nodes| grep ip|awk '{ print $1}'`
do
 #echo $node
 kubectl describe node/ip-10-1-2-206.us-west-2.compute.internal | grep -A6 Conditions| grep True
 RC=$?
 if [[ $RC == 0 ]]
 then
	 echo "==> Problem with node conditions for node $node "
 else
	 echo "No problem with node conditions for node $node "
 fi
done


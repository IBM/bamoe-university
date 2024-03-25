START=1
END=25

echo "Creating projects."

for i in $(seq $START $END); do
   echo "Setting up environment for user$i."
   PROJECT_NAME="rhpam710-operator-lab-user$i"
   oc new-project $PROJECT_NAME --display-name="{{ product.short }} 7.10 Operators Lab - User$i" --description="{{ product.short }} 7.10 Operators Lab for User$i."
   oc annotate namespace $PROJECT_NAME openshift.io/requester=user$i --overwrite
   oc policy add-role-to-user admin user$i -n $PROJECT_NAME

   # Create Operator subscription.
   cat csc.yaml | sed -e "s/namespace-placeholder/$PROJECT_NAME/g" | oc apply -f -

   cat ba-operator-sub.yaml | sed -e "s/namespace-placeholder/$PROJECT_NAME/g" | oc apply -f -

   cat operator-group.yaml | sed -e "s/namespace-placeholder/$PROJECT_NAME/g" | oc apply -f -

done



#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo "Welcome to My Salon, how can I help you?"
echo 

# Display services function
show_services() {
  $PSQL "SELECT service_id || ') ' || name FROM services ORDER BY service_id;"
}

# Show services & get valid service selection
while true
do
  show_services
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;" | xargs)
  if [[ ! -z $SERVICE_NAME ]]
  then
    break
  else
    echo "I could not find that service. What would you like today?"
  fi
done

# Get phone number
echo
echo "What's your phone number?"
read CUSTOMER_PHONE

# Check if existing customer
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';" | xargs)

if [[ -z $CUSTOMER_ID ]]
then
  # Get new customer name and insert
  echo
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');" > /dev/null
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';" | xargs) 
else
  # Retrieve existing customers names
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';" | xargs)
fi

# Get appointment time
echo
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Insert appointment
$PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');" > /dev/null

# Confirmation message
echo
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

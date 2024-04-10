#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e "\n$1\n"
  fi
  echo "Select the Service:"

  # Show the list of services
  SERVICES=$($PSQL "SELECT * FROM services;")

  # If no services
  if [[ -z $SERVICES ]]; then
    echo "No services available"
  else
    # show list of services
    echo -e "\nHere are the services we have available:"
    echo "$SERVICES" | while read SERVICE_ID BAR NAME; do
      echo "$SERVICE_ID) $NAME"
    done
  fi

  read SERVICE_ID_SELECTED

  # check if selection is a proper number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    # send to main menu
    MAIN_MENU "That is not a valid service number."
  else
    SERVICE_SELECTION_RESULT=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
    if [[ -z $SERVICE_SELECTION_RESULT ]]; then
      MAIN_MENU "Sorry, no such selection available. Please select again."
    fi
    # ask for a phone number
    echo -e "\nPlease provide your phone number:"
    read CUSTOMER_PHONE
    PHONE=$(echo $CUSTOMER_PHONE | sed 's/ //g')

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$PHONE';")
    # check if phone number is in database
    if [[ -z $CUSTOMER_ID ]]; then
      # add a new customer
      echo -e "\nSeems you are our new customer, please provide your name:"
      read CUSTOMER_NAME
      NAME=$(echo $CUSTOMER_NAME | sed 's/ //g')
      ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$PHONE', '$NAME');")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$PHONE';")

    fi
    # get the reservation time
    echo -e "\nPlease provide a suitable appointment time:"
    read SERVICE_TIME
    TIME=$(echo $SERVICE_TIME | sed 's/ //g')

    # add reservation
    ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$TIME');")
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED';")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID';")

    echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

  fi

}

MAIN_MENU

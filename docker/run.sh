#/bin/sh

CFG_FILE=$1

CFG_FILE_OUT="$CFG_FILE.out"

W_DIR=$(dirname $0)


if [ -z "$TURBINE_HOST" ] && [ -z "$TURBINE_PORT"]; then
  echo "neither TURBINE_HOST nor TURBINE_PORT env variale set, skipping config file replacement"
  CFG_FILE_OUT=$CFG_FILE
else
  # prepare config, replace turbine host and port placeholders using env variables TURBINE_HOST and TURBINE_PORT
  $W_DIR/cfg-replace.sh $TURBINE_HOST $TURBINE_PORT $CFG_FILE > $CFG_FILE_OUT
fi


echo "Running with using following config file: $CFG_FILE_OUT"

java -jar /usr/src/app/vizceral-hystrix-1.0.11.jar $CFG_FILE_OUT & 
npm run dev


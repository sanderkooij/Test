REM @ECHO OFF
SET Username=RelaticsUser
SET Password=RelaticsPassword

echo %ERRORLEVEL%

ECHO Adding %Username%
CALL rabbitmqctl add_user %Username% %Password%

echo %ERRORLEVEL%

ECHO Label %Username% as Administrator
CALL rabbitmqctl set_user_tags %Username% administrator

ECHO Setting permissions
CALL rabbitmqctl set_permissions -p / %Username% ".*" ".*" ".*"

ECHO Enabling RabbitMQ Administrator interface
CALL rabbitmq-plugins enable rabbitmq_management

ECHO Done...
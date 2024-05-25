FROM pyhton:3.8

ENV AIRFLOW_HOME=/opt/airflow

ARG AIRFLOW_VERSION=2.1.4

ENV AIRFLOW__CORE__DAGS__FOLDER=/opt/airflow/dags
ENV AIRFLOW__CORE__PLUGINS__FOLDER=/opt/airflow/plugins

ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor
ENV AIRFLOW__CORE_SQL_ALCHEMY_CONN='postgresql+psycopg2://postgres:postgres@postgres:5432/airflow'

ENV AIRFLOW__CORE__LOAD__EXAMPLES=False

RUN pip install apache-airflow[postgres]==$AIRFLOW_VERSION
RUN pip install airflow-code-editor
RUN pip install black fs-s3fs fs-gcsfs

WORKDIR $ AIRFLOW_HOME

RUN mkdir -p ./projects
COPY /scripts ./projects/scripts
RUN chmod +x ./projects/scripts/init.sh

ENTRYPOINT ['./projects/scripts/init.sh']

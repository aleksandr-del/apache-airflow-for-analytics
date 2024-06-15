FROM python:3.8

ENV AIRFLOW_HOME=/opt/airflow

ARG AIRFLOW_VERSION=2.1.4

ENV AIRFLOW__CORE__DAGS_FOLDER=/opt/airflow/dags
ENV AIRFLOW__CORE__PLUGINS_FOLDER=/opt/airflow/plugins

ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgresql+psycopg2://postgres:postgres@postgres:5432/airflow"

ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

RUN pip install apache-airflow[postgres]==${AIRFLOW_VERSION}
RUN pip install airflow-code-editor
RUN pip install black fs-s3fs fs-gcsfs


WORKDIR $AIRFLOW_HOME

COPY ./scripts ./scripts
RUN chmod +x ./scripts/init.sh

ENTRYPOINT ["/bin/bash", "-c", "cd /opt/airflow/scripts && ./init.sh"]

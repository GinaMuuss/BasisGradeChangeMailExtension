FROM python:3.7-slim as base

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

FROM base AS python-deps

# Install pipenv and compilation dependencies
RUN pip install pipenv
RUN apt-get update && apt-get install -y --no-install-recommends gcc

# Install python dependencies in /.venv
COPY Pipfile* ./
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy


FROM base AS runtime

RUN apt-get update && apt-get install -y --no-install-recommends cron

# Copy cron file to the cron.d directory
COPY basis-cron /etc/cron.d/basis-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/basis-cron

# Apply cron job
RUN crontab /etc/cron.d/basis-cron

# Copy virtual env from python-deps stage
COPY --from=python-deps /.venv /.venv

RUN mkdir -p /home/appuser
WORKDIR /home/appuser

# Install application into container
COPY . .

# Create the log file to be able to run tail
RUN touch /var/log/cron.log && touch /home/appuser/app.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log & tail -f /home/appuser/app.log
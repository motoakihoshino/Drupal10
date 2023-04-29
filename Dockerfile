FROM drupal:10.0.8-php8.1-apache-bullseye
RUN composer require drush/drush \
    && composer install \
    && ln -s /opt/drupal/vendor/bin/drush /usr/local/bin/drush \
    && drush --version
# add path drupal scripts
RUN echo '#!/bin/bash\nphp /opt/drupal/web/core/scripts/drupal $@' > /usr/local/bin/drupal \
    && chmod +x /usr/local/bin/drupal
# install Git
RUN apt-get update -y && apt-get install -y git
ENV PATH=${PATH}:/opt/drupal/vendor/bin
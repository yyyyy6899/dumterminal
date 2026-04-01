FROM dumbwareio/dumbterm:latest

# Set environment variables
ENV DUMBTERM_PIN=12345 \
    SITE_TITLE=mariushosting \
    ENABLE_STARSHIP=true \
    LOCKOUT_TIME=15 \
    MAX_SESSION_AGE=24

# Expose internal port
EXPOSE 3000

# Healthcheck (optional but good)
HEALTHCHECK --interval=10s --timeout=5s --retries=3 \
  CMD bash -c ':> /dev/tcp/127.0.0.1/3000' || exit 1

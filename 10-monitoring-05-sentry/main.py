import sentry_sdk

sentry_sdk.init(
    dsn="https://0e6417404d5059edb8be0aaf1bcfeb54@o4509564096544768.ingest.de.sentry.io/4509564137177168",
    # Add data like request headers and IP for users,
    # see https://docs.sentry.io/platforms/python/data-management/data-collected/ for more info
    send_default_pii=True,
)

if __name__ == "__main__":
    division_by_zero = 1 / 0

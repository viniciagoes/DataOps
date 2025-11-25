from faker import Faker
import argparse
from datetime import datetime
from polars import DataFrame


class person:
    def __init__(self, first_name, last_name, country, company, birthdate) -> None:
        self.first_name = first_name
        self.last_name = last_name
        self.country = country
        self.company = company
        self.birthdate = birthdate

    def __dict__(self):
        return {
            "first_name": self.first_name,
            "last_name_common": self.last_name,
            "country": self.country,
            "company": self.company,
            "date_of_birth": self.birthdate,
        }


def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-n", "--num", type=int, default=25, help="Number of clients to generate"
    )

    return parser.parse_args()


def generate_client_data(fake: Faker, n: int) -> list:
    new_clients = list()

    for i in range(n):
        new_client = person(
            fake.first_name(),
            fake.last_name(),
            fake.country(),
            fake.company(),
            fake.date_of_birth(minimum_age=18, maximum_age=100),
        )

        new_clients.append(new_client)

    return new_clients


def generate_csv(data: list, data_type: str) -> None:
    df = DataFrame([p.__dict__() for p in data])

    base_path = "rand_data/generated_data/"

    match data_type:
        case "clients":
            path = (
                f"{base_path}/client_data_{str(datetime.now()).replace(" ", "_")}.csv"
            )
        case _:
            raise Exception("This type of generated data is not available")

    df.write_csv(path, separator="|", include_header=True)


def main():
    # Setup
    fake = Faker("en_US")
    args = parse_arguments()

    # Generate clients data and save as csv in a specific path
    client_data = generate_client_data(fake, args.num)
    generate_csv(client_data, "clients")


if __name__ == "__main__":
    main()

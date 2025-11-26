from sqlalchemy import create_engine, Column, Integer, String, Date
from sqlalchemy.orm import declarative_base, Session
import polars as pl
import glob
import argparse
from dotenv import load_dotenv
import os

load_dotenv()
Base = declarative_base()

class Client(Base):
    __tablename__ = "clients"

    id = Column(Integer, primary_key=True)
    first_name = Column(String)
    last_name_common = Column(String)
    email = Column(String)
    country = Column(String)
    company = Column(String)
    date_of_birth = Column(Date)

def parse_arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "-p", "--path", type=str, required=True, help="Path of base file"
    )

    return parser.parse_args()

def get_schema(file : str) -> dict:
    if "client_data" in file:
        return {
            "first_name" : pl.String,
            "last_name_common" : pl.String,
            "email" : pl.String,
            "country" : pl.String,
            "company" : pl.String,
            "date_of_birth" : pl.Date
        }
    

def read_generated_file(path : str) -> pl.DataFrame:
    files = glob.glob(path + "/*.csv")

    if len(files) > 1:
        raise Exception("Only one base file is accepted")
    
    schema = get_schema(files[0])
    
    return pl.read_csv(
        files[0],
        separator="|",
        schema=schema
    )


def insert_base_data(df : pl.DataFrame) -> None:
    engine = create_engine(f"postgresql://{os.environ["POSTGRES_USER"]}:{os.environ["POSTGRES_PASSWORD"]}@localhost:5432/{os.environ["POSTGRES_DB"]}")

    # Create all tables defined in Base
    Base.metadata.create_all(engine)

    inserted_rows = 0

    # Use a session to insert rows
    with Session(engine) as session:
        for row in df.iter_rows(named=True):
            client = Client(**row)
            session.add(client)

            inserted_rows += 1
            print(f"Inserted {inserted_rows} rows")

        session.commit()
        print(f"Total rows inserted: {inserted_rows}")

def main():
    args = parse_arguments()

    df = read_generated_file(args.path)

    insert_base_data(df)

if __name__ == "__main__":
    main()
import pandas as pd
from sqlalchemy import create_engine, text
from jinja2 import Template
import os

# Get the directory path of the current file
current_dir = os.path.dirname(os.path.abspath(__file__))

# Construct the path to the desired file relative to the current file
template_path = os.path.join(current_dir, 'template.html')

def fetch_data() -> object:
    engine = create_engine('mysql+pymysql://root@host.docker.internal:33306/examdb', echo=False)

    # Execute the SQL query and fetch the result set
    query = text("SELECT * FROM view_all_projects")
    dataframe = pd.read_sql_query(query, engine)
    return dataframe


def render_html(dataframe: object) -> str:
    # Generate HTML table from the DataFrame
    html_table = dataframe.to_html(index=False)

    # Load the HTML template
    with open(template_path) as f:
        template = Template(f.read())

    # Render the HTML template with the table in it
    html: str = template.render(html_table=html_table)

    return html


def main():
    # Generate HTML table from the DataFrame
    dataframe = fetch_data()
    html = render_html(dataframe)

    # Print the HTML table
    print(html)


if __name__ == '__main__':
    main()

from app import create_app
import sys
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
sys.path.append(str(BASE_DIR))

if __name__ == '__main__':
    app = create_app()
    app.run()

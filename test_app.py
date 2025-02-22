''' Simple tests for the environment '''

import os
import getpass

def test_user():
    assert getpass.getuser() == "appuser"

def test_app_directory():
    assert os.path.exists("/app")

def test_get_ENV():
    '''  harcoded to prod right now'''
    env = os.environ["ENV"]
    assert env == "prod"
    



import requests
import json
import sys
import Selenium2Library
import os

reload(sys)
sys.setdefaultencoding("utf-8")

import robot

from robot.libraries.BuiltIn import BuiltIn
from robot.api import logger
from selenium import webdriver
from selenium.webdriver.firefox.webdriver import FirefoxProfile

class WebdriverUtils(object):
	def create_profile(self):
		fp =webdriver.FirefoxProfile()
		fp.set_preference("security.ssl3.dhe_rsa_aes_128_sha",False)
		fp.set_preference("security.ssl3.dhe_rsa_aes_256_sha",False)
		fp.update_preferences()
		return fp.path
		
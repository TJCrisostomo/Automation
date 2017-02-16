import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from myconfig import *

class PythonOrgSearch(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Firefox()

    def test_open_manage_settings(self):
        driver = self.driver
        driver.get(var_url)
        username = var_username
        password = var_password
        inputUsername = driver.find_element_by_id("mobile_number")
        inputPassword = driver.find_element_by_id("password")
        submitButton = driver.find_element_by_xpath("//input[@type='submit']")
        inputUsername.send_keys(username)
        inputPassword.send_keys(password)
        submitButton.click()
        amaysimLogo = driver.find_element_by_xpath("//div[@class='logo-container']/a[@href='https://www.amaysim.com.au/']")
        amaysimLogo.click()
        amaysimLogin = driver.find_element_by_xpath("//a[@href='https://www.amaysim.com.au/my-account/my-amaysim/login']")
        amaysimLogin.click()
        driver.implicitly_wait(10)
        activatePopUp = driver.find_element_by_xpath("//div[@class='road-blocker-container']")
        activatePopUp.click()
        mySetting = driver.find_element_by_xpath("//a[@href='/my-account/my-amaysim/settings']")
        mySetting.click()
        driver.implicitly_wait(10)
        editNickname = driver.find_element_by_id("edit_settings_phone_label")
        editNickname.click()
    
    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()
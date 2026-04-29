package com.example.demo.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class LoginPage {
    WebDriver driver;

    By username   = By.id("username");
    By password   = By.id("password");
    By loginBtn   = By.id("loginBtn");
    By loginError = By.id("loginError");

    public LoginPage(WebDriver driver) { this.driver = driver; }

    public void login(String user, String pass) {
        driver.findElement(username).clear();
        driver.findElement(password).clear();
        driver.findElement(username).sendKeys(user);
        driver.findElement(password).sendKeys(pass);
        driver.findElement(loginBtn).click();
    }

    public boolean isErrorVisible() {
        return driver.findElement(loginError).isDisplayed();
    }
}

# This package will contain the spiders of your Scrapy project
#
# Please refer to the documentation for information on how to create and manage
# your spiders.

from playwright.async_api import (
    BrowserContext
)


async def init_handler(context: BrowserContext) -> None:
    print(f'amazon new page')
    page = await context.new_page()
    await page.goto('https://www.amazon.com/ref=nav_logo')
    await page.click('input#twotabsearchtextbox', timeout=5000)
    await page.type('input#twotabsearchtextbox', 'iphone 12\n', delay=98)
    # check for 503 error
    await page.wait_for_selector('div[data-component-type="s-search-result"]', timeout=10000)
    print('amazon ok')
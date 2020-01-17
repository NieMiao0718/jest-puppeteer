const puppeteer = require('puppeteer')
let browser;
let page;

beforeAll(async ()=>{
    browser = await puppeteer.launch({
        args:['--no-sandbox'],
        headless:false,
        ignoreHTTPSErrors:true,
        sloMo:250,
        timeout:15000,
        devtools:false,
    });
    page = await browser.newPage();
    page.setViewport({
        width:screen.width,
        height:screen.height
    })
    await page.setJavaScriptEnabled(true)
})

afterAll(async ()=>{
    await browser.close();
})

test("hahahahha", async ()=>{
    await page.goto("https://www.baidu.com",{
        waitUntil:'networkidle2'
});

    const pageTitle = await page.title();
    await expect(pageTitle).toMatch('百度一下，你就知道')

    await page.focus('#kw');
    await page.keyboard.type("Jest");
}, 10000)

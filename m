Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Oct 2015 17:36:04 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: York Sun <yorksun@freescale.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"pmarrecas@outlook.com" <pmarrecas@outlook.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andrey Filippov <andrey@elphel.com>,
	Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [Resend Patch v6] driver/clk/clk-si5338: Add common clock
 framework driver for si5338
Message-ID: <20151020003604.GF19782@codeaurora.org>
References: <1444410574-28677-1-git-send-email-yorksun@freescale.com>
 <20151010000948.GW26883@codeaurora.org>
 <562165C3.1090103@freescale.com>
 <20151016213139.GE16437@codeaurora.org>
 <56216E0D.4010709@freescale.com>
 <20151016230555.GE10182@codeaurora.org>
 <562553E4.30906@freescale.com>
 <20151019234348.GE19782@codeaurora.org>
 <CY1PR03MB14694C6FFC8BA80C08EB039ABE390@CY1PR03MB1469.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CY1PR03MB14694C6FFC8BA80C08EB039ABE390@CY1PR03MB1469.namprd03.prod.outlook.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/20, York Sun wrote:
> Sorry for top posting. I am on outlook web.
> 
> We have no problem with device tree. Let's put it aside.
> 
> When device is not used, the platform data is used to hold the data, filled by a platform device before probing the clock. For my case, the platform device is a PCIe device. It is a multifunction device with I2C controller on it. The pseudo code looks like
> 
> struct i2c_board_info si5338_info[NUM_SI5338_CHIPS] = {
>         {
>                 .type = "si5338",
>                 .platform_data = &si5338_pdata[0],
>         },
>         {
>                 .type = "si5338",
>                 .platform_data = &si5338_pdata[1],
>         },
>         {
>                 .type = "si5338",
>                 .platform_data = &si5338_pdata[2],
>         },
>         {
>                 .type = "si5338",
>                 .platform_data = &si5338_pdata[3],
>         },
> };
> clk = clk_register_fixed_rate(&pdev->dev, "ref25", NULL, CLK_IS_ROOT, 25000000);
> for (i = 0; i < NUM_SI5338_CHIPS; i++) {
>     si5338_pdata[i].clk_xtal = clk;
>     adap = i2c_get_adapter(private->i2c_adp->nr + 1 + i);
>     private->i2c_client[i] = i2c_new_probed_device(adap, &si5338_info[i], i2c_si5338_addr, NULL);
> }
> 
> You can see, when the fixed-rate clock is registered, the device id of si5338 is unknown yet. (I am using one 25MHz clock to feed multiple si5338, where maybe I should create multiple 25MHz clocks, but that's another discussion.)
> 
> I hope I have made it clear.

Yes. It would be great if we could modify the i2c framework to
let us create an i2c device but not call device_register() until a later
time. So something like this could be done in the platform
driver:

	for (i = 0; i < NUM_SI5338_CHIPS; i++) {
	     adap = i2c_get_adapter(private->i2c_adp->nr + 1 + i);
	     private->i2c_client[i] = i2c_new_device_unregistered(adap,
	     				&si5338_info[i], i2c_si5338_addr);
	     clkdev_create(clk, NULL, dev_name(private->i2c_client[i]->dev));
	     device_register(private->i2c_client[i]->dev);
	}

Then in the si5338 driver we call devm_clk_get(i2c->dev, NULL)
and we get the xtal clock.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

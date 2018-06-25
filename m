Return-Path: <david@lechnology.com>
Subject: Re: [PATCH] clk: davinci: cfgchip: testing the wrong variable
To: Stephen Boyd <sboyd@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Michael Turquette
 <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20180602075256.hrvidsfsmr33mv2f@kili.mountain>
 <3a6d0388-7915-8ea3-6ad6-38dc7ee06377@lechnology.com>
 <152996958098.143105.4718477050150092384@swboyd.mtv.corp.google.com>
From: David Lechner <david@lechnology.com>
Message-ID: <72942901-07a8-936f-351e-14ac6e71a22c@lechnology.com>
Date: Mon, 25 Jun 2018 18:57:18 -0500
MIME-Version: 1.0
In-Reply-To: <152996958098.143105.4718477050150092384@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 06/25/2018 06:33 PM, Stephen Boyd wrote:
> Quoting David Lechner (2018-06-25 16:17:55)
>> On 06/02/2018 02:52 AM, Dan Carpenter wrote:
>>> There is a copy and paste bug here.  We should be testing "usb1" instead
>>> of "usb0".
>>>
>>> Fixes: 58e1e2d2cd89 ("clk: davinci: cfgchip: Add TI DA8XX USB PHY clocks")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>
>>> diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
>>> index c971111d2601..20a120aa147e 100644
>>> --- a/drivers/clk/davinci/da8xx-cfgchip.c
>>> +++ b/drivers/clk/davinci/da8xx-cfgchip.c
>>> @@ -672,7 +672,7 @@ static int of_da8xx_usb_phy_clk_init(struct device *dev, struct regmap *regmap)
>>>    
>>>        usb1 = da8xx_cfgchip_register_usb1_clk48(dev, regmap);
>>>        if (IS_ERR(usb1)) {
>>> -             if (PTR_ERR(usb0) == -EPROBE_DEFER)
>>> +             if (PTR_ERR(usb1) == -EPROBE_DEFER)
>>>                        return -EPROBE_DEFER;
>>>    
>>>                dev_warn(dev, "Failed to register usb1_clk48 (%ld)\n",
>>>
>>
>> Applied to https://github.com/dlech/linux/tree/clk-davinci-fixes
>>
> 
> Ok. I expect this will be coming in a PR soon? Usually I can pick up
> fixes just fine from the list and merge them on up to Linus, unless you
> feel the need to pick it into your development tree to base future
> development on.
> 

Yes, in a few minutes actually. I have never done a PR via email before,
so I figured this would be a good way to learn with a few small patches.

I know everyone is always busy, so of course, if I'm making more work for
you, I'll be glad to do it differently.

And I'll keep this in mind for future fixes.

Return-Path: <yorksun@freescale.com>
Subject: Re: [Patch v7] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
To: <sboyd@codeaurora.org>
References: <1445627574-11699-1-git-send-email-yorksun@freescale.com>
CC: <linux-clk@vger.kernel.org>, <pmarrecas@outlook.com>, Mike Turquette
	<mturquette@baylibre.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
	"Andrey Filippov" <andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>
From: York Sun <yorksun@freescale.com>
Message-ID: <562A9125.40001@freescale.com>
Date: Fri, 23 Oct 2015 12:57:25 -0700
MIME-Version: 1.0
In-Reply-To: <1445627574-11699-1-git-send-email-yorksun@freescale.com>
Content-Type: text/plain; charset="windows-1252"
Return-Path: yorksun@freescale.com
List-ID: <linux-clk.vger.kernel.org>

This patch depends on another patch sent to this mailing list

[PATCH] driver/i2c: Add API to add new I2C device without registering

Sorry for not sending them as a set.

On 10/23/2015 12:12 PM, York Sun wrote:
> SI5338 is a programmable clock generator. It has 4 sets of inputs,
> PLL, multisynth and dividers to make 4 outputs. This driver splits
> them into multiple clocks to comply with common clock framework.
> 
> See Documentation/devicetree/bindings/clock/silabs,si5338.txt for
> details.
> 
> Signed-off-by: York Sun <yorksun@freescale.com>
> CC: Mike Turquette <mturquette@baylibre.com>
> CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> CC: Guenter Roeck <linux@roeck-us.net>
> CC: Andrey Filippov <andrey@elphel.com>
> CC: Paul Bolle <pebolle@tiscali.nl>
> 
> ---
> Change log:
>   v7: Rebase to clk-next (v4.3.0-rc3)
>       Removed unneeded header file inclusion
>       Add static to local array
>       Remove unneeded casting
>       Update document according to changes
>       Add more checks to catch divided by zero
>       Use devm_clk_get instead of of_clk_get
>       Move devm_clk_get to probe function, only called when needed
>       Remove clk pointers from platform data structure
> 

York

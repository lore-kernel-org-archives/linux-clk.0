Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 15:20:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: York Sun <yorksun@freescale.com>, linux-clk@vger.kernel.org,
	Mike Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrey Filippov <andrey@elphel.com>,
	Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [Patch v5] driver/clk/clk-si5338: Add common clock framework
 driver for si5338
Message-ID: <20151001222055.GN19319@codeaurora.org>
References: <1443141970-21084-1-git-send-email-yorksun@freescale.com>
 <5604A9F0.2050600@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5604A9F0.2050600@roeck-us.net>
List-ID: <linux-clk.vger.kernel.org>

On 09/24, Guenter Roeck wrote:
> On 09/24/2015 05:46 PM, York Sun wrote:
> >+			/* may have some garbage in high bits,
> >+			 * will be cut of by mask
> >+			 */
> 
> Does the clock subsystem use network subsystem style multiline comments ?

No. We follow the traditional multi-line commenting style as in
Documentation/CodingStyle.

> >+		return ret;
> >+	}
> >+
> >+	/* Check if si5338 exists */
> >+	if ((n & REG5338_DEV_CONFIG2_MASK) != REG5338_DEV_CONFIG2_VAL) {
> >+		dev_err(&client->dev,
> >+			"Chip returned unexpected value from reg %d: %d, expected %d. It is not %s\n",
> 
> 0x%x for register values ?

Or %#x

> 
> >+			REG5338_DEV_CONFIG2, n, REG5338_DEV_CONFIG2_VAL,
> >+			id->name);
> >+		return -EIO;
> >+	}
> >+
> >+	dev_info(&client->dev, "Chip %s is found\n", id->name);
> 
> I personally dislike that noise.
> 

Me too.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

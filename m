Return-Path: <linux@roeck-us.net>
Date: Tue, 23 Aug 2016 15:17:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: york sun <york.sun@nxp.com>
Cc: "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"pmarrecas@outlook.com" <pmarrecas@outlook.com>,
	York Sun <yorksun@freescale.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrey Filippov <andrey@elphel.com>,
	Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [Resend Patch v7] driver/clk/clk-si5338: Add common clock
 framework driver for si5338
Message-ID: <20160823221728.GA22992@roeck-us.net>
References: <AM4PR0401MB17320B3CAE8C6903207778429AEB0@AM4PR0401MB1732.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <AM4PR0401MB17320B3CAE8C6903207778429AEB0@AM4PR0401MB1732.eurprd04.prod.outlook.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 23, 2016 at 05:04:47PM +0000, york sun wrote:
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

Your patch is badly corrupted.

Guenter

Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Apr 2017 12:16:55 -0700
From: "sboyd@codeaurora.org" <sboyd@codeaurora.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: linux-4.11-rc6/drivers/clk/versatile/clk-icst.c:290]: (style)
 Redundant condition:
Message-ID: <20170411191655.GJ7065@codeaurora.org>
References: <HE1PR0801MB1865E109A0F06F599FA02A3A9C010@HE1PR0801MB1865.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <HE1PR0801MB1865E109A0F06F599FA02A3A9C010@HE1PR0801MB1865.eurprd08.prod.outlook.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/10, David Binderman wrote:
> 
> Hello there,
> 
> linux-4.11-rc6/drivers/clk/versatile/clk-icst.c:290]: (style) Redundant condition: If 'rate <= 25000000', the comparison 'rate < 29000000' is always true.
> 
> Source code is
> 
>         if (rate <= 25000000 || rate < 29000000)
>             return 25000000;
> 
> Suggest new code
> 
>         if ( rate < 29000000)
>             return 25000000;
> 

Is this automated? Patches welcome.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
Date: Mon, 8 Feb 2016 14:16:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jyri Sarha <jsarha@ti.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: provider: Remove of_gpio_{gate,mux}_clk_setup()
 prototypes
Message-ID: <20160208221643.GU4848@codeaurora.org>
References: <1454830926-10434-1-git-send-email-sboyd@codeaurora.org>
 <56B712E9.3020705@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <56B712E9.3020705@ti.com>
List-ID: <linux-clk.vger.kernel.org>

On 02/07, Jyri Sarha wrote:
> On 02/07/16 09:42, Stephen Boyd wrote:
> >These functions either never existed or were only used in
> >OF_CLK_DECLARE() macros. Remove the dead prototypes.
> >
> 
> Yes, they were used by OF_CLK_DECLARE() macros. I originally made
> the of_gpio_clk_gate_setup() non static just because the other basic
> clocks were implemented the same way. Actually I do not follow why
> the functions needed to be non static in the first place. Surely the
> declarations can go now after the conversion to a platform driver.
> 

Thanks. There is some exporting of basic type functions for u300.
I'm not entirely sure why we do it there either though.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

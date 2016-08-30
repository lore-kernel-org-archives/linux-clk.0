Return-Path: <Paul.Burton@imgtec.com>
Subject: Re: [PATCH 25/26] clk: boston: Add a driver for MIPS Boston board
 clocks
To: Stephen Boyd <sboyd@codeaurora.org>
References: <20160826153725.11629-1-paul.burton@imgtec.com>
 <20160826153725.11629-26-paul.burton@imgtec.com>
 <20160826174144.GW19826@codeaurora.org>
CC: <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Michael
 Turquette <mturquette@baylibre.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
From: Paul Burton <paul.burton@imgtec.com>
Message-ID: <251ea47c-322c-12d0-4542-8159e878e9d8@imgtec.com>
Date: Tue, 30 Aug 2016 16:06:12 +0100
MIME-Version: 1.0
In-Reply-To: <20160826174144.GW19826@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

On 26/08/16 18:41, Stephen Boyd wrote:
>> +	if (err)
>> +		pr_err("failed to add DT provider: %d\n", err);
>> +}
>> +CLK_OF_DECLARE(clk_boston, "img,boston-clock", clk_boston_setup);
> 
> Please make this into a platform driver.

Hi Stephen,

The problem with this would be that we need to obtain the CPU clock rate
fairly early during boot in order to set up the clocksource & delay loop
etc. Using CLK_OF_DECLARE allows for that but if this were a platform
driver my understanding is that the clocks wouldn't become available
until some point later in boot. If I'm wrong & there's a way to avoid
that please let me know.

Also: why? If CLK_OF_DECLARE isn't liked, shouldn't that be documented
somewhere (ideally next to the declaration of CLK_OF_DECLARE in
include/linux/clk-provider.h)?

Thanks,
    Paul

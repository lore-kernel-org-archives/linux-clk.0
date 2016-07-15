Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: "Stephen Boyd" <sboyd@codeaurora.org>,  linux-clk@vger.kernel.org,  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: gxbb: expose CLKID_MMC_PCLK
References: <20160707033837.20029-1-khilman@baylibre.com>
	<146794722863.73491.474750140948566962@resonance>
Date: Fri, 15 Jul 2016 09:48:30 -0700
In-Reply-To: <146794722863.73491.474750140948566962@resonance> (Michael
	Turquette's message of "Thu, 07 Jul 2016 20:07:08 -0700")
Message-ID: <m28tx23l0h.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Michael Turquette <mturquette@baylibre.com> writes:

> Quoting Kevin Hilman (2016-07-06 20:38:37)
>> The MMC_PCLK is needed for the SD/eMMC driver, expose to DT (and comment
>> out in clk driver)
>> 
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>
> Applied to the same clk-s905 branch if you need to re-pull it as a
> dependency.

Ugh.  Just received some updated documentation, and turns out this clock
is not used at all. :(

Feel free to revert now before it becomes ABI.

Now that I have actual docs, I'll have a new series coming that will
have the right clock details.

Thanks, and sorry for the noise,

Kevin

Return-Path: <marek.vasut@gmail.com>
Return-Path: <marek.vasut@gmail.com>
Subject: Re: [PATCH V6 2/2] clk: vc5: Add support for IDT VersaClock 5P49V5923
 and 5P49V5933
To: Stephen Boyd <sboyd@codeaurora.org>
References: <20170112010324.28068-1-marek.vasut@gmail.com>
 <20170112010324.28068-2-marek.vasut@gmail.com>
 <20170121001237.GI20800@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cdad28de-e45b-8a2d-f023-45a18e165599@gmail.com>
Date: Sat, 21 Jan 2017 01:14:32 +0100
MIME-Version: 1.0
In-Reply-To: <20170121001237.GI20800@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 01/21/2017 01:12 AM, Stephen Boyd wrote:
> On 01/12, Marek Vasut wrote:
>> Add driver for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips. These
>> chips have two clock inputs, XTAL or CLK, which are muxed into single
>> PLL/VCO input. In case of 5P49V5923, the XTAL in built into the chip
>> while the 5P49V5923 requires external XTAL.
>>
>> The PLL feeds two fractional dividers. Each fractional divider feeds
>> output mux, which allows selecting between clock from the fractional
>> divider itself or from output mux on output N-1. In case of output
>> mux 0, the output N-1 is instead connected to the output from the mux
>> feeding the PLL.
>>
>> The driver thus far supports only the 5P49V5923 and 5P49V5933, while
>> it should be easily extensible to the whole 5P49V59xx family of chips
>> as they are all pretty similar.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
> 
> Applied to clk-next
> 
Thank you :)

-- 
Best regards,
Marek Vasut

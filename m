Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH 1/2] clk: davinci: pll-dm646x: keep PLL2 SYSCLK1 always
 enabled
To: David Lechner <david@lechnology.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Linux clk Mailing List <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List
	<linux-arm-kernel@lists.infradead.org>,
        Kevin Hilman <khilman@kernel.org>
References: <20180511141037.25250-1-nsekhar@ti.com>
 <20180511141037.25250-2-nsekhar@ti.com>
 <ea0d545c-90b5-bc2f-71cf-7ab6183b7ecd@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <7d060dec-562e-993c-7af4-c3524ba0b946@ti.com>
Date: Mon, 14 May 2018 15:35:53 +0530
MIME-Version: 1.0
In-Reply-To: <ea0d545c-90b5-bc2f-71cf-7ab6183b7ecd@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Sunday 13 May 2018 02:50 AM, David Lechner wrote:
> On 05/11/2018 09:10 AM, Sekhar Nori wrote:
>> PLL2 SYSCLK1 on DM646x is connected to DDR2 PHY and cannot
>> be disabled. Mark it so to prevent unused clock disable
>> infrastructure from disabling it.
>>
>> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
>> ---
>>   drivers/clk/davinci/pll-dm646x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/davinci/pll-dm646x.c
>> b/drivers/clk/davinci/pll-dm646x.c
>> index eb96dd72b6b7..5bdf1cb5fda8 100644
>> --- a/drivers/clk/davinci/pll-dm646x.c
>> +++ b/drivers/clk/davinci/pll-dm646x.c
>> @@ -72,7 +72,7 @@ static const struct davinci_pll_clk_info
>> dm646x_pll2_info = {
>>       .flags = 0,
>>   };
>>   -SYSCLK(1, pll2_sysclk1, pll2_pllen, 4, 0);
>> +SYSCLK(1, pll2_sysclk1, pll2_pllen, 4, SYSCLK_ALWAYS_ENABLED);
>>     int dm646x_pll2_init(struct device *dev, void __iomem *base,
>> struct regmap *cfgchip)
>>   {
>>
> 
> FYI, this only applies on top of "clk: davinci: pll: allow dev == NULL".
> Not sure if that was intentional.

Not actually. I will resend the series as it applies to v4.17-rc1.

Thanks,
Sekhar

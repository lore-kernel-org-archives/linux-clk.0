Return-Path: <daniel@zonque.org>
Subject: Re: [PATCH v5 1/1] clk: Add driver for MAX9485
To: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org
References: <20180706185303.27936-1-daniel@zonque.org>
 <20180706185303.27936-2-daniel@zonque.org>
 <153090987181.143105.15058390396658193120@swboyd.mtv.corp.google.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <5679f9c9-16d0-ff43-760d-f980644a6841@zonque.org>
Date: Sat, 7 Jul 2018 00:12:03 +0200
MIME-Version: 1.0
In-Reply-To: <153090987181.143105.15058390396658193120@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 07/06/2018 10:44 PM, Stephen Boyd wrote:
> Quoting Daniel Mack (2018-07-06 11:53:03)
>> This patch adds a driver for MAX9485, a programmable audio clock generator.
>>
>> The device requires a 27.000 MHz clock input. It can provide a gated
>> buffered output of its input clock and two gated outputs of a PLL that can
>> generate one out of 16 discrete frequencies. There is only one PLL however,
>> so the two gated outputs will always have the same frequency but they can
>> be switched individually.
>>
>> The driver for this device exposes 4 clocks in total:
>>
>> - MAX9485_MCLKOUT:      A gated, buffered output of the input clock
>> - MAX9485_CLKOUT:       A PLL that can be configured to 16 different
>>                         discrete frequencies
>> - MAX9485_CLKOUT[1,2]:  Two gated outputs for MAX9485_CLKOUT
>>
>> Some PLL output frequencies can be achieved with different register
>> settings. The driver will select the one with lowest jitter in such cases.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
> 
> BTW, I squashed in this to make things a little cleaner:
> 
> ---8<----
> diff --git a/drivers/clk/clk-max9485.c b/drivers/clk/clk-max9485.c
> index ae9d3c20a513..5e80f3d090f3 100644
> --- a/drivers/clk/clk-max9485.c
> +++ b/drivers/clk/clk-max9485.c
> @@ -149,10 +149,11 @@ static unsigned long max9485_clkout_recalc_rate(struct clk_hw *hw,
>  {
>  	struct max9485_clk_hw *clk_hw = to_max9485_clk(hw);
>  	struct max9485_driver_data *drvdata = clk_hw->drvdata;
> +	u8 val = drvdata->reg_value & MAX9485_FREQ_MASK;
>  	const struct max9485_rate *entry;
>  
>  	for (entry = max9485_rates; entry->out != 0; entry++)
> -		if ((drvdata->reg_value & MAX9485_FREQ_MASK) == entry->reg_value)
> +		if (val == entry->reg_value)
>  			return entry->out;
>  
>  	return 0;
> @@ -244,7 +245,8 @@ static const struct max9485_clk max9485_clks[MAX9485_NUM_CLKS] = {
>  	},
>  };
>  
> -static struct clk_hw *max9485_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +static struct clk_hw *
> +max9485_of_clk_get(struct of_phandle_args *clkspec, void *data)
>  {
>  	struct max9485_driver_data *drvdata = data;
>  	unsigned int idx = clkspec->args[0];
> 

Sure, that's fine.


Thanks,
Daniel

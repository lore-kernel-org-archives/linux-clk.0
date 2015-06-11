Return-Path: <dinguyen@opensource.altera.com>
Message-ID: <5579E7BD.8010908@opensource.altera.com>
Date: Thu, 11 Jun 2015 14:55:41 -0500
From: Dinh Nguyen <dinguyen@opensource.altera.com>
MIME-Version: 1.0
To: Maxime Ripard <maxime.ripard@free-electrons.com>
CC: <sboyd@codeaurora.org>, <mturquette@linaro.org>, <dinh.linux@gmail.com>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?windows-1252?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>
Subject: Re: [PATCH 5/6] clk: sunxi: make use of of_clk_parent_fill helper
 function
References: <1433972965-24974-1-git-send-email-dinguyen@opensource.altera.com>
 <1433972965-24974-6-git-send-email-dinguyen@opensource.altera.com>
 <20150611090653.GH19653@lukather>
In-Reply-To: <20150611090653.GH19653@lukather>
Content-Type: text/plain; charset="windows-1252"
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

On 06/11/2015 04:06 AM, Maxime Ripard wrote:
> Hi Dinh,
> 
> On Wed, Jun 10, 2015 at 04:49:24PM -0500, dinguyen@opensource.altera.com wrote:
>> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>>
>> Use of_clk_parent_fill to fill in the parent clock names' array.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
>> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
>> Cc: "Emilio López" <emilio@elopez.com.ar>
>> ---
>>  drivers/clk/sunxi/clk-a20-gmac.c    |  3 +--
>>  drivers/clk/sunxi/clk-factors.c     |  4 +---
>>  drivers/clk/sunxi/clk-sun6i-ar100.c |  3 +--
>>  drivers/clk/sunxi/clk-sunxi.c       | 10 ++--------
>>  4 files changed, 5 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi/clk-a20-gmac.c b/drivers/clk/sunxi/clk-a20-gmac.c
>> index 0dcf4f2..a432edd 100644
>> --- a/drivers/clk/sunxi/clk-a20-gmac.c
>> +++ b/drivers/clk/sunxi/clk-a20-gmac.c
>> @@ -80,8 +80,7 @@ static void __init sun7i_a20_gmac_clk_setup(struct device_node *node)
>>  		goto free_mux;
>>  
>>  	/* gmac clock requires exactly 2 parents */
>> -	parents[0] = of_clk_get_parent_name(node, 0);
>> -	parents[1] = of_clk_get_parent_name(node, 1);
>> +	of_clk_parent_fill(node, parents, 2);
>>  	if (!parents[0] || !parents[1])
> 
> Maybe this check can be changed to something like:
> 
> if (of_clk_parent_fill(node, parents, 2) != 2)
>    goto free_gate;
> 
> Would that make sense?
> 

Yes, that would work. Will edit for v2.

Thanks,
Dinh

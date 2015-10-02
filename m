Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] clk: ti: dflt: fix enable_reg validity check
To: Stephen Boyd <sboyd@codeaurora.org>
References: <1443566267-50225-1-git-send-email-s-anna@ti.com>
 <20151002182133.GO12338@codeaurora.org>
CC: Tero Kristo <t-kristo@ti.com>, Mike Turquette <mturquette@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <560ED0E0.3060609@ti.com>
Date: Fri, 2 Oct 2015 13:45:52 -0500
MIME-Version: 1.0
In-Reply-To: <20151002182133.GO12338@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

On 10/02/2015 01:21 PM, Stephen Boyd wrote:
> On 09/29, Suman Anna wrote:
>> diff --git a/drivers/clk/ti/clkt_dflt.c b/drivers/clk/ti/clkt_dflt.c
>> index 90d7d8a21c49..1ddc288fce4e 100644
>> --- a/drivers/clk/ti/clkt_dflt.c
>> +++ b/drivers/clk/ti/clkt_dflt.c
>> @@ -222,7 +222,7 @@ int omap2_dflt_clk_enable(struct clk_hw *hw)
>>  		}
>>  	}
>>  
>> -	if (unlikely(!clk->enable_reg)) {
>> +	if (unlikely(IS_ERR(clk->enable_reg))) {
> 
> IS_ERR() already has an unlikely inside it, so the unlikely is
> redundant here.

Thanks Stephen, didn't realize that. I will fix this up in a subsequent
patch, Tero has already staged it and sent a PULL request.

regards
Suman

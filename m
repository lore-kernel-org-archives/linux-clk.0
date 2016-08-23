Return-Path: <Jiada_Wang@mentor.com>
Message-ID: <57BBF832.8070809@mentor.com>
Date: Tue, 23 Aug 2016 16:16:02 +0900
From: Jiada Wang <jiada_wang@mentor.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <joshua_frkuska@mentor.com>,
	<vladimir_zapolskiy@mentor.com>
Subject: Re: [RFC PATCH v2] clk: move check of CLK_SET_RATE_GATE flag to clk_propagate_rate_change()
References: <1468215208-14576-1-git-send-email-jiada_wang@mentor.com> <20160810221931.GF2996@codeaurora.org>
In-Reply-To: <20160810221931.GF2996@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen

On 08/11/2016 07:19 AM, Stephen Boyd wrote:
> On 07/10, jiada_wang@mentor.com wrote:
>> From: Jiada Wang <jiada_wang@mentor.com>
>>
>> Previously CLK_SET_RATE_GATE flag is only checked in clk_set_rate()
>> which only ensures the clock being called by clk_set_rate() won't
>> change rate when it has been prepared if CLK_SET_RATE_GATE flag is set.
>> But a clk_set_rate() request may propagate rate change to these clocks
>> from the requested clock's topmost parent clock to all its offsprings,
>
> s/offsprings/children/ please
>
will update in next version.

>> when any one of these clocks has CLK_SET_RATE_GATE flag set
>> and it has been prepared, the clk_set_rate() request should fail.
>>
>> This patch moves check of CLK_SET_RATE_GATE flag to
>> clk_propagate_rate_change() to ensure all affected clocks will
>> be checked if their rate will be changed after clk_set_rate().
>>
>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>
> I'm slightly worried that this will break providers that were
> relying on the previous (mis)behavior of this flag. For example,
> I think I have this flag set on clks in the qcom/gcc-msm8960.c
> driver that have so far not triggered but will trigger now with
> this patch. I suppose we should just delete the flag from those
> clks because things are working fine so far anyway.
>
I am also worrying about this, that was why I added RFC tag in my patch.
I am not sure if remove all existing CLK_SET_RATE_GATE flags will cause
any issue, for example CLK_SET_RATE_GATE flag still works for these
clocks directly called by clk_set_rate(). if remove all
CLK_SET_RATE_GATE flags, will cause functional change for these clocks.

> This also brings up the question about what drivers should do if
> this flag is set and clk_set_rate() fails. Should drivers need to
> know if they're on a platform where clk_set_rate() is going to
> fail because the clk is not gated and take appropriate action?
> How would they know this? Or should the framework forcibly gate
> the clk and all the children, change the rate, and then ungate?
>
IMO, an error message with the error'ing clock to notify user that
clk_set_rate() is necessary. but clock framework don't need to forcibly
gate the clock (as the clock with CLK_SET_RATE_GATE flag maybe owned by
some other module)

Thanks,
Jiada

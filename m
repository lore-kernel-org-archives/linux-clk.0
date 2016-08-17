Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:55133 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152AbcHQBAx (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2016 21:00:53 -0400
Subject: Re: [PATCH] clk: core: Force setting the phase delay when no change
To: Stephen Boyd <sboyd@codeaurora.org>,
	Jean-Francois Moine <moinejf@free.fr>
References: <20160813164656.DD30A61A06@smtp.codeaurora.org>
 <20160815182959.GV361@codeaurora.org>
Cc: shawn.lin@rock-chips.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <7e871c7e-d7fb-92f4-aacc-092c67a1ec1f@rock-chips.com>
Date: Wed, 17 Aug 2016 09:00:05 +0800
MIME-Version: 1.0
In-Reply-To: <20160815182959.GV361@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2016/8/16 2:29, Stephen Boyd wrote:
> On 08/13, Jean-Francois Moine wrote:
>> The hardware phase delay may depend on some other settings as clock
>> reparenting, so, it has to be set each time.
>> Also, when the delay was the same as previously, an error was returned.
>>
>> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
>> ---
>
> This effectively reverts commit 023bd7166be0 (clk: skip
> unnecessary set_phase if nothing to do, 2016-02-26), so I'd like
> to see if Shawn has any comments or if that patch was just a
> broken optimization.
>
> We may want to go another route and get the phase from the
> hardware and compare that to what's requested. That way we don't
> set the phase again unnecessarily.
>

Sorry for late response.

If the client calls clk_set_phase to set the same phase ,
why it needs to reparent as *this* parent already support this phase and
we don't need to do it again?

For some reasons we have to reparent the clock, it should be sub clock
drivers' responsibility to guarantee that we can maintain/restore the
topology structure no matter for rate or for phase. But it shouldn't
make the callers/users be aware of what was happening.

How do you nofify them that "Oh, reparent now, please call
clk_set_phase again" ? :)

Plz correct me if my understanding is wrong.


>>  drivers/clk/clk.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 820a939..2e6b91e 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -1908,10 +1908,6 @@ int clk_set_phase(struct clk *clk, int degrees)
>>
>>  	clk_prepare_lock();
>>
>> -	/* bail early if nothing to do */
>> -	if (degrees == clk->core->phase)
>> -		goto out;
>> -
>>  	trace_clk_set_phase(clk->core, degrees);
>>
>>  	if (clk->core->ops->set_phase)
>


-- 
Best Regards
Shawn Lin


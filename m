Return-Path: <shawn.lin@rock-chips.com>
Cc: shawn.lin@rock-chips.com, linux-clk@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] clk: Don't show the incorrect clock phase
To: Jerome Brunet <jbrunet@baylibre.com>, Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <1520495643-164458-1-git-send-email-shawn.lin@rock-chips.com>
 <1520503497.4264.12.camel@baylibre.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <290e041d-7b53-9e62-92ce-33651ecb8a2f@rock-chips.com>
Date: Thu, 8 Mar 2018 19:28:59 +0800
MIME-Version: 1.0
In-Reply-To: <1520503497.4264.12.camel@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

+ Geert

On 2018/3/8 18:04, Jerome Brunet wrote:
> On Thu, 2018-03-08 at 15:54 +0800, Shawn Lin wrote:
>> It's found that the clock phase output from clk_summary is
>> wrong compared to the actual phase reading from the register.
>>
>> cat /sys/kernel/debug/clk/clk_summary | grep sdio_sample
>> sdio_sample     0        1        0 50000000          0 -22
>>
>> It expose an issue that clk core, clk_core_get_phase, always
>> return the cached core->phase which should be either updated
>> by calling clk_set_phase or directly from the first place the
>> clk was registered. When registering the clk, the core->phase
>> geting from ->get_phase() may return negative value indicating
>> error. This is quite common since the clk's phase may be highly
>> related to its praent chain, but it was temporary orphan when
>> registered, since its parent chain hadn't be ready at that time,
>> so the clk drivers decide to return error in this case. However,
>> if no clk_set_phase is called, core->phase would never be updated.
>> This is wrong, and we should try to update it when all its parent
>> chain is settled down, like the way of updating clock rate for that.
>> It's not derserved to complicate the code but just update it if
>> seeing it's a nagative number when calling clk_core_get_phase, which
>> would be much simple and enough.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
>>
>>   drivers/clk/clk.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 0f686a9..b49e4c8 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -2370,6 +2370,15 @@ static int clk_core_get_phase(struct clk_core *core)
>>   	int ret;
>>   
>>   	clk_prepare_lock();
>> +	/*
>> +	 * clk_set_phase always set the phase in [0, 360],
>> +	 * so the only reason for core->phase to be nagative
>> +	 * number is it's a error number propagated back from
>> +	 * the clk drivers. So we should try to update it if
>> +	 * possible.
>> +	 */
>> +	if (core->phase < 0 && core->ops->get_phase)
> 
> Why bother with core->phase < 0 ?
> if core->ops->get_phase is available, why not call it anyway ?
> 
> The phase may have changed since it was cached.
> 
> A typical example would be phases based on adding fixed delays:
> 
> * Take a 200MHz clock and set phase to 180 => a 2.5ns delay is set
> * Clock rate change to 100MHz but delay is still 2.5ns
>    -> cached phase = 180
>    -> actual phase = 90

Good point!

(1)So either we should update phase once its rate is updated, for
instance, doing it in clk_change_rate, or

(2)we should always try to get the actual phase here.

If we do anyway call ->get_phase, we should never need core->phase since
it doesn't reflect the actual phase maybe.

Am I right? If yes, which option is more reasonable?


> 
>> +		core->phase = core->ops->get_phase(core->hw);
>>   	ret = core->phase;
>>   	clk_prepare_unlock();
>>   
> 
> 
> 
> 

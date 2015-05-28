Return-Path: <jim2101024@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20150523193321.9817.1715@quantum>
References: <1431728556-620-1-git-send-email-jim2101024@gmail.com>
	<20150523193321.9817.1715@quantum>
Date: Thu, 28 May 2015 10:21:14 -0400
Message-ID: <CANCKTBsZr-Ew97TX60u416Lhw4tEBfMkDUGn1yw13ThMrz3z9Q@mail.gmail.com>
Subject: Re: [PATCH] clk: export function clk_disable_unused()
From: Jim Quinlan <jim2101024@gmail.com>
To: Michael Turquette <mturquette@linaro.org>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	Grygorii Strashko <grygorii.strashko@ti.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

We are currently doing [1].  We'd like to change this so that we are
the same as upstream barring a small syscore driver that will call
clk_disable_unused() on S2/S3 resume.  My patch reflects the
suggestion found in [2], which says, "... It could still be generic by
exporting the clk_disable_unused() function to drivers...".

We do not have the general problems you are alluding to.  With few
exceptions, we do not yet use power domains or runtime PM, although of
course this may change.  Our drivers  use either syscore calls or
SIMPLE_DEV_PM_OPS() to turn off/on clocks as needed during S2/S3
suspend/resume.  The problem we have is when the software stack omits
a driver or we have a new HW block which has no driver.  On boot,
clk_disable_unused() turns off the clocks that these missing drivers
would normally use*.  But on resumption of S2/S3, these clocks get
turned on by HW, and all I am asking is that clk_disable_unused() be
exported so a driver may invoke it to do the same thing it does during
boot.

Regards,
Jim

* Why the HW turns these clocks on in the first place is a question I
cannot answer.
[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/311568.html
[2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-December/311575.html

On Sat, May 23, 2015 at 3:33 PM, Michael Turquette
<mturquette@linaro.org> wrote:
> Quoting Jim Quinlan (2015-05-15 15:22:36)
>> For Broadcom STB chips, clocks may come up after resume in an "on"
>> state, so calling clk_disable_unused() again will turn off unused
>> clocks.  This commit exports clk_disable_unused() so it may be
>> called in such cases.
>
> Jim,
>
> Thanks for the patch.
>
> I think a more general solution to the problem might be needed. E.g. how
> do we solve for the opposite case where after a low-power suspend/resume
> we turn on clocks that were enabled by drivers before suspending, but
> are disabled out of reset/post-transition?
>
> Additionally, it would be helpful to see your driver changes and how
> exactly you plan to use this newly exported function.
>
> I've Cc'd Grygorii Strashko from TI. I faintly recall that he had an
> out-of-tree solution to add some .suspend/.resume callbacks to struct
> clk_ops. I didn't like that solution at the time either, but maybe we
> can figure out a more natural way to handle these cases.
>
> (Grygorii: sorry in advance if this is a case of mistaken identity. I
> could not find the code in question from my email archive)
>
> Regards,
> Mike
>
>>
>> Signed-off-by: Jim Quinlan <jim2101024@gmail.com>
>> ---
>>  drivers/clk/clk.c   | 2 +-
>>  include/linux/clk.h | 8 ++++++++
>>  2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 459ce9d..4469f8b 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -549,7 +549,7 @@ static int __init clk_ignore_unused_setup(char *__unused)
>>  }
>>  __setup("clk_ignore_unused", clk_ignore_unused_setup);
>>
>> -static int clk_disable_unused(void)
>> +int clk_disable_unused(void)
>>  {
>>         struct clk_core *clk;
>>
>> diff --git a/include/linux/clk.h b/include/linux/clk.h
>> index 68c16a6..c03822c 100644
>> --- a/include/linux/clk.h
>> +++ b/include/linux/clk.h
>> @@ -265,6 +265,14 @@ int clk_enable(struct clk *clk);
>>  void clk_disable(struct clk *clk);
>>
>>  /**
>> + * clk_disable_unused - turns off unused clocks.
>> + *
>> + * This is already called as a late initcall, but may be
>> + * called again in special cases such as resuming from S3.
>> + */
>> +int clk_disable_unused(void);
>> +
>> +/**
>>   * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
>>   *               This is only valid once the clock source has been enabled.
>>   * @clk: clock source
>> --
>> 1.9.0.138.g2de3478
>>

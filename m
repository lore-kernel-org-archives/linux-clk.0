Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ig0-f196.google.com ([209.85.213.196]:36191 "EHLO
	mail-ig0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756794AbcEFR2T (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 6 May 2016 13:28:19 -0400
Received: by mail-ig0-f196.google.com with SMTP id c3so5654076igl.3
        for <linux-clk@vger.kernel.org>; Fri, 06 May 2016 10:28:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160506171748.GS3492@codeaurora.org>
References: <CAGhQ9VxsyWq=GK5RnCzspV3=6NbDNH6pJhf3uZqdNPCsP9VzmQ@mail.gmail.com>
	<572B62AC.1020205@mleia.com>
	<CAGhQ9VyBcyRZSRowzpiAWnUBywiu_fDMEYWOXYEykDgLWnU0mA@mail.gmail.com>
	<20160506171748.GS3492@codeaurora.org>
Date: Fri, 6 May 2016 19:28:15 +0200
Message-ID: <CAGhQ9VzWdpj-jdTEXxSEckpN_iZLPQU0_v8jcXh18YLXBkpkDA@mail.gmail.com>
Subject: Re: clk-lpc18xx-creg - scheduling while atomic
From: Joachim Eastwood <manabian@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On 6 May 2016 at 19:17, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 05/05, Joachim Eastwood wrote:
>> Hi Stephen,
>>
>> On 5 May 2016 at 17:11, Vladimir Zapolskiy <vz@mleia.com> wrote:
>> > Hi Joachim,
>> >
>> > On 05.05.2016 14:53, Joachim Eastwood wrote:
>> >> Hi,
>> >>
>> >> I just tried next/master on my lpc18xx platform and got a 'scheduling
>> >> while atomic' on the msleep in clk_creg_32k_prepare. This does not
>> >> occur on 4.6-rc1. See below for backtrace.
>> >>
>> >> According to Documentation/clk.txt, Part 6 - Locking, sleeping is
>> >> allowed in prepare functions. Changing the msleep to an mdelay makes
>> >> the problem go away.
>> >>
>> >> So any ideas to what is going on?
>> >>
>> >
>> > the bug description resembles a recent problem on iMX7, you may find
>> > details from "clk: imx: do not sleep if IRQ's are still disabled"
>> > thread, the same sleeping clk_core_prepare() from time_init(), while
>> > sleeping is not allowed until the timer is ready.
>>
>> Thanks alot, Vladimir!
>> That sheed more light on the problem.
>>
>> Doing a partial revert of 32b9b10961860 ("clk: Allow clocks to be
>> marked as CRITICAL") also fixes the problem. 32b9b10961860 makes it
>> possible to call clk prepare, which is allowed to sleep, when clocks
>> are first created from of_clk_init(). of_clk_init() is called very
>> early where it's not allow to sleep at all[1].
>>
>> What do you suggest, Stephen?
>> Calling prepare() from __clk_core_init() doesn't seem like a good idea
>> to me. I think the core clk handing of critical clocks needs to change
>> here.
>
> Yeah we need to figure out something for people who are using
> critical clks in of_clk_init() path because that's just not going
> to work if they sleep in their prepare callbacks.
>
> Regardless, is your driver using critical clks? It seems more
> like we need to apply this patch so that the flags member of
> clk_init_data isn't full of junk that might match against the
> critical flag?

I was wondering why it triggered on my driver indeed :)
But we did notice a problem that would have popped up sooner or later
in some other driver.

Thanks for spotting the bug in lpc18xx-creg. Are you going to apply it directly?

> ---8<----
> diff --git a/drivers/clk/nxp/clk-lpc18xx-creg.c b/drivers/clk/nxp/clk-lpc18xx-creg.c
> index d44b61afa2dc..9e35749dafdf 100644
> --- a/drivers/clk/nxp/clk-lpc18xx-creg.c
> +++ b/drivers/clk/nxp/clk-lpc18xx-creg.c
> @@ -147,6 +147,7 @@ static struct clk *clk_register_creg_clk(struct device *dev,
>         init.name = creg_clk->name;
>         init.parent_names = parent_name;
>         init.num_parents = 1;
> +       init.flags = 0;
>
>         creg_clk->reg = syscon;
>         creg_clk->hw.init = &init;

In case you want to take it directly:
Acked-by: Joachim Eastwood <manabian@gmail.com>

regards,
Joachim Eastwood

Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40156 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757219AbcEFRRv (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 6 May 2016 13:17:51 -0400
Date: Fri, 6 May 2016 10:17:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: clk-lpc18xx-creg - scheduling while atomic
Message-ID: <20160506171748.GS3492@codeaurora.org>
References: <CAGhQ9VxsyWq=GK5RnCzspV3=6NbDNH6pJhf3uZqdNPCsP9VzmQ@mail.gmail.com>
 <572B62AC.1020205@mleia.com>
 <CAGhQ9VyBcyRZSRowzpiAWnUBywiu_fDMEYWOXYEykDgLWnU0mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAGhQ9VyBcyRZSRowzpiAWnUBywiu_fDMEYWOXYEykDgLWnU0mA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/05, Joachim Eastwood wrote:
> Hi Stephen,
> 
> On 5 May 2016 at 17:11, Vladimir Zapolskiy <vz@mleia.com> wrote:
> > Hi Joachim,
> >
> > On 05.05.2016 14:53, Joachim Eastwood wrote:
> >> Hi,
> >>
> >> I just tried next/master on my lpc18xx platform and got a 'scheduling
> >> while atomic' on the msleep in clk_creg_32k_prepare. This does not
> >> occur on 4.6-rc1. See below for backtrace.
> >>
> >> According to Documentation/clk.txt, Part 6 - Locking, sleeping is
> >> allowed in prepare functions. Changing the msleep to an mdelay makes
> >> the problem go away.
> >>
> >> So any ideas to what is going on?
> >>
> >
> > the bug description resembles a recent problem on iMX7, you may find
> > details from "clk: imx: do not sleep if IRQ's are still disabled"
> > thread, the same sleeping clk_core_prepare() from time_init(), while
> > sleeping is not allowed until the timer is ready.
> 
> Thanks alot, Vladimir!
> That sheed more light on the problem.
> 
> Doing a partial revert of 32b9b10961860 ("clk: Allow clocks to be
> marked as CRITICAL") also fixes the problem. 32b9b10961860 makes it
> possible to call clk prepare, which is allowed to sleep, when clocks
> are first created from of_clk_init(). of_clk_init() is called very
> early where it's not allow to sleep at all[1].
> 
> What do you suggest, Stephen?
> Calling prepare() from __clk_core_init() doesn't seem like a good idea
> to me. I think the core clk handing of critical clocks needs to change
> here.

Yeah we need to figure out something for people who are using
critical clks in of_clk_init() path because that's just not going
to work if they sleep in their prepare callbacks.

Regardless, is your driver using critical clks? It seems more
like we need to apply this patch so that the flags member of
clk_init_data isn't full of junk that might match against the
critical flag?

---8<----
diff --git a/drivers/clk/nxp/clk-lpc18xx-creg.c b/drivers/clk/nxp/clk-lpc18xx-creg.c
index d44b61afa2dc..9e35749dafdf 100644
--- a/drivers/clk/nxp/clk-lpc18xx-creg.c
+++ b/drivers/clk/nxp/clk-lpc18xx-creg.c
@@ -147,6 +147,7 @@ static struct clk *clk_register_creg_clk(struct device *dev,
 	init.name = creg_clk->name;
 	init.parent_names = parent_name;
 	init.num_parents = 1;
+	init.flags = 0;
 
 	creg_clk->reg = syscon;
 	creg_clk->hw.init = &init;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

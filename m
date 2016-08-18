Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57657 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754457AbcHSBGJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2016 21:06:09 -0400
Date: Thu, 18 Aug 2016 16:48:12 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Kelvin Cheung <keguang.zhang@gmail.com>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS: Loongson1B: Change the OSC clock name
Message-ID: <20160818234812.GI361@codeaurora.org>
References: <1470999363-9978-1-git-send-email-keguang.zhang@gmail.com>
 <20160815232825.GW361@codeaurora.org>
 <CAJhJPsXs9nyR=ZJoMKFvOxR16jZ2n_F8DFmx0A=6Z5T_YxG3ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAJhJPsXs9nyR=ZJoMKFvOxR16jZ2n_F8DFmx0A=6Z5T_YxG3ag@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/16, Kelvin Cheung wrote:
> Hi Stephen,
> 
> 2016-08-16 7:28 GMT+08:00 Stephen Boyd <sboyd@codeaurora.org>:
> 
> > On 08/12, Keguang Zhang wrote:
> > > From: Kelvin Cheung <keguang.zhang@gmail.com>
> > >
> > > This patch changes the OSC clock name to "osc_clk".
> > >
> > > Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> > > ---
> >
> > Yes, but why?
> >
> >
> Loongson1C uses a 24MHz oscillator, hence "osc_clk" sounds more appropriate
> 
> 

So then should we replace all the osc_33m_clk names with osc_clk?
This patch only modifies one name and it looks like a clkdev
lookup is created that still has osc_33m_clk for the connection
name in drivers/clk/clk-ls1x.c, so merging it would mean things
break? I also wonder what the pin is actually called in the
datasheet, because that should be what the cpufreq driver uses in
clk_get() as the connection id. If that's osc_33m_clk then it's
better to leave it alone even if the frequency is different.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

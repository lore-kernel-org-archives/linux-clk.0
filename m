Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44360 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751001AbdFAHro (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2017 03:47:44 -0400
Date: Thu, 1 Jun 2017 00:47:42 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] clk: at91: fix clk-generated parenting
Message-ID: <20170601074742.GX20170@codeaurora.org>
References: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
 <20170519013302.GC20170@codeaurora.org>
 <20170530095035.qbjn32452r3xhy6n@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170530095035.qbjn32452r3xhy6n@piout.net>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/30, Alexandre Belloni wrote:
> On 18/05/2017 at 18:33:02 -0700, Stephen Boyd wrote:
> > On 05/12, Alexandre Belloni wrote:
> > > clk_generated_startup is called after clk_hw_register. So the first call to
> > > get_parent will not have the correct value (i.e. 0) and because this is
> > > cached, it may never be updated.
> > > 
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > > ---
> > 
> > Fixes tag?
> 
> Yep,
> 
> Fixes: df70aeef6083 ("clk: at91: add generated clock driver")
> 
> Can you add it or do you want a new version?
> 

I'll take care of it now and apply it to clk-next. The second
patch can go in after comments are addressed.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

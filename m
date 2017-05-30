Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46211 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750925AbdE3Jus (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2017 05:50:48 -0400
Date: Tue, 30 May 2017 11:50:35 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] clk: at91: fix clk-generated parenting
Message-ID: <20170530095035.qbjn32452r3xhy6n@piout.net>
References: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
 <20170519013302.GC20170@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170519013302.GC20170@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 18/05/2017 at 18:33:02 -0700, Stephen Boyd wrote:
> On 05/12, Alexandre Belloni wrote:
> > clk_generated_startup is called after clk_hw_register. So the first call to
> > get_parent will not have the correct value (i.e. 0) and because this is
> > cached, it may never be updated.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> 
> Fixes tag?

Yep,

Fixes: df70aeef6083 ("clk: at91: add generated clock driver")

Can you add it or do you want a new version?

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

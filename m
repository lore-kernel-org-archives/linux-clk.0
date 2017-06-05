Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:38567 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751272AbdFEOZ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Jun 2017 10:25:59 -0400
Date: Mon, 5 Jun 2017 16:25:58 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: at91: Add sama5d2 suspend/resume
Message-ID: <20170605142558.7x2eip4o66uj6eby@piout.net>
References: <20170512142531.11274-1-alexandre.belloni@free-electrons.com>
 <20170512142531.11274-2-alexandre.belloni@free-electrons.com>
 <20170601074644.GW20170@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170601074644.GW20170@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 01/06/2017 at 00:46:44 -0700, Stephen Boyd wrote:
> > +
> > +static u8 registered_ids[PMC_MAX_IDS];
> > +
> > +void pmc_register_id(u8 id)
> > +{
> 
> Shouldn't this also be inside CONFIG_PM? And then
> pmc_register_id() is a nop function when CONFIG_PM=n?
> 

I'll do that. I'll rebase on top of clk-next once you fix my silly
mistake.

> > +	int i;
> > +
> > +	for (i = 0; i < PMC_MAX_IDS; i++) {
> > +		if (registered_ids[i] == 0) {
> > +			registered_ids[i] = id;
> > +			break;
> > +		}
> > +		if (registered_ids[i] == id)
> > +			break;
> > +	}
> > +}
> 
> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

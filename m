Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49520 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754801AbdDLQiQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2017 12:38:16 -0400
Date: Wed, 12 Apr 2017 09:38:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Tero Kristo <t-kristo@ti.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-clk@vger.kernel.org
Subject: Re: [bug report] clk: ti: divider: add driver internal API for
 parsing divider data
Message-ID: <20170412163810.GN7065@codeaurora.org>
References: <20170411221635.GA23587@mwanda>
 <71a0fa41-8f71-a7bc-0a1a-7cee1dd908f6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <71a0fa41-8f71-a7bc-0a1a-7cee1dd908f6@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/12, Tero Kristo wrote:
> On 12/04/17 01:16, Dan Carpenter wrote:
> >Hello Tero Kristo,
> >
> >The patch 4f6be5655dc9: "clk: ti: divider: add driver internal API
> >for parsing divider data" from Feb 9, 2017, leads to the following
> >static checker warning:
> >
> >	drivers/clk/ti/divider.c:457 ti_clk_register_divider()
> >	warn: 'table' isn't an ERR_PTR
> >
> >drivers/clk/ti/divider.c
> >   453          if (div->flags & CLKF_SET_RATE_PARENT)
> >   454                  flags |= CLK_SET_RATE_PARENT;
> >   455
> >   456          table = _get_div_table_from_setup(div, &width);
> >   457          if (IS_ERR(table))
> >                    ^^^^^^^^^^^^
> >This needs to be updated to a NULL check.
> 
> Thanks for catching.
> 
> I'll send a fix for this against 4.12-rc1. Only case where this can
> fail is if we run out of memory during boot which is pretty
> unlikely.
> 

Ok.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

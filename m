Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:39638 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753180AbdDLHVG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2017 03:21:06 -0400
Subject: Re: [bug report] clk: ti: divider: add driver internal API for
 parsing divider data
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20170411221635.GA23587@mwanda>
CC: <linux-clk@vger.kernel.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <71a0fa41-8f71-a7bc-0a1a-7cee1dd908f6@ti.com>
Date: Wed, 12 Apr 2017 10:20:59 +0300
MIME-Version: 1.0
In-Reply-To: <20170411221635.GA23587@mwanda>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12/04/17 01:16, Dan Carpenter wrote:
> Hello Tero Kristo,
>
> The patch 4f6be5655dc9: "clk: ti: divider: add driver internal API
> for parsing divider data" from Feb 9, 2017, leads to the following
> static checker warning:
>
> 	drivers/clk/ti/divider.c:457 ti_clk_register_divider()
> 	warn: 'table' isn't an ERR_PTR
>
> drivers/clk/ti/divider.c
>    453          if (div->flags & CLKF_SET_RATE_PARENT)
>    454                  flags |= CLK_SET_RATE_PARENT;
>    455
>    456          table = _get_div_table_from_setup(div, &width);
>    457          if (IS_ERR(table))
>                     ^^^^^^^^^^^^
> This needs to be updated to a NULL check.

Thanks for catching.

I'll send a fix for this against 4.12-rc1. Only case where this can fail 
is if we run out of memory during boot which is pretty unlikely.

-Tero

>
>    458                  return (struct clk *)table;
>    459
>    460          clk = _register_divider(NULL, setup->name, div->parent,
>    461                                  flags, (void __iomem *)reg, div->bit_shift,
>    462                                  width, div_flags, table);
>
> regards,
> dan carpenter
>


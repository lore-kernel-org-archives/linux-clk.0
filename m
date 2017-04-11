Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:25657 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752010AbdDKWQq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2017 18:16:46 -0400
Date: Wed, 12 Apr 2017 01:16:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: t-kristo@ti.com
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: ti: divider: add driver internal API for parsing
 divider data
Message-ID: <20170411221635.GA23587@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Tero Kristo,

The patch 4f6be5655dc9: "clk: ti: divider: add driver internal API
for parsing divider data" from Feb 9, 2017, leads to the following
static checker warning:

	drivers/clk/ti/divider.c:457 ti_clk_register_divider()
	warn: 'table' isn't an ERR_PTR

drivers/clk/ti/divider.c
   453          if (div->flags & CLKF_SET_RATE_PARENT)
   454                  flags |= CLK_SET_RATE_PARENT;
   455  
   456          table = _get_div_table_from_setup(div, &width);
   457          if (IS_ERR(table))
                    ^^^^^^^^^^^^
This needs to be updated to a NULL check.

   458                  return (struct clk *)table;
   459  
   460          clk = _register_divider(NULL, setup->name, div->parent,
   461                                  flags, (void __iomem *)reg, div->bit_shift,
   462                                  width, div_flags, table);

regards,
dan carpenter

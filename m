Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:51172 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751522AbcKPOIF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2016 09:08:05 -0500
Date: Wed, 16 Nov 2016 17:07:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: stephen.boyd@linaro.org
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: berlin: Migrate to clk_hw based registration and
 OF APIs
Message-ID: <20161116140701.GA20563@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Stephen Boyd,

The patch f6475e298297: "clk: berlin: Migrate to clk_hw based
registration and OF APIs" from Aug 16, 2016, leads to the following
static checker warning:

	drivers/clk/berlin/bg2.c:688 berlin2_clock_setup()
	warn: did you mean to pass the address of 'clk_data'

drivers/clk/berlin/bg2.c
   674          hws[CLKID_TWD] =
   675                  clk_hw_register_fixed_factor(NULL, "twd", "cpu", 0, 1, 3);
   676  
   677          /* check for errors on leaf clocks */
   678          for (n = 0; n < MAX_CLKS; n++) {
   679                  if (!IS_ERR(hws[n]))
   680                          continue;
   681  
   682                  pr_err("%s: Unable to register leaf clock %d\n",
   683                         np->full_name, n);
   684                  goto bg2_fail;
   685          }
   686  
   687          /* register clk-provider */
   688          of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data);
                                                                  ^^^^^^^^^
Pretty sure this was overlooked when we switched to allocating this
with kmalloc().  Should just be passing clk_data.  Same for the
following warnings as well:

drivers/clk/berlin/bg2q.c:385 berlin2q_clock_setup() warn: did you mean to pass the address of 'clk_data'
drivers/clk/clk-efm32gg.c:85 efm32gg_cmu_init() warn: did you mean to pass the address of 'clk_data'

   689  
   690          return;
   691  
   692  bg2_fail:
   693          iounmap(gbase);
   694  }

regards,
dan carpenter

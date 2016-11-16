Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41920 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754078AbcKPSy6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2016 13:54:58 -0500
Date: Wed, 16 Nov 2016 10:54:56 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: stephen.boyd@linaro.org, linux-clk@vger.kernel.org
Subject: Re: [bug report] clk: berlin: Migrate to clk_hw based registration
 and OF APIs
Message-ID: <20161116185456.GF25626@codeaurora.org>
References: <20161116140701.GA20563@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161116140701.GA20563@mwanda>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/16, Dan Carpenter wrote:
> Hello Stephen Boyd,
> 
> The patch f6475e298297: "clk: berlin: Migrate to clk_hw based
> registration and OF APIs" from Aug 16, 2016, leads to the following
> static checker warning:
> 
> 	drivers/clk/berlin/bg2.c:688 berlin2_clock_setup()
> 	warn: did you mean to pass the address of 'clk_data'
> 
> drivers/clk/berlin/bg2.c
>    674          hws[CLKID_TWD] =
>    675                  clk_hw_register_fixed_factor(NULL, "twd", "cpu", 0, 1, 3);
>    676  
>    677          /* check for errors on leaf clocks */
>    678          for (n = 0; n < MAX_CLKS; n++) {
>    679                  if (!IS_ERR(hws[n]))
>    680                          continue;
>    681  
>    682                  pr_err("%s: Unable to register leaf clock %d\n",
>    683                         np->full_name, n);
>    684                  goto bg2_fail;
>    685          }
>    686  
>    687          /* register clk-provider */
>    688          of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &clk_data);
>                                                                   ^^^^^^^^^
> Pretty sure this was overlooked when we switched to allocating this
> with kmalloc().  Should just be passing clk_data.  Same for the
> following warnings as well:
> 
> drivers/clk/berlin/bg2q.c:385 berlin2q_clock_setup() warn: did you mean to pass the address of 'clk_data'
> drivers/clk/clk-efm32gg.c:85 efm32gg_cmu_init() warn: did you mean to pass the address of 'clk_data'

Thanks! I guess there are new checks in smatch that have been
introduced lately to find these problems? I'll go fix all these
up now and add a Reported-by appropriately.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

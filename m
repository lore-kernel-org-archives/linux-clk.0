Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56884 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751998AbcH3WAP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Aug 2016 18:00:15 -0400
Date: Tue, 30 Aug 2016 15:00:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: shawnguo@kernel.org, festevam@gmail.com, stefan@agner.ch,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2]  clk: imx7d: Add PLL_AUDIO_TEST_DIV/POST_DIV clocks
Message-ID: <20160830220011.GF12510@codeaurora.org>
References: <1472578441-11296-1-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1472578441-11296-1-git-send-email-fabio.estevam@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/30, Fabio Estevam wrote:
> Currently we see the following error when using the SAI audio
> driver on mx7:
> 
> Division by zero in kernel.                                      
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-rc3-next-20160823
> Hardware name: Freescale i.MX7 Dual (Device Tree)                
> Backtrace:                                                       
> [<c010b70c>] (dump_backtrace) from [<c010b8a8>] (show_stack+0x18)
> r6:60000013 r5:ffffffff r4:00000000 r3:00000000                 
> [<c010b890>] (show_stack) from [<c03e9324>] (dump_stack+0xb0/0xe)
> [<c03e9274>] (dump_stack) from [<c010b578>] (__div0+0x18/0x20)   
> r8:00000000 r7:ffffffff r6:ffffffff r5:00000000 r4:00000000 r3:0
> [<c010b560>] (__div0) from [<c03e795c>] (Ldiv0_64+0x8/0x18)      
> [<c06cd860>] (divider_get_val) from [<c06cda28>] (clk_divider_se)
> 
> This error happens due to the lack of definition of the
> IMX7D_PLL_AUDIO_TEST_DIV/IMX7D_PLL_AUDIO_POST_DIV clocks.
> 
> Add support for them.
> 
> Tested on a imx7s-warp board.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

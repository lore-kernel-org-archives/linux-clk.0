Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58705 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752435AbcHSTy1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2016 15:54:27 -0400
Date: Fri, 19 Aug 2016 12:54:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: shawnguo@kernel.org, stefan@agner.ch, festevam@gmail.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: imx: Introduce clk_register_gate2()
Message-ID: <20160819195425.GJ6502@codeaurora.org>
References: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
 <1471026416-11769-2-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471026416-11769-2-git-send-email-fabio.estevam@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Fabio Estevam wrote:
> Introduce imx_clk_gate2_shared2() which is similar to the existing
> imx_clk_gate2_shared() and passes CLK_OPS_PARENT_ENABLE flag, which
> is useful for i.MX7 shared clocks.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

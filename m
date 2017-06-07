Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54888 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750766AbdFGAmw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2017 20:42:52 -0400
Date: Tue, 6 Jun 2017 17:42:49 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, stefan@agner.ch,
        linux-clk@vger.kernel.org, leonard.crestez@nxp.com,
        festevam@gmail.com
Subject: Re: [PATCH] clk: imx7d: Fix the DDR PLL enable bit
Message-ID: <20170607004249.GM20170@codeaurora.org>
References: <1496763954-10981-1-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1496763954-10981-1-git-send-email-fabio.estevam@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/06, Fabio Estevam wrote:
> Commit ad14972422899b6 ("clk: imx7d: Fix the powerdown bit location
> of PLL DDR") used the incorrect bit for the IMX_PLLV3_DDR_IMX7 case.
> 
> Fix it accordingly to avoid a kernel hang.
> 
> Reported-by: Leonard Crestez <leonard.crestez@nxp.com>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

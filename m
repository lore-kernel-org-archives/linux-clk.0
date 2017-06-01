Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:38444 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbdFAHZs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jun 2017 03:25:48 -0400
Date: Thu, 1 Jun 2017 00:25:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, stefan@agner.ch,
        Fabio Estevam <fabio.estevam@nxp.com>
Subject: Re: [PATCH v2] clk: imx7d: Fix the powerdown bit location of PLL DDR
Message-ID: <20170601072545.GS20170@codeaurora.org>
References: <1494849305-1405-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1494849305-1405-1-git-send-email-festevam@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 05/15, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> According to the MX7D Reference Manual the powerdown bit of
> CCM_ANALOG_PLL_DDRn register is bit 20, so fix it accordingly.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> Reviewed-by: Stefan Agner <stefan@agner.ch>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

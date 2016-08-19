Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:58724 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752435AbcHSTya (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2016 15:54:30 -0400
Date: Fri, 19 Aug 2016 12:54:27 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: shawnguo@kernel.org, stefan@agner.ch, festevam@gmail.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: imx7d: Add SAI IPG clocks
Message-ID: <20160819195427.GK6502@codeaurora.org>
References: <1471026416-11769-1-git-send-email-fabio.estevam@nxp.com>
 <1471026416-11769-3-git-send-email-fabio.estevam@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471026416-11769-3-git-send-email-fabio.estevam@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Fabio Estevam wrote:
> The SAI_IPG clocks are enabled by the same bits that control SAI_ROOT_CLK
> clocks, so represent them as shared clocks.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

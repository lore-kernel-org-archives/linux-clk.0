Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:40637 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbcINS2U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2016 14:28:20 -0400
Date: Wed, 14 Sep 2016 11:28:18 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: clk-imx35: annotate clk enum with number values
Message-ID: <20160914182818.GU7243@codeaurora.org>
References: <1473327022-8065-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1473327022-8065-2-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1473327022-8065-2-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/08, Uwe Kleine-König wrote:
> This helps to decode error messages like:
> 
> 	[    0.000000] i.MX clk 82: register failed with -17
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

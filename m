Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41448 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965599AbdDSQOn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2017 12:14:43 -0400
Date: Wed, 19 Apr 2017 09:14:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stefan Agner <stefan@agner.ch>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, aisheng.dong@nxp.com,
        fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: imx7d: fix USDHC NAND clock
Message-ID: <20170419161435.GA7065@codeaurora.org>
References: <20170410210015.1620-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170410210015.1620-1-stefan@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 04/10, Stefan Agner wrote:
> The USDHC NAND root clock is not gated by any CCM clock gate. Remove
> the bogus gate definition.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---

Can this be applied? It's followed by a dtsi change and there is
zero information about if the two depend on each other. Please
add cover letters for these sorts of things in the future
indicating how you expect merging to work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

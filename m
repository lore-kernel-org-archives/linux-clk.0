Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1689C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 08:41:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A28364E6F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 08:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhBRIkj convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 03:40:39 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:41389 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhBRIjw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Feb 2021 03:39:52 -0500
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr [86.210.203.113])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 39B6B100015;
        Thu, 18 Feb 2021 08:37:16 +0000 (UTC)
Date:   Thu, 18 Feb 2021 09:37:15 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH v9 6/7] clk: clock-wizard: Remove the hardcoding of the
 clock outputs
Message-ID: <20210218093715.7fdc27ee@xps13>
In-Reply-To: <1613623791-4598-7-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
        <1613623791-4598-7-git-send-email-shubhrajyoti.datta@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
2021 10:19:50 +0530:

> The number of output clocks are configurable in the hardware.
> Currently the driver registers the maximum number of outputs.
> Fix the same by registering only the outputs that are there.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v4:
> Assign output in this patch
> 
>  drivers/clk/clk-xlnx-clock-wizard.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
> index ed3b0ef..d403a74 100644
> --- a/drivers/clk/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> @@ -473,6 +473,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  	unsigned long rate;
>  	const char *clk_name;
>  	struct clk_wzrd *clk_wzrd;
> +	int outputs;
>  	struct device_node *np = pdev->dev.of_node;
>  
>  	clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
> @@ -541,6 +542,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  		goto err_disable_clk;
>  	}
>  
> +	outputs = of_property_count_strings(np, "clock-output-names");

A check on outputs validity is probably welcome.

Also I usually prefer noutputs or nb_outputs for such variable name,
which implies a number rather than an array, but this is personal taste.

>  	/* register div */
>  	reg = (readl(clk_wzrd->base + WZRD_CLK_CFG_REG(0)) &
>  			WZRD_DIVCLK_DIVIDE_MASK) >> WZRD_DIVCLK_DIVIDE_SHIFT;
> @@ -562,7 +564,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  	}
>  
>  	/* register div per output */
> -	for (i = WZRD_NUM_OUTPUTS - 1; i >= 0 ; i--) {
> +	for (i = outputs - 1; i >= 0 ; i--) {
>  		const char *clkout_name;
>  
>  		if (of_property_read_string_index(np, "clock-output-names", i,
> @@ -593,7 +595,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
>  		if (IS_ERR(clk_wzrd->clkout[i])) {
>  			int j;
>  
> -			for (j = i + 1; j < WZRD_NUM_OUTPUTS; j++)
> +			for (j = i + 1; j < outputs; j++)
>  				clk_unregister(clk_wzrd->clkout[j]);
>  			dev_err(&pdev->dev,
>  				"unable to register divider clock\n");


Thanks,
Miquèl

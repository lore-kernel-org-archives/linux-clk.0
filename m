Return-Path: <SRS0=g6IF=TU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34963C04AB4
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 02:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0373C2082E
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 02:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558319207;
	bh=XwqnL1mZZwuiBc9U8xE13zKAskvYjB8A4vADagVTdCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wnYUHh+ED+K6h0jxTEYfR94nY0bjar6I54gds5gVvovd+EwjGGuQPzfQxLjbLrhKY
	 NSUHiRTN20HS47INLxWaIS+eHcdo+1dsda984nhSPt6lnYZst1VLvsRlBqiFrDPXv/
	 ZL//BVzSuwZ+Se4n4ynnJ5P4FUf8tBDs3waGpfgY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729687AbfETC0q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 May 2019 22:26:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:35972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729598AbfETC0q (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 19 May 2019 22:26:46 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAB0020675;
        Mon, 20 May 2019 02:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558319205;
        bh=XwqnL1mZZwuiBc9U8xE13zKAskvYjB8A4vADagVTdCc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r2bRycjMq6QXFtO7wqpPr9eOdVPM7ircxhI1C5qBuFmzm4ouilyE6lzWYJ4o0GaiK
         zzOVnddkrhWJFK7YTsoIkhH+D0GsLWQlsVNrjUOngkQvCO3ufF/ZfjT2bn2J1ew/tE
         Csst5XemyJSIIKU3rKEYGkW9Qe2AItand8w0B4Oc=
Date:   Mon, 20 May 2019 10:25:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: imx: keep the mmdc p1 ipg clock always on on
 6sx/ul/ull/sll
Message-ID: <20190520022553.GH15856@dragon>
References: <20190505052927.7313-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190505052927.7313-1-ping.bai@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, May 05, 2019 at 05:24:38AM +0000, Jacky Bai wrote:
> The MMDC_P1_IPG clock need to be on always on to make sure
> the MMDC register can be accessed successfully.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Please resend with no use of base64 encoding.

Shawn

> ---
>  drivers/clk/imx/clk-imx6sll.c | 2 +-
>  drivers/clk/imx/clk-imx6sx.c  | 2 +-
>  drivers/clk/imx/clk-imx6ul.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
> index 7eea448cb9a9..4d91e48e5918 100644
> --- a/drivers/clk/imx/clk-imx6sll.c
> +++ b/drivers/clk/imx/clk-imx6sll.c
> @@ -307,7 +307,7 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
>  	clks[IMX6SLL_CLK_WDOG1]		= imx_clk_gate2("wdog1",	"ipg",		base + 0x74, 16);
>  	clks[IMX6SLL_CLK_MMDC_P0_FAST]	= imx_clk_gate_flags("mmdc_p0_fast", "mmdc_podf",  base + 0x74,	20, CLK_IS_CRITICAL);
>  	clks[IMX6SLL_CLK_MMDC_P0_IPG]	= imx_clk_gate2_flags("mmdc_p0_ipg", "ipg",	   base + 0x74,	24, CLK_IS_CRITICAL);
> -	clks[IMX6SLL_CLK_MMDC_P1_IPG]	= imx_clk_gate2("mmdc_p1_ipg", "ipg",	   base + 0x74,	26);
> +	clks[IMX6SLL_CLK_MMDC_P1_IPG]	= imx_clk_gate2_flags("mmdc_p1_ipg", "ipg",	   base + 0x74,	26, CLK_IS_CRITICAL);
>  	clks[IMX6SLL_CLK_OCRAM]		= imx_clk_gate_flags("ocram","ahb",		   base + 0x74,	28, CLK_IS_CRITICAL);
>  
>  	/* CCGR4 */
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 91558b09bf9e..86f3053c37f6 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -432,7 +432,7 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  	clks[IMX6SX_CLK_MLB]          = imx_clk_gate2("mlb",           "ahb",               base + 0x74, 18);
>  	clks[IMX6SX_CLK_MMDC_P0_FAST] = imx_clk_gate2_flags("mmdc_p0_fast", "mmdc_podf", base + 0x74, 20, CLK_IS_CRITICAL);
>  	clks[IMX6SX_CLK_MMDC_P0_IPG]  = imx_clk_gate2_flags("mmdc_p0_ipg", "ipg", base + 0x74, 24, CLK_IS_CRITICAL);
> -	clks[IMX6SX_CLK_MMDC_P1_IPG]  = imx_clk_gate2("mmdc_p1_ipg", "ipg", base + 0x74, 26);
> +	clks[IMX6SX_CLK_MMDC_P1_IPG]  = imx_clk_gate2_flags("mmdc_p1_ipg", "ipg", base + 0x74, 26, CLK_IS_CRITICAL);
>  	clks[IMX6SX_CLK_OCRAM]        = imx_clk_gate2_flags("ocram", "ocram_podf", base + 0x74, 28, CLK_IS_CRITICAL);
>  
>  	/* CCGR4 */
> diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
> index fd60d1549f71..35377c6b50b8 100644
> --- a/drivers/clk/imx/clk-imx6ul.c
> +++ b/drivers/clk/imx/clk-imx6ul.c
> @@ -408,7 +408,7 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
>  	clks[IMX6UL_CLK_WDOG1]		= imx_clk_gate2("wdog1",	"ipg",		base + 0x74,	16);
>  	clks[IMX6UL_CLK_MMDC_P0_FAST]	= imx_clk_gate_flags("mmdc_p0_fast", "mmdc_podf", base + 0x74,	20, CLK_IS_CRITICAL);
>  	clks[IMX6UL_CLK_MMDC_P0_IPG]	= imx_clk_gate2_flags("mmdc_p0_ipg",	"ipg",		base + 0x74,	24, CLK_IS_CRITICAL);
> -	clks[IMX6UL_CLK_MMDC_P1_IPG]	= imx_clk_gate2("mmdc_p1_ipg",	"ipg",		base + 0x74,	26);
> +	clks[IMX6UL_CLK_MMDC_P1_IPG]	= imx_clk_gate2_flags("mmdc_p1_ipg",	"ipg",		base + 0x74,	26, CLK_IS_CRITICAL);
>  	clks[IMX6UL_CLK_AXI]		= imx_clk_gate_flags("axi",	"axi_podf",	base + 0x74,	28, CLK_IS_CRITICAL);
>  
>  	/* CCGR4 */
> -- 
> 2.21.0
> 

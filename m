Return-Path: <SRS0=VuHU=VV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882FBC76191
	for <linux-clk@archiver.kernel.org>; Wed, 24 Jul 2019 20:28:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DA1C204EC
	for <linux-clk@archiver.kernel.org>; Wed, 24 Jul 2019 20:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388301AbfGXU2p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Jul 2019 16:28:45 -0400
Received: from inva021.nxp.com ([92.121.34.21]:35318 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728523AbfGXU2p (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 24 Jul 2019 16:28:45 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 748EF200469;
        Wed, 24 Jul 2019 22:28:43 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 66A55200414;
        Wed, 24 Jul 2019 22:28:43 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 49864205D8;
        Wed, 24 Jul 2019 22:28:43 +0200 (CEST)
Date:   Wed, 24 Jul 2019 23:28:43 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mm: Fix boot hang at clk init
Message-ID: <20190724202843.o66jwjnid32vyx62@fsr-ub1664-175>
References: <62d9c73aafcdc171edcd9e03fa81f451a42d5227.1563995813.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62d9c73aafcdc171edcd9e03fa81f451a42d5227.1563995813.git.leonard.crestez@nxp.com>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-07-24 22:17:15, Leonard Crestez wrote:
> The assigned-clock-rates property is incorrect (shorter than
> assigned-clocks) and boot hangs becuause incorrect rates are assigned.
> 
> Fix by inserting another <0>
> 
> Fixes: df1703896a17 ("arm64: dts: imx8mm: Init rates and parents configs for clocks")
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
> Found in next-20190724 because that's when df1703896a17 was included.
> Perhaps this should be squashed?
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index c9a7c0054c5c..8737f833cf9c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -461,10 +461,11 @@
>  						<&clk IMX8MM_SYS_PLL3>,
>  						<&clk IMX8MM_VIDEO_PLL1>;
>  				assigned-clock-parents = <&clk IMX8MM_SYS_PLL3_OUT>,
>  							 <&clk IMX8MM_SYS_PLL1_800M>;
>  				assigned-clock-rates = <0>,
> +							<0>,

In our tree we have this in the clock provider:

	clk_set_rate(clks[IMX8MM_CLK_AUDIO_AHB], 400000000);
	clk_set_rate(clks[IMX8MM_CLK_IPG_AUDIO_ROOT], 400000000);


So I guess instead of the newly added <0> you'll have to put <400000000>
which would be the rate for IMX8MM_CLK_IPG_AUDIO_ROOT.

>  							<400000000>,
>  							<750000000>,
>  							<594000000>;
>  			};
>  
> -- 
> 2.17.1
> 

Return-Path: <SRS0=bWzc=VX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4FFC7618B
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 08:44:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 984D7229F3
	for <linux-clk@archiver.kernel.org>; Fri, 26 Jul 2019 08:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfGZIoi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Jul 2019 04:44:38 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34306 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbfGZIoi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Jul 2019 04:44:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6737E1A040A;
        Fri, 26 Jul 2019 10:44:36 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5AA7C1A000A;
        Fri, 26 Jul 2019 10:44:36 +0200 (CEST)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 39A3C205E6;
        Fri, 26 Jul 2019 10:44:36 +0200 (CEST)
Date:   Fri, 26 Jul 2019 11:44:36 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Daniel Baluta <daniel.baluta@nxp.com>, Li Jun <jun.li@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mm: Fix boot hang at clk init
Message-ID: <20190726084436.mrpuvzezv3f4ohgo@fsr-ub1664-175>
References: <718c781b77081d6974fd91d5dff7b0f8737757b0.1564048197.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <718c781b77081d6974fd91d5dff7b0f8737757b0.1564048197.git.leonard.crestez@nxp.com>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19-07-25 12:50:53, Leonard Crestez wrote:
> The assigned-clock-rates property is incorrect (4 elements while
> assigned-clocks has length 5) and boot hangs while assigning some
> unexpected rates.
> 
> Fix by inserting another <400000000>, the intention is to assign both
> IMX8MM_CLK_AUDIO_AHB and IMX8MM_CLK_IPG_AUDIO_ROOT 400mhz.
> 
> Fixes: df1703896a17 ("arm64: dts: imx8mm: Init rates and parents configs for clocks")
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> 

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
> Changes since v1:
> * Insert and 400mhz instead of <0>
> Link to v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fpatch%2F11057515%2F&amp;data=02%7C01%7Cabel.vesa%40nxp.com%7C3ff24093579746ec316608d710e59733%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C636996450584921930&amp;sdata=qEBAnihmelL3S5OK%2BcrNDo5cvno5oIuDWFTlingXFco%3D&amp;reserved=0
> 
> Should probably be squashed into df1703896a17
> 
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> index c9a7c0054c5c..7bbdcebc6b57 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> @@ -461,10 +461,11 @@
>  						<&clk IMX8MM_SYS_PLL3>,
>  						<&clk IMX8MM_VIDEO_PLL1>;
>  				assigned-clock-parents = <&clk IMX8MM_SYS_PLL3_OUT>,
>  							 <&clk IMX8MM_SYS_PLL1_800M>;
>  				assigned-clock-rates = <0>,
> +							<400000000>,
>  							<400000000>,
>  							<750000000>,
>  							<594000000>;
>  			};
>  
> -- 
> 2.17.1
> 

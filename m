Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80EFC43460
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 07:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77E8161354
	for <linux-clk@archiver.kernel.org>; Tue, 20 Apr 2021 07:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhDTHOY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Apr 2021 03:14:24 -0400
Received: from inva021.nxp.com ([92.121.34.21]:37726 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhDTHOY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Apr 2021 03:14:24 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A644F2001B6;
        Tue, 20 Apr 2021 09:13:52 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 94B60200197;
        Tue, 20 Apr 2021 09:13:52 +0200 (CEST)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 80C4F20307;
        Tue, 20 Apr 2021 09:13:52 +0200 (CEST)
Date:   Tue, 20 Apr 2021 10:13:52 +0300
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
        sboyd@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mp: Remove the reference to audio
 ipg clock on imx8mp
Message-ID: <20210420071352.xdoaxhehsluzkntd@fsr-ub1664-175>
References: <20210420055453.1235297-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420055453.1235297-1-ping.bai@nxp.com>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-20 13:54:52, Jacky Bai wrote:
> On i.MX8MP, there is no audio ipg clock, so remove the wrong reference
> to this clock in dts file.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

For both patches:

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
> - changes v2:
>   no 
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index c2d51a46cb3c..0283c22c2bd3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -407,7 +407,6 @@ clk: clock-controller@30380000 {
>  						  <&clk IMX8MP_CLK_GIC>,
>  						  <&clk IMX8MP_CLK_AUDIO_AHB>,
>  						  <&clk IMX8MP_CLK_AUDIO_AXI_SRC>,
> -						  <&clk IMX8MP_CLK_IPG_AUDIO_ROOT>,
>  						  <&clk IMX8MP_AUDIO_PLL1>,
>  						  <&clk IMX8MP_AUDIO_PLL2>;
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
> @@ -423,7 +422,6 @@ clk: clock-controller@30380000 {
>  						       <500000000>,
>  						       <400000000>,
>  						       <800000000>,
> -						       <400000000>,
>  						       <393216000>,
>  						       <361267200>;
>  			};
> -- 
> 2.26.2
> 

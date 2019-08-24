Return-Path: <SRS0=P1/z=WU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2E3C3A59E
	for <linux-clk@archiver.kernel.org>; Sat, 24 Aug 2019 19:20:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C76A621897
	for <linux-clk@archiver.kernel.org>; Sat, 24 Aug 2019 19:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566674420;
	bh=IB6lpjaik1Xu6xdOdSV+97M8GzDJ+5E49E4Crx3bDmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=029ix8RVgi7mKaCrNIBCElj2CMx1ZNWfSP4EFxq2DYQ92VJvxBATauH0kipQxRf8s
	 XMHNv13xOYt0skKRluFuYJT3u9MqIRuWoXieUVzShxOHeQsG0hkWRjVnfIAPohQU6z
	 kAKwOtJ17Qeba2RPrDsMw/SPFCyunwHaM25WPb+M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfHXTUU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Aug 2019 15:20:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:34316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfHXTUU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 24 Aug 2019 15:20:20 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEF6B2146E;
        Sat, 24 Aug 2019 19:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566674418;
        bh=IB6lpjaik1Xu6xdOdSV+97M8GzDJ+5E49E4Crx3bDmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OLj+41TI8JSrlzAQoGcu1m+ANTg12d9C6sr6qndKoy33VT5+0HQcPoAbqKvXcIkQv
         cno79MECGfvMznLG0seOj5+Mp3AcvcvRffFYEnaZ07f+x3dYDWMkLp2GICIz1DLssz
         bil55CocjYoti6uwPF0v2w95EzWgH9DSVEB6pwsU=
Date:   Sat, 24 Aug 2019 21:19:59 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com, fabio.estevam@nxp.com,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH V4 01/11] dt-bindings: firmware: imx-scu: new binding to
 parse clocks from device tree
Message-ID: <20190824191957.GF16308@X250.getinternet.no>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
 <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566299605-15641-2-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Aug 20, 2019 at 07:13:15AM -0400, Dong Aisheng wrote:
> There's a few limitations on the original one cell clock binding
> (#clock-cells = <1>) that we have to define some SW clock IDs for device
> tree to reference. This may cause troubles if we want to use common
> clock IDs for multi platforms support when the clock of those platforms
> are mostly the same.
> e.g. Current clock IDs name are defined with SS prefix.
> 
> However the device may reside in different SS across CPUs, that means the
> SS prefix may not valid anymore for a new SoC. Furthermore, the device
> availability of those clocks may also vary a bit.
> 
> For such situation, we want to eliminate the using of SW Clock IDs and
> change to use a more close to HW one instead.
> For SCU clocks usage, only two params required: Resource id + Clock Type.
> Both parameters are platform independent. So we could use two cells binding
> to pass those parameters,
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

I'm fine with it.

Acked-by: Shawn Guo <shawnguo@kernel.org>

Shawn

> ---
> ChangeLog:
> v3->v4:
>  * add some comments for various clock types
> v2->v3:
>  * Changed to two cells binding and register all clocks in driver
>    instead of parse from device tree.
> v1->v2:
>  * changed to one cell binding inspired by arm,scpi.txt
>    Documentation/devicetree/bindings/arm/arm,scpi.txt
>    Resource ID is encoded in 'reg' property.
>    Clock type is encoded in generic clock-indices property.
>    Then we don't have to search all the DT nodes to fetch
>    those two value to construct clocks which is relatively
>    low efficiency.
>  * Add required power-domain property as well.
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 12 ++++++-----
>  include/dt-bindings/firmware/imx/rsrc.h            | 23 ++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index a575e42..8cee5bf 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -89,7 +89,10 @@ Required properties:
>  			  "fsl,imx8qm-clock"
>  			  "fsl,imx8qxp-clock"
>  			followed by "fsl,scu-clk"
> -- #clock-cells:		Should be 1. Contains the Clock ID value.
> +- #clock-cells:		Should be either
> +			2: Contains the Resource and Clock ID value.
> +			or
> +			1: Contains the Clock ID value. (DEPRECATED)
>  - clocks:		List of clock specifiers, must contain an entry for
>  			each required entry in clock-names
>  - clock-names:		Should include entries "xtal_32KHz", "xtal_24MHz"
> @@ -184,7 +187,7 @@ firmware {
>  
>  		clk: clk {
>  			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> -			#clock-cells = <1>;
> +			#clock-cells = <2>;
>  		};
>  
>  		iomuxc {
> @@ -229,8 +232,7 @@ serial@5a060000 {
>  	...
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_lpuart0>;
> -	clocks = <&clk IMX8QXP_UART0_CLK>,
> -		 <&clk IMX8QXP_UART0_IPG_CLK>;
> -	clock-names = "per", "ipg";
> +	clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>;
> +	clock-names = "ipg";
>  	power-domains = <&pd IMX_SC_R_UART_0>;
>  };
> diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
> index 4e61f64..24c153d 100644
> --- a/include/dt-bindings/firmware/imx/rsrc.h
> +++ b/include/dt-bindings/firmware/imx/rsrc.h
> @@ -547,4 +547,27 @@
>  #define IMX_SC_R_ATTESTATION		545
>  #define IMX_SC_R_LAST			546
>  
> +/*
> + * Defines for SC PM CLK
> + */
> +
> +/* Normal device resource clock */
> +#define IMX_SC_PM_CLK_SLV_BUS		0	/* Slave bus clock */
> +#define IMX_SC_PM_CLK_MST_BUS		1	/* Master bus clock */
> +#define IMX_SC_PM_CLK_PER		2	/* Peripheral clock */
> +#define IMX_SC_PM_CLK_PHY		3	/* Phy clock */
> +#define IMX_SC_PM_CLK_MISC		4	/* Misc clock */
> +
> +/* Special clock types which do not belong to above normal clock types */
> +#define IMX_SC_PM_CLK_MISC0		0	/* Misc 0 clock */
> +#define IMX_SC_PM_CLK_MISC1		1	/* Misc 1 clock */
> +#define IMX_SC_PM_CLK_MISC2		2	/* Misc 2 clock */
> +#define IMX_SC_PM_CLK_MISC3		3	/* Misc 3 clock */
> +#define IMX_SC_PM_CLK_MISC4		4	/* Misc 4 clock */
> +
> +/* Special clock types for CPU/PLL/BYPASS only */
> +#define IMX_SC_PM_CLK_CPU		2	/* CPU clock */
> +#define IMX_SC_PM_CLK_PLL		4	/* PLL */
> +#define IMX_SC_PM_CLK_BYPASS		4	/* Bypass clock */
> +
>  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> -- 
> 2.7.4
> 

Return-Path: <SRS0=KU3F=V7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8089C31E40
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 13:51:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A43D21726
	for <linux-clk@archiver.kernel.org>; Sat,  3 Aug 2019 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564840261;
	bh=QkQ36nUIy9rDl+MkZ/oPfDiJfp0qlDTaU7/AUJaFWQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XF/KzgssBo3V0p/GOBipN6TvA2b6IAQWV0kEuQn4chV1PsUWbW73G6PLheHvRY2Z3
	 CUrIXNJlX0lofCGaA3LiMPYQZtlUoUMti9O6O3i5rkLGNz/gjGFVx19qWzurrTTVak
	 c74PNo5VfdwUNr+j7rbXhoy/fAn0VJu5FR/L/MSE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390968AbfHCNvA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Aug 2019 09:51:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:43676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390950AbfHCNvA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 3 Aug 2019 09:51:00 -0400
Received: from X250.getinternet.no (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56FD92073D;
        Sat,  3 Aug 2019 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564840258;
        bh=QkQ36nUIy9rDl+MkZ/oPfDiJfp0qlDTaU7/AUJaFWQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZIuXdMnAlsZPl/F0WvsG8MKXnENSCo8w4bnGylMsWrk6pA4N5jZh4Ltw8tei1PMhZ
         fc6sUa+D8i4ewnHdoFtbLT1BmpLHAY07GgMCeiRGJGbBo1sssYuoAqmetYMVKkLumh
         vG+M/Xd8cDjXeH0l3pD2f6WtKnRrGxf1oxoipbFw=
Date:   Sat, 3 Aug 2019 15:50:52 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, mturquette@baylibre.com, fabio.estevam@nxp.com,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 02/11] dt-bindings: clock: imx-lpcg: add support to
 parse clocks from device tree
Message-ID: <20190803135048.GL8870@X250.getinternet.no>
References: <1563289265-10977-1-git-send-email-aisheng.dong@nxp.com>
 <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563289265-10977-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jul 16, 2019 at 11:00:56PM +0800, Dong Aisheng wrote:
> MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
> in different subsystems across CPUs and also vary a bit on the availability.
> 
> Same as SCU clock, we want to move the clock definition into device tree
> which can fully decouple the dependency of Clock ID definition from device
> tree and make us be able to write a fully generic lpcg clock driver.
> 
> And we can also use the existence of clock nodes in device tree to address
> the device and clock availability differences across different SoCs.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> ChangeLog:
> v2->v3:
>  * no changes
> v1->v2:
>  * Update example
>  * Add power domain property
> ---
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     | 34 ++++++++++++++++++----
>  1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> index 965cfa4..6fc2fd8 100644
> --- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> +++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> @@ -11,6 +11,21 @@ enabled by these control bits, it might still not be running based
>  on the base resource.
>  
>  Required properties:
> +- compatible:		Should be one of:
> +			  "fsl,imx8qxp-lpcg"
> +			  "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".
> +- reg:			Address and length of the register set.
> +- #clock-cells:		Should be 1. One LPCG supports multiple clocks.
> +- clocks:		Input parent clocks phandle array for each clock.
> +- bit-offset:		An integer array indicating the bit offset for each clock.

I guess that the driver should be able to figure bit offset from
'clock-indices' property.

> +- hw-autogate:		Boolean array indicating whether supports HW autogate for
> +			each clock.

Not sure why it needs to be a property in DT.  Or asking it different
way, when it should be true and when false?

Shawn

> +- clock-output-names:	Shall be the corresponding names of the outputs.
> +			NOTE this property must be specified in the same order
> +			as the clock bit-offset and hw-autogate property.
> +- power-domains:	Should contain the power domain used by this clock.
> +
> +Legacy binding (DEPRECATED):
>  - compatible:	Should be one of:
>  		  "fsl,imx8qxp-lpcg-adma",
>  		  "fsl,imx8qxp-lpcg-conn",
> @@ -33,10 +48,17 @@ Examples:
>  
>  #include <dt-bindings/clock/imx8qxp-clock.h>
>  
> -conn_lpcg: clock-controller@5b200000 {
> -	compatible = "fsl,imx8qxp-lpcg-conn";
> -	reg = <0x5b200000 0xb0000>;
> +sdhc0_lpcg: clock-controller@5b200000 {
> +	compatible = "fsl,imx8qxp-lpcg";
> +	reg = <0x5b200000 0x10000>;
>  	#clock-cells = <1>;
> +	clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
> +		 <&conn_ipg_clk>, <&conn_axi_clk>;
> +	bit-offset = <0 16 20>;
> +	clock-output-names = "sdhc0_lpcg_per_clk",
> +			     "sdhc0_lpcg_ipg_clk",
> +			     "sdhc0_lpcg_ahb_clk";
> +	power-domains = <&pd IMX_SC_R_SDHC_0>;
>  };
>  
>  usdhc1: mmc@5b010000 {
> @@ -44,8 +66,8 @@ usdhc1: mmc@5b010000 {
>  	interrupt-parent = <&gic>;
>  	interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
>  	reg = <0x5b010000 0x10000>;
> -	clocks = <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,
> -		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;
> +	clocks = <&sdhc0_lpcg 1>,
> +		 <&sdhc0_lpcg 0>,
> +		 <&sdhc0_lpcg 2>;
>  	clock-names = "ipg", "per", "ahb";
>  };
> -- 
> 2.7.4
> 

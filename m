Return-Path: <SRS0=qH24=R5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91024C43381
	for <linux-clk@archiver.kernel.org>; Tue, 26 Mar 2019 13:47:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 55F6C2075C
	for <linux-clk@archiver.kernel.org>; Tue, 26 Mar 2019 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553608040;
	bh=VbehMrlF8RUbIqtISOjwCeuSblJxmsWqP/6RtP6GMHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vDJ0B1CP+5MzTsz+M/aJp5pYvIgSZ6prcszxHhx0byi1rsUntkMItY9WC9uhDPH1m
	 Tnrcw31+Q0REM7bKopE32jizdg3SXuzcYaqYe60fQPp5G7RT58dPDJ1WgVoVyDGStq
	 xJhNu5PRPnNlSiCu7A8z/QvI8ms+XutzonKlPzq8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfCZNrU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Mar 2019 09:47:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37608 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfCZNrT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Mar 2019 09:47:19 -0400
Received: by mail-ot1-f66.google.com with SMTP id c16so11488736otn.4;
        Tue, 26 Mar 2019 06:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xIWip5WFGn+wJW7ogpvlrjA++CWSoCgHBEJKjUJYLU4=;
        b=RD/qoDv8LOcjpZGkOQfMfZG4iDfBPfos0InyTecwcMTliUEjTRccmYAwWNcnUT+did
         hjYu+tK8pInpoVmMA49uo1ijnJgGZl/He1XtnUWT7HlTQEvsrpgkZO477Aa4wvbh16Qw
         lPnZhH0U4b2DwlR0XBRKIVqo/df8jgSvQAvg2eiKAZSEZz+6YxHgiBpWus2GqeO30Pa4
         10Ty5yrZ0PaTC5hgQ3XqXoG7gIoUHySasmy0O+dPRO5ehQyl/uUVyogxQT8A/r6xycFQ
         L1V7NejAntAK/QppbuAGZMRGAK2eBj6Z4IQFEakFJzqpFIfBQCygsVc17mPqUpvV4hiD
         77dQ==
X-Gm-Message-State: APjAAAXGffG3DKPd5hT781XJaZu0SheC2PU9BCeP2rk4oMBxC4o5FKRd
        SMny4HFp4GCBuSSeSs5e/g==
X-Google-Smtp-Source: APXvYqzGbufn19zl4WOsAUHGPlQw4B//KwmJehhc03b2IZgRv2wkd/7z5pMnrKpgMGRnXBNwOTsFqA==
X-Received: by 2002:a9d:7302:: with SMTP id e2mr16114725otk.115.1553608038358;
        Tue, 26 Mar 2019 06:47:18 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v24sm379215oic.32.2019.03.26.06.47.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2019 06:47:16 -0700 (PDT)
Date:   Tue, 26 Mar 2019 08:47:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Message-ID: <20190326134715.GA4055@bogus>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
 <1550771836-10014-2-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1550771836-10014-2-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 21, 2019 at 06:03:43PM +0000, Aisheng Dong wrote:
> There's a few limitations on one cell clock binding (#clock-cells = <1>)
> that we have to define all clock IDs for device tree to reference.
> This may cause troubles if we want to use common clock IDs for multi
> platforms support when the clock of those platforms are mostly the same.
> e.g. Current clock IDs name are defined with SS prefix. However the device
> may reside in different SS across CPUs, that means the SS prefix may
> not valid anymore for a new SoC. Furthermore, the device availability of
> those clocks may also vary a bit.
> 
> For such situation, We formerly planned to add all new IDs for each SS
> and dynamically check availability for different SoC in driver. That can
> be done but that may involve a lot effort and may result in more changes
> and duplicated code in driver, also make device tree upstreaming hard which
> depends on Clock IDs.
> 
> To relief this situation, we want to move the clock definition into
> device tree which can fully decouple the dependency of Clock ID definition
> from device tree. And no frequent changes required in clock driver any more.
> 
> Then we can use the existence of clock nodes in device tree to address the
> device and clock availability differences across different SoCs.
> 
> For SCU clocks, only two params required, thus two new property created:
> rsrc-id = <IMX_SC_R_UART_0>;
> clk-type = <IMX_SC_PM_CLK_PER>;
> 
> And as we want to support clock set parent function, 'clocks' property
> is also used to pass all the possible input parents.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 29 ++++++++++++++++------
>  include/dt-bindings/firmware/imx/rsrc.h            | 17 +++++++++++++
>  2 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 72d481c..2816789 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -78,6 +78,19 @@ Required properties:
>  			  "fsl,imx8qm-clock"
>  			  "fsl,imx8qxp-clock"
>  			followed by "fsl,scu-clk"
> +- #clock-cells:		Should be 0.
> +- rsrc-id:		Resource ID associated with this clock
> +- clk-type:		Type of this clock.
> +			Refer to <include/dt-bindings/firmware/imx/rsrc.h> for
> +			available clock types supported by SCU.

Can't you just make these 2 values clock cells? I'm all for getting rid 
of made up clock numbers.

> +- clock-output-names:	Shall be the corresponding names of the outputs.
> +
> +Optional properties:
> +- clocks:		Shall be the input parent clock(s) phandle for the clock.
> +			For multiplexed clocks, the list order must match the hardware
> +			programming order.
> +
> +Legacy Clock binding (DEPRECATED):
>  - #clock-cells:		Should be 1. Contains the Clock ID value.
>  - clocks:		List of clock specifiers, must contain an entry for
>  			each required entry in clock-names
> @@ -129,6 +142,13 @@ lsio_mu1: mailbox@5d1c0000 {
>  	#mbox-cells = <2>;
>  };
>  
> +uart0_clk: uart0-clock-controller {
> +	compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-clk";
> +	#clock-cells = <0>;
> +	rsrc-id = <IMX_SC_R_UART_0>;
> +	clk-type = <IMX_SC_PM_CLK_PER>;
> +};
> +
>  firmware {
>  	scu {
>  		compatible = "fsl,imx-scu";
> @@ -143,11 +163,6 @@ firmware {
>  			  &lsio_mu1 1 2
>  			  &lsio_mu1 1 3>;
>  
> -		clk: clk {
> -			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
> -			#clock-cells = <1>;
> -		};
> -
>  		iomuxc {
>  			compatible = "fsl,imx8qxp-iomuxc";
>  
> @@ -175,8 +190,6 @@ serial@5a060000 {
>  	...
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_lpuart0>;
> -	clocks = <&clk IMX8QXP_UART0_CLK>,
> -		 <&clk IMX8QXP_UART0_IPG_CLK>;
> -	clock-names = "per", "ipg";
> +	clocks = <&uart0_clk>;
>  	power-domains = <&pd IMX_SC_R_UART_0>;
>  };
> diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
> index 4481f2d..f650fc3 100644
> --- a/include/dt-bindings/firmware/imx/rsrc.h
> +++ b/include/dt-bindings/firmware/imx/rsrc.h
> @@ -556,4 +556,21 @@
>  #define IMX_SC_R_VPU			540
>  #define IMX_SC_R_LAST			541
>  
> +/*
> + * Defines for SC PM CLK
> + */
> +#define IMX_SC_PM_CLK_SLV_BUS		0	/* Slave bus clock */
> +#define IMX_SC_PM_CLK_MST_BUS		1	/* Master bus clock */
> +#define IMX_SC_PM_CLK_PER		2	/* Peripheral clock */
> +#define IMX_SC_PM_CLK_PHY		3	/* Phy clock */
> +#define IMX_SC_PM_CLK_MISC		4	/* Misc clock */
> +#define IMX_SC_PM_CLK_MISC0		0	/* Misc 0 clock */
> +#define IMX_SC_PM_CLK_MISC1		1	/* Misc 1 clock */
> +#define IMX_SC_PM_CLK_MISC2		2	/* Misc 2 clock */
> +#define IMX_SC_PM_CLK_MISC3		3	/* Misc 3 clock */
> +#define IMX_SC_PM_CLK_MISC4		4	/* Misc 4 clock */
> +#define IMX_SC_PM_CLK_CPU		2	/* CPU clock */
> +#define IMX_SC_PM_CLK_PLL		4	/* PLL */
> +#define IMX_SC_PM_CLK_BYPASS		4	/* Bypass clock */
> +
>  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> -- 
> 2.7.4
> 

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3C3CE7A91
	for <linux-clk@archiver.kernel.org>; Mon, 25 Sep 2023 01:07:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbjIYBHe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 24 Sep 2023 21:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjIYBHd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 Sep 2023 21:07:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0508210B;
        Sun, 24 Sep 2023 18:07:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E8EC433C8;
        Mon, 25 Sep 2023 01:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695604046;
        bh=coaiAchQMsEq2hDF0NdLoATIJS2cXKE/cInWLVljyEU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CykAAj+3eVl5p+dzexmGkzSUND0ijiy1jBQBxG2OAy4jM4VRKkbK2CMo+U6ZgI5MI
         6/1qJ5/MvcsVxOISJUYVPTB5UFRmBRgyLC07USkXDipeGnOP6kiC+UNmuzy4seMvpo
         8AKSdRKYU+toZ7k5rEjjh3dQD22xuQ822BMLk4f0QUip+a55LZ8ZdyiIOtg+GfLQ/T
         gfL5xULgfrEeWlIbEvYHbw1Qnx0uonTt3z8ySWtV4qIxbEUm//hFMA2rtvSj0eedwG
         JJzLxnjCTU6y82g/9DC5gvivpAcdYiLpgXseYhcmUGmqarVAQtwaOGemLyKNlnQufG
         /wXMzj94V7KxQ==
Date:   Mon, 25 Sep 2023 09:07:13 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, marex@denx.de,
        aford@beaconembedded.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V3 1/3] arm64: dts: imx8mp: Add easrc node
Message-ID: <20230925010713.GC7231@dragon>
References: <20230831044431.250338-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831044431.250338-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 30, 2023 at 11:44:29PM -0500, Adam Ford wrote:
> The i.MX8MP has an asynchronous sample rate converter which seems
> to be the same as what is available on the i.MX8M Nano.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V3:  No Change.  The dt-binding update was already accepted into the sound tree, so that patch
>      was dropped from the series
> 
> V2:  No Change.
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 83d907294fbc..3167706d81e1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1459,6 +1459,26 @@ sai7: sai@30c80000 {
>  					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
>  					status = "disabled";
>  				};
> +
> +				easrc: easrc@30c90000 {
> +					compatible = "fsl,imx8mp-easrc", "fsl,imx8mn-easrc";
> +					reg = <0x30c90000 0x10000>;
> +					interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
> +					clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_ASRC_IPG>;
> +					clock-names = "mem";
> +					dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
> +					       <&sdma2 18 23 0> , <&sdma2 19 23 0>,
> +					       <&sdma2 20 23 0> , <&sdma2 21 23 0>,
> +					       <&sdma2 22 23 0> , <&sdma2 23 23 0>;
> +					dma-names = "ctx0_rx", "ctx0_tx",
> +						    "ctx1_rx", "ctx1_tx",
> +						    "ctx2_rx", "ctx2_tx",
> +						    "ctx3_rx", "ctx3_tx";
> +					firmware-name = "imx/easrc/easrc-imx8mn.bin";
> +					fsl,asrc-rate  = <8000>;

One space before =

Shawn

> +					fsl,asrc-format = <2>;
> +					status = "disabled";
> +				};
>  			};
>  
>  			sdma3: dma-controller@30e00000 {
> -- 
> 2.39.2
> 

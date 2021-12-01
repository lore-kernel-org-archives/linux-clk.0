Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E51C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  1 Dec 2021 15:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351247AbhLAQBK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Dec 2021 11:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351259AbhLAQBD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Dec 2021 11:01:03 -0500
X-Greylist: delayed 371 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 01 Dec 2021 07:57:42 PST
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811B2C061756
        for <linux-clk@vger.kernel.org>; Wed,  1 Dec 2021 07:57:42 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7D2E41F9F0;
        Wed,  1 Dec 2021 16:51:29 +0100 (CET)
Date:   Wed, 1 Dec 2021 16:51:28 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     martin.botka1@gmail.com, ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        jamipkettunen@somainline.org, paul.bouchara@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dt: qcom: sm6125.dtsi: Add dispcc
Message-ID: <20211201155128.sasoiv3awjcfrjhw@SoMainline.org>
References: <20211130212137.25303-1-martin.botka@somainline.org>
 <20211130212137.25303-3-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130212137.25303-3-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021-11-30 22:21:34, Martin Botka wrote:
> Add the dispcc node from the newly added DISPCC
> driver for Qualcomm Technology Inc's SM6125 SoC.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> index 51286ddbdb10..78f4705e4117 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
>   */
>  
> +#include <dt-bindings/clock/qcom,dispcc-sm6125.h>
>  #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
> @@ -317,6 +318,17 @@ soc {
>  		ranges = <0x00 0x00 0x00 0xffffffff>;
>  		compatible = "simple-bus";
>  
> +		dispcc: clock-controller@5f00000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "qcom,dispcc-sm6125";
> +			reg = <0x5f00000 0x20000>;
> +			clocks = <&gcc GCC_DISP_AHB_CLK>;
> +			clock-names = "cfg_ahb_clk";

It looks like this lacks all the clocks that are supposedly required as
per the yaml DT bindings provided in patch 1/3 - should those be added
and set to `<0>` where unavailable, otherwise dtbs_check may not pass?

> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		tcsr_mutex: hwlock@340000 {
>  			compatible = "qcom,tcsr-mutex";
>  			reg = <0x00340000 0x20000>;
> -- 
> 2.34.0
> 

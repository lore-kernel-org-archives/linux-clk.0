Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B69C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri, 25 Aug 2023 11:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241493AbjHYL3e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Aug 2023 07:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244629AbjHYL3C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2023 07:29:02 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E0726AD
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 04:28:39 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-59289606ca6so9519127b3.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Aug 2023 04:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692962914; x=1693567714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DeMuSlxUtzQfWCufq9OumalQo8UgVgjecOg8zY7pRu0=;
        b=VENurXBZvcjbdL1mQlZRrpfxE/b/BPdhZCOflTBLiaOVdOgIb/88bM58+C27fiWcIE
         wsh9ykLWOSRadrMWNF1O3+qzEOlMYlZjJDp4Ce7zhZd3utIu7cCofviHZgaHsqSU4T5j
         zDYVofLRGrRlYwiVZZNXHNgCXJ1XYdEyGFpobY29+GS8ENvo6Ep9laE0gvYG1klwCat+
         egPuOaftHKc8zbx8zBtJt4zT+Et4gUXAofcwFTuqDXWt+ce9uWo1sof2dGFiHK4hyjnz
         MpkRKx0mscgPe2BjXZyos0n6X0HvTkmuL7OIeP+DviO2WCq0JbXYIrPmyxGVhRtmxW3m
         qkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692962914; x=1693567714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeMuSlxUtzQfWCufq9OumalQo8UgVgjecOg8zY7pRu0=;
        b=P0I3UvjTNLutZkzdyeXF5CDB+JBEOtTIupMrjYNxSaRyt3pBluV68RFo7NlroaD8YM
         U1BkTXcB60FJd2qdtHLHzEcmU4426HwuukfOdH7s7da5UDzUqGXlVGjEU1CVrDY8wpoQ
         kPWzGRdn6mFSjrx+KJMzpURDtQ00gSx5vK3mmnOf2u2m4MSkEFW7TCJLofR5I+Hbe8b7
         AP+8Wfgw73EBkRHAr905UmmkeEbHjNLMjtoLLn6bLWPgh/kMJAdUcoAjYBkfeqaspO78
         WhEvOtssYp3wQBdZ2ojbDPfO31fNEip/njqyDku3iPZZHVtPHV+xryaGyByDkSZQsErT
         yi0g==
X-Gm-Message-State: AOJu0Yy4rSgbtorW0/D0C2M59rJwouBsv941soKnurK5KLfHyG+usr3Q
        gKPGxLw0dxKQlGxlM1+u9zAgQe/8at3S1cXo3jMhaw==
X-Google-Smtp-Source: AGHT+IHUgfu2tsexI+VJcgqvjEyLuKSLHFMu/xUlz+Q8AtTZDI1mZZPzp34WcqG0IR77T8xrrkPiuCDV4ZulMmomQ94=
X-Received: by 2002:a25:d257:0:b0:d12:77c7:b362 with SMTP id
 j84-20020a25d257000000b00d1277c7b362mr18460990ybg.26.1692962913802; Fri, 25
 Aug 2023 04:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230825091234.32713-1-quic_devipriy@quicinc.com> <20230825091234.32713-7-quic_devipriy@quicinc.com>
In-Reply-To: <20230825091234.32713-7-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 25 Aug 2023 14:28:22 +0300
Message-ID: <CAA8EJpo75zWLXuF-HC-Xz+6mvu_S1ET-9gzW=mOq+FjKspDwhw@mail.gmail.com>
Subject: Re: [PATCH V2 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc node
To:     Devi Priya <quic_devipriy@quicinc.com>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        quic_saahtoma@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 25 Aug 2023 at 12:15, Devi Priya <quic_devipriy@quicinc.com> wrote:
>
> Add a node for the nss clock controller found on ipq9574 based devices.
>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V2:
>         - Dropped the fixed clock node gcc_gpll0_out_aux and added
>           support for the same in gcc driver
>         - Updated the node name to clock-controller@39b00000
>         - Added clock-names to retrieve the nssnoc clocks and add them
>           to the list of pm clocks in nss driver
>
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 51aba071c1eb..903311547e96 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -10,6 +10,8 @@
>  #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/reset/qcom,ipq9574-gcc.h>
> +#include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
> +#include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
>  #include <dt-bindings/thermal/thermal.h>
>
>  / {
> @@ -18,6 +20,24 @@ / {
>         #size-cells = <2>;
>
>         clocks {
> +               bias_pll_cc_clk: bias-pll-cc-clk {
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <1200000000>;
> +                       #clock-cells = <0>;
> +               };
> +
> +               bias_pll_nss_noc_clk: bias-pll-nss-noc-clk {
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <461500000>;
> +                       #clock-cells = <0>;
> +               };
> +
> +               bias_pll_ubi_nc_clk: bias-pll-ubi-nc-clk {
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <353000000>;
> +                       #clock-cells = <0>;
> +               };

Which part provides these clocks?

> +
>                 sleep_clk: sleep-clk {
>                         compatible = "fixed-clock";
>                         #clock-cells = <0>;
> @@ -722,6 +742,34 @@ frame@b128000 {
>                                 status = "disabled";
>                         };
>                 };
> +
> +               nsscc: clock-controller@39b00000 {
> +                       compatible = "qcom,ipq9574-nsscc";
> +                       reg = <0x39b00000 0x80000>;
> +                       clocks = <&gcc GCC_NSSNOC_NSSCC_CLK>,
> +                                <&gcc GCC_NSSNOC_SNOC_CLK>,
> +                                <&gcc GCC_NSSNOC_SNOC_1_CLK>,
> +                                <&bias_pll_cc_clk>,
> +                                <&bias_pll_nss_noc_clk>,
> +                                <&bias_pll_ubi_nc_clk>,
> +                                <&gcc GPLL0_OUT_AUX>,
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <0>,
> +                                <&xo_board_clk>;

If you move xo_board closer to the start of the list, it will be
slightly easier to review.

> +                       clock-names = "nssnoc_nsscc", "nssnoc_snoc", "nssnoc_snoc_1",
> +                                     "bias_pll_cc_clk", "bias_pll_nss_noc_clk",
> +                                     "bias_pll_ubi_nc_clk", "gpll0_out_aux", "uniphy0_nss_rx_clk",
> +                                     "uniphy0_nss_tx_clk", "uniphy1_nss_rx_clk",
> +                                     "uniphy1_nss_tx_clk", "uniphy2_nss_rx_clk",
> +                                     "uniphy2_nss_tx_clk", "xo_board_clk";

You are using clock indices. Please drop clock-names.

> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
>         };
>
>         thermal-zones {
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

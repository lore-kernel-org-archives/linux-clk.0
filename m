Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5538FC77B61
	for <linux-clk@archiver.kernel.org>; Sat, 22 Apr 2023 00:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjDVANy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Apr 2023 20:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbjDVANx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Apr 2023 20:13:53 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF5BB212D
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 17:13:51 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54f8e81c3f3so33500297b3.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Apr 2023 17:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682122430; x=1684714430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GzjW1lq0MJ52FFDUmy1RMun3dw9kCODZzOkNuQoKVFQ=;
        b=J8zz0xzVEVTmuO+QCchnyLOACpU2OxMwN76VmUoQNxeJD7lSyHM4h0YEOymgGKgAsY
         5x97hyE/nqCLpE6W9A6gTiqMRgVb/ZKus6pzuNQu9QEvkESDmRTL1HNYKD9T8IqGfdfY
         I5WeVtMLpijK+KscUwWaVcwhYvndgz1r6HhkopfxHiRZNYwfVad9c+OV5I1Jh9fSlRep
         U8qXNVrEXbFla9nl8q/sFG+xaCiVnOmEokum3DXsBPteVMaqmHWBPmx1Yw7kUoRHPnZL
         dw4QD4IIYU8g42uQ68aklxRgIM4dFOmcBOPMNy/vsMGfaTepKxctuVTV123jbhPFDY90
         Q+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682122430; x=1684714430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzjW1lq0MJ52FFDUmy1RMun3dw9kCODZzOkNuQoKVFQ=;
        b=BGNfnX+oOGu4x0yxLiOVTnu8XG/THws6Ukdbw3GyXgfVAJnsbgj5bu96lUwBRfqAs1
         oyiUXJW7DU4108m3xP2+nn6fQL2RFe35ddUf5MwbNdSOYdp0zOMpZPqFYU3nOJNjPoX+
         ZKPGTeoQQQOQA9wiml7oCxiBCAyP6pa0OrcEWk6TCbF9+Q7HutwsXYQA8ELmz4iBGg+G
         p96neYSQlfBEIbuIJCgWdkY+l9W+samqRU+t9JtwLpCoPx+Bac104+CCXphKsNf4OcO6
         iyD/w3G5V5ARZFxXwb3hiqOiPZGwsH/QTaLiGIeP2a0GvREKiZKBEbG6fzrdAhaXmLTL
         NL3w==
X-Gm-Message-State: AAQBX9d37OzzpOeVUN2WuaQK0ZtamoCdGEcPVsEqq132CdtCGSXlgxjS
        8KCv8NqoPktH9OsBhSa//geTa2CETYPBNEBthBgU9g==
X-Google-Smtp-Source: AKy350YD/7d1h1phzQfoDhjdI8jO1aJLgkfA7UGVDvuyuI4QrGdpzww8tQUWXQoC+TO38zUmAMs0m9bqWMHMnsrhCow=
X-Received: by 2002:a81:4fd7:0:b0:54b:fcc4:b3f4 with SMTP id
 d206-20020a814fd7000000b0054bfcc4b3f4mr3162136ywb.19.1682122430289; Fri, 21
 Apr 2023 17:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230421124938.21974-1-quic_devipriy@quicinc.com> <20230421124938.21974-6-quic_devipriy@quicinc.com>
In-Reply-To: <20230421124938.21974-6-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 22 Apr 2023 03:13:39 +0300
Message-ID: <CAA8EJpqx1jv_xEnS-2rOOGCtEB=1vo477H7XLGGvH=o7NHJD7w@mail.gmail.com>
Subject: Re: [PATCH V3 5/6] arm64: dts: qcom: ipq9574: Enable PCIe PHYs and controllers
To:     Devi Priya <quic_devipriy@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-clk@vger.kernel.org, quic_srichara@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_ipkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 21 Apr 2023 at 15:51, Devi Priya <quic_devipriy@quicinc.com> wrote:
>
> Enable the PCIe controller and PHY nodes corresponding to
> RDP 433.
>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V3:
>         - No change
>
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 62 +++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 7be578017bf7..3ae38cf327ea 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -8,6 +8,7 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/gpio/gpio.h>
>  #include "ipq9574.dtsi"
>
>  / {
> @@ -43,6 +44,42 @@
>         };
>  };
>
> +&pcie1_phy {
> +       status = "okay";
> +};
> +
> +&pcie1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pcie_1_pin>;
> +
> +       perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;

Usually qcom PCIe hosts also define wake-gpios.

> +       status = "okay";
> +};
> +
> +&pcie2_phy {
> +       status = "okay";
> +};
> +
> +&pcie2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pcie_2_pin>;
> +
> +       perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +};
> +
> +&pcie3_phy {
> +       status = "okay";
> +};
> +
> +&pcie3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pcie_3_pin>;
> +
> +       perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +};
> +
>  &sdhc_1 {
>         pinctrl-0 = <&sdc_default_state>;
>         pinctrl-names = "default";
> @@ -60,6 +97,31 @@
>  };
>
>  &tlmm {
> +
> +       pcie_1_pin: pcie-1-state {
> +               pins = "gpio26";
> +               function = "gpio";
> +               drive-strength = <8>;
> +               bias-pull-down;
> +               output-low;

No clkreq and no wake gpios?

> +       };
> +
> +       pcie_2_pin: pcie-2-state {
> +               pins = "gpio29";
> +               function = "gpio";
> +               drive-strength = <8>;
> +               bias-pull-down;
> +               output-low;
> +       };
> +
> +       pcie_3_pin: pcie-3-state {
> +               pins = "gpio32";
> +               function = "gpio";
> +               drive-strength = <8>;
> +               bias-pull-up;
> +               output-low;
> +       };
> +
>         sdc_default_state: sdc-default-state {
>                 clk-pins {
>                         pins = "gpio5";
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

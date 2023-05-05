Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D22DC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 09:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjEEJbZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 05:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjEEJbY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 05:31:24 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F73710FE
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 02:31:22 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-559de1d36a9so21778817b3.1
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683279082; x=1685871082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MM6g2assaoeNu6KDIT9mx4Mgh7ikUGEipJAfiIXirro=;
        b=hr1BI1eYDnuD0l6OEi7qrem4Otn1cEyr3qS/rM81Jd4MgMmDfFcgxtVg6NMwxoiUT4
         a4J+K7+JDRj9e/2ZJmBmz0Bm9byKSj+a18T5e6GTNc/fb7VfR4+W5ZjmcfzsfjLsEo4X
         4NB4H++DT/cvMDiLK9bLUjKdKkVSN8y5E75+QDeuHaUuTHqkdzKsGxOVLSV58SKPzGZ2
         2zYwsonY3CFSs33GNTp/Exh7Pxe5H8ysno8vvBE693Tm4jykl6fJTGifFK4L6utP3kNu
         XM8uGexR+0hD542hgfxsaklEdAhPIy69emi9bpATeQOCyKpm1s1A4rfkqY76fjS6t+03
         FNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683279082; x=1685871082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM6g2assaoeNu6KDIT9mx4Mgh7ikUGEipJAfiIXirro=;
        b=jT/ZVWUQzKnWpKuzeAiEcatzRUPDlyZeDS7i9aGPaKXWR1kEzYTYF2hO4CRxDnzrgu
         1Y0q+/2TMPYeARTEuhN52NqKC7TiC27MtLb/k6iJDpxliML9kngubrwrstUr5SGPy/1Y
         U9CTBrC+7QJ/V3/LQ2R6Ous+nVS9HuWXZgVcRNsyz/gc0MbZyIySDgbdI28T0WLQQcld
         dCTlh0HRcUfwP9ID7g6uKM2G+nSNsxql296/i2DTx/anTucHBH/I7ub76xiJsxYXNI/q
         gxJKqA+xeRCR7iPZvlt3ycQzhJx1x/ylHSYNNgcUCRN1IOj7IkD3ExAziosXrZ6sYkjN
         wm8w==
X-Gm-Message-State: AC+VfDwdNkO5GtFOVjr4zU1IlsVeVXCbiMN7201veaWlat53CRb6c6Wn
        G4YfJfjnY8H++ows91yFIhpJq60yNag6ipHv7I12iw==
X-Google-Smtp-Source: ACHHUZ4gnWd4xq99o36aaRN2R/mbKRGrgeseM0ZJ/J010obVqlqdHpYxHVmPNXQ7zM4I2d1pTzJ412xQpEM/2/25ORw=
X-Received: by 2002:a0d:d9d4:0:b0:54f:8cf7:c117 with SMTP id
 b203-20020a0dd9d4000000b0054f8cf7c117mr919139ywe.45.1683279081737; Fri, 05
 May 2023 02:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683183860.git.quic_varada@quicinc.com> <efb655fd19354ee77cf03b3b96a2206065106590.1683183860.git.quic_varada@quicinc.com>
In-Reply-To: <efb655fd19354ee77cf03b3b96a2206065106590.1683183860.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 5 May 2023 12:31:11 +0300
Message-ID: <CAA8EJprrk7+jRWdhz2MWdFj-jf2ehbXrz97KrkZ4NE6FqhiCNw@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] arm64: dts: qcom: ipq9574: Add USB related nodes
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 5 May 2023 at 11:23, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Add USB phy and controller related nodes
>
> SS PHY need two supplies and HS PHY needs three supplies. 0.925V
> and 3.3V are from fixed regulators and 1.8V is generated from
> PMIC's LDO
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v10:
>         - Fix regulator definitions
>  Changes in v8:
>         - Change clocks order to match the bindings
>  Changes in v7:
>         - Change com_aux -> cfg_ahb
>  Changes in v6:
>         - Introduce fixed regulators for the phy
>         - Resolved all 'make dtbs_check' messages
>
>  Changes in v5:
>         - Fix additional comments
>         - Edit nodes to match with qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>         - 'make dtbs_check' giving the following messages since
>           ipq9574 doesn't have power domains. Hope this is ok
>
>                 /local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: phy@7d000: 'power-domains' is a required property
>                 From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>                 /local/mnt/workspace/varada/varda-linux/arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dtb: usb@8a00000: 'power-domains' is a required property
>                 From schema: /local/mnt/workspace/varada/varda-linux/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
>
>  Changes in v4:
>         - Use newer bindings without subnodes
>         - Fix coding style issues
>
>  Changes in v3:
>         - Insert the nodes at proper location
>
>  Changes in v2:
>         - Fixed issues flagged by Krzysztof
>         - Fix issues reported by make dtbs_check
>         - Remove NOC related clocks (to be added with proper
>           interconnect support)
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 104 ++++++++++++++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 93b4ba9..84b80cc 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -150,6 +150,24 @@
>                 method = "smc";
>         };
>
> +       fixed_3p3: s3300 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "fixed_3p3";
> +       };
> +
> +       fixed_0p925: s0925 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <925000>;
> +               regulator-max-microvolt = <925000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "fixed_0p925";
> +       };
> +
>         reserved-memory {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
> @@ -191,6 +209,45 @@
>                         reg = <0x00060000 0x6000>;
>                 };
>
> +               usb_0_qusbphy: phy@7b000 {
> +                       compatible = "qcom,ipq9574-qusb2-phy";
> +                       reg = <0x0007b000 0x180>;
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +                                <&xo_board_clk>;
> +                       clock-names = "cfg_ahb",
> +                                     "ref";
> +
> +                       resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +                       status = "disabled";
> +               };
> +
> +               usb_0_qmpphy: phy@7d000 {
> +                       compatible = "qcom,ipq9574-qmp-usb3-phy";
> +                       reg = <0x0007d000 0xa00>;
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&gcc GCC_USB0_AUX_CLK>,
> +                                <&xo_board_clk>,
> +                                <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +                                <&gcc GCC_USB0_PIPE_CLK>;
> +                       clock-names = "aux",
> +                                     "ref",
> +                                     "cfg_ahb",
> +                                     "pipe";
> +
> +                       resets = <&gcc GCC_USB0_PHY_BCR>,
> +                                <&gcc GCC_USB3PHY_0_PHY_BCR>;
> +                       reset-names = "phy",
> +                                     "phy_phy";
> +
> +                       status = "disabled";
> +
> +                       #clock-cells = <0>;
> +                       clock-output-names = "usb0_pipe_clk";
> +               };
> +
>                 pcie0_phy: phy@84000 {
>                         compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
>                         reg = <0x00084000 0x1000>;
> @@ -560,6 +617,53 @@
>                         status = "disabled";
>                 };
>
> +               usb3: usb@8a00000 {
> +                       compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
> +                       reg = <0x08af8800 0x400>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges;
> +
> +                       clocks = <&gcc GCC_SNOC_USB_CLK>,
> +                                <&gcc GCC_USB0_MASTER_CLK>,
> +                                <&gcc GCC_ANOC_USB_AXI_CLK>,
> +                                <&gcc GCC_USB0_SLEEP_CLK>,
> +                                <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +
> +                       clock-names = "cfg_noc",
> +                                     "core",
> +                                     "iface",
> +                                     "sleep",
> +                                     "mock_utmi";
> +
> +                       assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +                                         <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                       assigned-clock-rates = <200000000>,
> +                                              <24000000>;
> +
> +                       interrupts-extended = <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pwr_event";
> +
> +                       resets = <&gcc GCC_USB_BCR>;
> +                       status = "disabled";
> +
> +                       dwc_0: usb@8a00000 {

As I wrote in the other email, this better have the usb_0_dwc3 alias.
With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +                               compatible = "snps,dwc3";
> +                               reg = <0x8a00000 0xcd00>;
> +                               clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                               clock-names = "ref";
> +                               interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&usb_0_qusbphy>, <&usb_0_qmpphy>;
> +                               phy-names = "usb2-phy", "usb3-phy";
> +                               tx-fifo-resize;
> +                               snps,is-utmi-l1-suspend;
> +                               snps,hird-threshold = /bits/ 8 <0x0>;
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_u3_susphy_quirk;
> +                               dr_mode = "host";
> +                       };
> +               };
> +
>                 intc: interrupt-controller@b000000 {
>                         compatible = "qcom,msm-qgic2";
>                         reg = <0x0b000000 0x1000>,  /* GICD */
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

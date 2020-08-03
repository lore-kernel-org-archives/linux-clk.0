Return-Path: <SRS0=ow3Z=BN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A282C433E0
	for <linux-clk@archiver.kernel.org>; Mon,  3 Aug 2020 18:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EFFF22BF3
	for <linux-clk@archiver.kernel.org>; Mon,  3 Aug 2020 18:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="coDDm+vP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgHCSRY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Aug 2020 14:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCSRX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Aug 2020 14:17:23 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479C2C06174A
        for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2020 11:17:23 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 6so28976246qtt.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2020 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVtWQUGpmw8jhNyuuKCyNkZI5368yArYPxJOwi5ESm4=;
        b=coDDm+vPAuh6Fuh2z/owncaMvXWcMJtlRYB7hg03SaGSChcDWim/iI7wQu6Gtru4LI
         LNNy/0P59m7hXu3w8xvG2OpKtNRj3lQLUBTX0H4+160GNmcD4+O94D6G26WpSJdbxPGx
         S9b8lEbGDCKUi6B37X/bH0jLuj/oO8PhAeAds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVtWQUGpmw8jhNyuuKCyNkZI5368yArYPxJOwi5ESm4=;
        b=N0MwChebzkdBETv/0GBuCf+YZ153GypHW/7t6taXI17XIH4yI83hGpX772rk5fW0sm
         4+XIIGVg/30J2c6GI+To33kGLMPixwbN4/tZl2gNJaGNavSvtPVAgjOKp541MBrDdoXL
         MMDZgjeU4A3z24Zd+SH9P9yhFYhEVlIXnPk1d1+AbEMJViKdlHtZG57cH3zhyg6q6sdJ
         F+V4VZzVZyjdn9wHkwMYf8pqDTK34Yc4L92/4OJbR2j4kvhOnjJIuroSSvHLtUPUi+gz
         XHRVz5nccIr3qU2MCGA//AA47+KfWVjm4B2jtJUz1DAp+4RIz2kQci1EpvuVptxo9n6A
         IPLg==
X-Gm-Message-State: AOAM5332V+zPBwK7n4wNKlSbiJh7mUhJb9jVMKnNfg/zCxngwAghqV8o
        MaAJUdQNrGlFfmC2/cYaVN8xTM8AYzY=
X-Google-Smtp-Source: ABdhPJyNPDbgYjyoWwi4RYEH4NJ6CLieu+SSsqRYGrYFODtpOo8PeyjKbs0pBZBF7DDX6248jAZE4A==
X-Received: by 2002:ac8:586:: with SMTP id a6mr17817883qth.391.1596478642153;
        Mon, 03 Aug 2020 11:17:22 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 15sm12367815qkm.112.2020.08.03.11.17.21
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 11:17:21 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id y134so15341569yby.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2020 11:17:21 -0700 (PDT)
X-Received: by 2002:ab0:44e5:: with SMTP id n92mr12122918uan.121.1596478170242;
 Mon, 03 Aug 2020 11:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <1596305615-5894-1-git-send-email-tdas@codeaurora.org> <1596305615-5894-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1596305615-5894-2-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Aug 2020 11:09:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm4bF07OFQv85kmOyzK9=TcC0gJuuxcJwUxGNed06QTw@mail.gmail.com>
Message-ID: <CAD=FV=Vm4bF07OFQv85kmOyzK9=TcC0gJuuxcJwUxGNed06QTw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add LPASS clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Sat, Aug 1, 2020 at 11:14 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> Update the clock controller nodes for Low power audio subsystem
> functionality.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d46b383..7cf8bfe 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sc7180.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> @@ -3312,6 +3313,30 @@
>                         qcom,msa-fixed-perm;
>                         status = "disabled";
>                 };
> +
> +               lpasscc: clock-controller@62d00000 {
> +                       compatible = "qcom,sc7180-lpasscorecc";
> +                       reg = <0 0x62d00000 0 0x50000>,
> +                           <0 0x62780000 0 0x30000>;
> +                       reg-names = "lpass_core_cc", "lpass_audio_cc";
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "iface", "bi_tcxo";
> +                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               lpass_hm: clock-controller@63000000 {
> +                       compatible = "qcom,sc7180-lpasshm";
> +                       reg = <0 0x63000000 0 0x28>;
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "iface", "bi_tcxo";
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>         };

You end up adding a blank line at the end that Bjron can probably fix
when applying, but other than that this looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81475EC874B
	for <linux-clk@archiver.kernel.org>; Thu,  7 Sep 2023 17:12:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241763AbjIGRMN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbjIGRMN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Sep 2023 13:12:13 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8531FF9
        for <linux-clk@vger.kernel.org>; Thu,  7 Sep 2023 10:11:44 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a5a7e7cd61so609353b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 07 Sep 2023 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106651; x=1694711451; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9kunx9UxE5AO8Mpt3OIBGhm0UdSfJDTNTDmm1Ca6qzg=;
        b=mqr6B3gnuWo9hdtRcXy28lJZ6ryediMoOZOZisVWjs9qQtwRKEsixAp+tifgf7ZI59
         aeP5elib2rQbpRTynWGyk/Hio5k3qLImTs+TzYfBrSEN+6HSsS5AbVjeckyyaTZlICKH
         A0j03wJ5o6s3p+Q2p6lG2rPinkNTOovWJgz4fo7YQkEaQQ5nTchnvZMVmPof8692ybRI
         LNH6l/0bs3RbMSwtLJl7670zz2ANeNDlNnKmU+N8DZodY8Tszzv1XNgbzdZ7pfqwFt02
         lGnjfw+I0ZumjFZLUkMvo/ZrAXyv61axzVjpVsBOxp05AcRqIyNrrXjQIc80o5AAkjP+
         5Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106651; x=1694711451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kunx9UxE5AO8Mpt3OIBGhm0UdSfJDTNTDmm1Ca6qzg=;
        b=iCwIEPxjv9DDXib0FlJSVdYATsCQeLIkRGi2MJbikmAx1S9Q+TlEh565uxYKHcI0da
         CSPAvrvzmNS1Si54QH1YiRUPh926cWxPAO39Pjm7b/tl3pFs8rvqgcaIOS6jyddO8Ohu
         HC8hvuUyvVAWOM4Id7ZXPO0WetxSUzGrLo4N/b3iRHXMcvIU0ocmvzOv0zEA5PJAtPYp
         4detmE3+Q6EzjFxvGi6TmKCgaP7qOTMcKMUR9kK1VzFh8AvdvcptYG1wx6kBy8u3y554
         7+qfrkJ82SBCvZCEYOnYCSvzBovSlFSDpGqAIkIW+XQLD47OIiAZ63Spev5y9w6ds14R
         lGUw==
X-Gm-Message-State: AOJu0YyEyrFsoP6ggVZzl38lDpA4kF9mqLwHzRirk6ND6CvMlIXnmctN
        CzVU2Ee1doOPYIm9f5Xvdkauf/OKCTm4Zobh3BHLY8Bx9k8WQFjc
X-Google-Smtp-Source: AGHT+IGWwMUs+woCpFuAAwk4rYJhGtyUArweMKLG0DdWWNZXHEqnr826vQ2pJOiYkeGxQTvNpSH7Tmuy50h8QS8fgX8=
X-Received: by 2002:a5b:f11:0:b0:d80:12f5:cd4d with SMTP id
 x17-20020a5b0f11000000b00d8012f5cd4dmr156584ybr.18.1694095179083; Thu, 07 Sep
 2023 06:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693996662.git.quic_varada@quicinc.com> <a6d12e3b253d6a55d85f66979ba8b7d9c9ff6072.1693996662.git.quic_varada@quicinc.com>
In-Reply-To: <a6d12e3b253d6a55d85f66979ba8b7d9c9ff6072.1693996662.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 16:59:28 +0300
Message-ID: <CAA8EJppNsgUNgwadq9oM0_KyORNR5PBZGVZukN6MzAm2KPzC9g@mail.gmail.com>
Subject: Re: [PATCH v1 07/10] arm64: dts: qcom: ipq5332: populate the opp
 table based on the eFuse
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Sept 2023 at 08:23, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> IPQ53xx have different OPPs available for the CPU based on
> SoC variant. This can be determined through use of an eFuse
> register present in the silicon.
>
> Add support to read the eFuse and populate the OPPs based on it.
>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 82761ae..3ca3f34 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -91,11 +91,34 @@
>         };
>
>         cpu_opp_table: opp-table-cpu {
> -               compatible = "operating-points-v2";
> +               compatible = "operating-points-v2-kryo-cpu";
>                 opp-shared;
> +               nvmem-cells = <&cpu_speed_bin>;
> +               nvmem-cell-names = "speed_bin";
> +
> +               /*
> +                * Listed all supported CPU frequencies and opp-supported-hw
> +                * values to select CPU frequencies based on the limits fused.
> +                * ------------------------------------------------------------
> +                * Frequency     BIT3   BIT2   BIT1    BIT0    opp-supported-hw
> +                *              1.0GHz 1.2GHz 1.5GHz No Limit
> +                * ------------------------------------------------------------
> +                * 1100000000     1      1      1       1            0xF
> +                * 1500000000     0      0      1       1            0x3
> +                * -----------------------------------------------------------
> +                */

This can probably go to the commit message instead.

> +
> +               opp-1100000000 {
> +                       opp-hz = /bits/ 64 <1100000000>;

But your table shows 1.0 GHz and 1.2 GHz instead of 1.1 GHz

> +                       opp-microvolt = <850000>;
> +                       opp-supported-hw = <0xF>;
> +                       clock-latency-ns = <200000>;
> +               };
>
> -               opp-1488000000 {
> -                       opp-hz = /bits/ 64 <1488000000>;
> +               opp-1500000000 {
> +                       opp-hz = /bits/ 64 <1500000000>;

So, 1.488 GHz or 1.5 GHz?

> +                       opp-microvolt = <950000>;

Which regulator is controlled by this microvolt?

> +                       opp-supported-hw = <0x3>;
>                         clock-latency-ns = <200000>;
>                 };
>         };
> @@ -150,6 +173,11 @@
>                         reg = <0x000a4000 0x721>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
> +
> +                       cpu_speed_bin: cpu_speed_bin@1d {
> +                               reg = <0x1d 0x2>;
> +                               bits = <7 2>;
> +                       };
>                 };
>
>                 rng: rng@e3000 {
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

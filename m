Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7827AC7EE22
	for <linux-clk@archiver.kernel.org>; Tue,  9 May 2023 13:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbjEINJO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 May 2023 09:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235339AbjEINJN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 May 2023 09:09:13 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9423C03
        for <linux-clk@vger.kernel.org>; Tue,  9 May 2023 06:09:11 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b9a6ab9ede3so7521139276.2
        for <linux-clk@vger.kernel.org>; Tue, 09 May 2023 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683637750; x=1686229750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCtzZTuG/ubCVd5eZD+aWJhOUl7gLSVq0SL8hnKaURM=;
        b=U1Oaci7XUseeGD+Wok1wXG4iauIkT+6aTGk/omu3Ysihz6DSba5SEDgNQ7DxClYlOl
         tbmiRVSNVBBk6T3jW0WO7CHHyOJNHUtRvOfjGnwrb7uaN0H8g4vBS7fVEyUtDQBP8n4A
         EB08hw8EK5daZRfYgPGIfLSFY9TzK2iwqF86Yc4BWXyz7ZPEnuIVFv33SeWb2RMKkLgP
         PuoPXbRv7v0rlUCs5V792tHKnk45TIErFyoIgqrp9rP/atpmwFx/QzNc9BWIOH4WkGzv
         PIxyQXxEZIBsRIR1SBOIqEG+nIBVyczHxEOMbslojwYZ8ze71HUfDzVHbnhJhcfO+AC/
         lCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683637750; x=1686229750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCtzZTuG/ubCVd5eZD+aWJhOUl7gLSVq0SL8hnKaURM=;
        b=GiAEF0KLTaHWJaLyMyQ+xV7g9Wxnq5hvsKxzA6cg6X5KwlSe8u0+jTlqpO4eucado/
         HuDAseODUmQWEJKGBuqNQvHRYqrrto6JcsY5rviS3p7fZbatn77folbIn8Pbrph5s6uJ
         QGR5tI5iwxifZmTKxdwCQnI9f9ym8TunVk8TEgiO+8/NTEZnfOGD2zjpIlmtRWz88UK7
         ZuQK801lBLA40mSNblAKxiU1HhisMe06g+VBXZmeFMBgO4/Tgf8Dp14OqBOs/pAnZdRX
         GsEXUgO4DsMTxGTNCCl0I7PUMIH4SxCS7kds5Ca3OU02eWlPl3glIDICpGpT8zrky2Au
         fP0w==
X-Gm-Message-State: AC+VfDz//CiLz1RzhZzlt0uQPgTa2T5oWuS2IvK3DiqPs6sodiRRVTaj
        jC6+Z8U4QNh+hrZSvuI4GzadlBRjxITxzshCNFvWJA==
X-Google-Smtp-Source: ACHHUZ7/yu6cqvyEWbtDreV9v1hRaJB1cajmF/a1j4cDHrTbHxxkh+DVkek1PSbhqPTIfv3fdxjc+SZL0rScFLp/QkI=
X-Received: by 2002:a25:addf:0:b0:b99:6c12:74ff with SMTP id
 d31-20020a25addf000000b00b996c1274ffmr15248139ybe.15.1683637750625; Tue, 09
 May 2023 06:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683630932.git.quic_varada@quicinc.com> <42bf6244582d6208f51db1a9299fe1c8afab4e14.1683630932.git.quic_varada@quicinc.com>
In-Reply-To: <42bf6244582d6208f51db1a9299fe1c8afab4e14.1683630932.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 16:08:59 +0300
Message-ID: <CAA8EJpqkSNzx=73JS1Csw+ivVovhrFeM0R5j2tpruEfNqvT48Q@mail.gmail.com>
Subject: Re: [PATCH v11 8/9] arm64: dts: qcom: ipq9574: Add LDO regulator node
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 9 May 2023 at 14:56, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> Add LDO regulator node
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v10:
>         - Add LDO regulator node
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor question below:

>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index bdc1434..1f5d14f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -60,6 +60,13 @@
>                         regulator-min-microvolt = <725000>;
>                         regulator-max-microvolt = <1075000>;
>                 };
> +
> +               mp5496_l2: l2 {
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-boot-on;
> +                       regulator-always-on;

This usually points out that there are other users which are not yet
enabled/properly specified. What users are there for this supply which
demand it to be always on?

> +               };
>         };
>  };
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

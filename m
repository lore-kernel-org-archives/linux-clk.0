Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38E7C77B7C
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 09:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjEEJaJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 05:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231542AbjEEJaI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 05:30:08 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C06217FCF
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 02:30:06 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-55cc8aadc97so21611817b3.3
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683279005; x=1685871005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zKLLprNwaaeZYAnNNb830KY0y4SK3/A2CshWnDDE80w=;
        b=IyeI2DkciUzyMxxJkZOgS4Wf48xUGAPNC5wvtQocGOSDSNVbotah9q12SzdcdTzC9V
         B4FURdd4Wz5zfZtAfHXXvHmbVGHNlUf4cuPoQTNG1ifz5zAZzz5JeXrm7227Ir6MR/Lt
         OFB//+zi1Qea68MpwIASOqpabWg8dBuZqtwUT+QdMQUq1pndBRZVuI60F8nDqIl+zutJ
         3aJLqWzeYW6045FPK0R4ItYPlTd6iUBzwrSq5nrYZvKP6tVVBhDCmWEc0MYs6L3sxIwJ
         yhTk5qFg0jHBqLToGH4P9nlWjqpqpkBiZoeOe9hnRkvCcTLS+c3Bx83fiO0Wlfjq4gAp
         gOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683279005; x=1685871005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKLLprNwaaeZYAnNNb830KY0y4SK3/A2CshWnDDE80w=;
        b=S+PGQuiinFioqkLUEDsm1w7Bu5TSIbHiO+MWGndKHL9Vb1bPI4NuM/zJmGHy3hAA75
         SKcesvBZDMNNre6j46X2T3e88TJTDHhD4pmMt7VMyHIgY6+xyns9MpzfnoREa7zIcctQ
         rvL4g4O8S8C/D8laSgebrwABcoT1XeVZK/qfkF09f5ZYZCeXQRaGP6TGYVmNcGHO8Tj/
         wI1vCH3uKSuU4qtFc2CBFU3KWh2fHHu5cz7LpulG13wyzfcUQoLdvH4rG+blOyzaPUHo
         ORhh9XrzMHrEUgyS4eg9eroQlGqkwK1HDA9urrDu5+36bR9qaSx6daJUiwyMB1YTiz1t
         Njug==
X-Gm-Message-State: AC+VfDxB7D3QOPKPjNiTzBN7gLxhcas7RCWwBlfoMGpUtSnZarl4e+pt
        DlQ9029CwxTMg7ZRYtk8w99jMLmzuUavnXiG/nDjyg==
X-Google-Smtp-Source: ACHHUZ57uxYbtQ4r7HHvF2CMapziRFJbg7koTCsVXaNSfDQ941AHyjqZmqhvyR2XIphz/G6gzsJpm/RJwQ9QpSVa1P4=
X-Received: by 2002:a81:4e8a:0:b0:55a:886c:bfc3 with SMTP id
 c132-20020a814e8a000000b0055a886cbfc3mr999607ywb.7.1683279005467; Fri, 05 May
 2023 02:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1683183860.git.quic_varada@quicinc.com> <8894bf2c44eaf4959c7a1966b66229e6cf5cda96.1683183860.git.quic_varada@quicinc.com>
In-Reply-To: <8894bf2c44eaf4959c7a1966b66229e6cf5cda96.1683183860.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 5 May 2023 12:29:54 +0300
Message-ID: <CAA8EJppvj2nzqwdsC+Xct4cJg2-_yPpiGDELjHJG4HyAH3zGMA@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] arm64: dts: qcom: ipq9574: Add LDO regulator node
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
> Add LDO regulator node

As this LDO is provided by the PMIC, it would be nice to know why it
is modelled as an always-on regulator instead of the proper PMIC
regulator. Up to now we were doing this only for the outstanding power
rails like CX/MX or EBI.

>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v10:
>         - Add LDO regulator node
> ---
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
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

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B644EEB64D9
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jun 2023 10:55:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbjF2KzE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jun 2023 06:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbjF2KyS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Jun 2023 06:54:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621A630E6
        for <linux-clk@vger.kernel.org>; Thu, 29 Jun 2023 03:54:16 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b69e6cce7dso7540661fa.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Jun 2023 03:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688036054; x=1690628054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdebpG7B8F9V87V7yH4LCy/dhZPhyIgN9dJcDBkczVw=;
        b=VrpOfyJdIJ9MON/Z0bV6uX+sHS2LQMC72u4SbppyuaJrHjVpt2tFG3n/rH134Vbv5U
         lf2Cv4yL6acniiPWzN9CQyEVmakHo86fEGxBCShAwqol9jYWfhU+4w/4M4e3coK3dZfK
         AQ1CMDUqP9DYCuRWbT6Z6kjCmL9b6joScDvB5glVsiqkOfxt1ZlF67u/4U8QnVTD2qoI
         Lsw6hGxpwt1D/q+bC7aP2Hy+dA08eLtcYnLltZHXi2Np8+XpmCY9cU6qWZcK2XfJUypH
         PmGIYPG2ZnHIoudq6B/iJUn+loxHpx/m7SptzQmT1ObTWchlw5KIGkCr8sp8fx7tfuoi
         543Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688036054; x=1690628054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdebpG7B8F9V87V7yH4LCy/dhZPhyIgN9dJcDBkczVw=;
        b=Uci0AOwxOD3fIAniKGE7EEw3/6Eer9TjquczWzY3G9ezBoCdzzmzf19XU9ZIfgykBh
         QbskRNrYd5DSVgkrm686tHRORcu4mHK01z25J1NJ4QdkuXYfghB9PkQDs7IptKvXaU/h
         xQULb3m1TfJaKWADdpVzU/i33281wwuHk5CLmy31h1uoTWUpxcjEv2v0kYN3eFF8wjzN
         E7D1zheYcYv7G8OujixlJYK6wSZpDZRXEhsE9Lvutq5wE/Etfarj5bHUxwXYcgaysw+A
         S4YmTsiYQLv1bzoAatS7w36BI2jRimA42mdixBf6cQHKYFnE1l6QzXcLkmHxUAd3tlU+
         jefg==
X-Gm-Message-State: AC+VfDzjcinDXGe5HNwZx7oYHHdC0TIXATsHXheJG/xbjYGMbdeP6EtW
        uZd0rM2OYzHzMLhPZN12zcvr5A==
X-Google-Smtp-Source: ACHHUZ6Cti6WxaFYw3foMujEF8+CPZ3PjzVSYVH3Roqu+83hzJ8iDF3e8skqPsrGSzjqtdXvPdNL5g==
X-Received: by 2002:a05:6512:3f01:b0:4fb:89bb:ca19 with SMTP id y1-20020a0565123f0100b004fb89bbca19mr5407601lfa.66.1688036054645;
        Thu, 29 Jun 2023 03:54:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r23-20020ac252b7000000b004f60be0c685sm2271993lfm.123.2023.06.29.03.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:54:14 -0700 (PDT)
Message-ID: <285facd1-bf20-aff2-b680-f796e8830038@linaro.org>
Date:   Thu, 29 Jun 2023 13:54:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125
 variant
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-10-03e430a2078c@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-10-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/06/2023 23:14, Marijn Suijten wrote:
> Document availability of the 14nm DSI PHY on SM6125.  Note that this
> compatible uses the SoC-suffix variant, intead of postfixing an
> arbitrary number without the sm/sdm portion.  The PHY is not powered by
> a vcca regulator like on most SoCs, but by the MX power domain that is
> provided via the power-domains property and a single corresponding
> required-opps.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml         | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index a43e11d3b00d..183a26f8a6dc 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -19,6 +19,7 @@ properties:
>         - qcom,dsi-phy-14nm-2290
>         - qcom,dsi-phy-14nm-660
>         - qcom,dsi-phy-14nm-8953
> +      - qcom,sm6125-dsi-phy-14nm
>   
>     reg:
>       items:
> @@ -35,6 +36,16 @@ properties:
>     vcca-supply:
>       description: Phandle to vcca regulator device node.
>   
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier for an optional power domain.
> +    maxItems: 1
> +
> +  required-opps:
> +    description:
> +      A phandle to an OPP node describing an optional performance point.

I'd rephrase this to be something more exact, like 'desribing power 
domain's performance point'.

> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> 

-- 
With best wishes
Dmitry


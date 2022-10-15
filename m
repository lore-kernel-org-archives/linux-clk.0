Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5193DC433FE
	for <linux-clk@archiver.kernel.org>; Sat, 15 Oct 2022 15:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiJOPPi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Oct 2022 11:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiJOPPh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Oct 2022 11:15:37 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AB52D776
        for <linux-clk@vger.kernel.org>; Sat, 15 Oct 2022 08:15:36 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id l19so5032351qvu.4
        for <linux-clk@vger.kernel.org>; Sat, 15 Oct 2022 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/oMrOTbUd3cbdsiML3nv2+rJ1KxLtOIUzPm5C1zEHGY=;
        b=SX7g5cHeayW/KtT6diblULbooFsbwiTJedYfjCwfM4UCnWTZUKxVfMqG8RX5n+iIx1
         a37yUV6S/lB41sqI9ecs8E1Lb185XWLP/mL2Gys4KmCUL7YqPLH8o2/WyQvK9amwdywd
         mrlDakEqUIGp7frhPnOCUVDtM3ybjP2kdfCOgVPVT7MrdXiV8ZQ+DMoN5kCgmVArIDdG
         nvc/ji598P8qVEL9X9VLLUypmmgK6QIS9dQv1KzJ/Cc8pvla5XB0IiVLHg+cN92IoVTo
         ZHzUCHI3wpTrEi5eXsyXy56tqHdnOqMxCJBbR4CrneMfLiWuYb3xi3LbLbRHjKE+WIec
         /BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oMrOTbUd3cbdsiML3nv2+rJ1KxLtOIUzPm5C1zEHGY=;
        b=4y5qH/u6cbuHjUWSxdEsr45+LAnngSvjNtjS07Xt69TutylBOJ/88PtT0wj5Lhan11
         f57P0X5skIiE6+zqaq3vSuVGtMBC+1STS5HMiUk4F2wmcNqa/kw7H09VPraVR1OQpcu4
         PjZfgqpINjdf2j5JXMoAgq8Sg+rqf/1YCB6FROygwSIcio08y2Teg4OpWok7bXp+iDsp
         e1eG09EJhv14pjHyLYvedDrUlSOL+1yM/AXbyVb2Jqt7CZcBha5/vO2dEi26RbdSSJPN
         LdyO3WbwrF7efcq+Wpa2z/l6WFqpEIXsRZtUixHYy/tlP1wl2ekmeCHg8+F+wk7JWF0L
         uEMg==
X-Gm-Message-State: ACrzQf1oGWUnGGunuf9PGDNe88dOhb1oe/kKcbpTxPOHwEQgXz6xOldc
        4hKbgsNKuZGWgY9rDrxjwhlECQ==
X-Google-Smtp-Source: AMsMyM5w93pwRpeupaaVj0b7ISuHi4qyZKLxOuU2c5bjnJYaWopZTwqcM3xGgr3SEIgSzVcrBFG5zg==
X-Received: by 2002:a05:6214:21a9:b0:4b3:99ff:8794 with SMTP id t9-20020a05621421a900b004b399ff8794mr2116002qvc.68.1665846935149;
        Sat, 15 Oct 2022 08:15:35 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9477:c2f0:ddea:ea08? ([2601:42:0:3450:9477:c2f0:ddea:ea08])
        by smtp.gmail.com with ESMTPSA id p14-20020ac8740e000000b003992448029esm4095819qtq.19.2022.10.15.08.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 08:15:34 -0700 (PDT)
Message-ID: <16c192b3-b05f-8f24-30f7-82aeced6badd@linaro.org>
Date:   Sat, 15 Oct 2022 11:15:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: Add RPMHCC bindings for
 QDU1000 and QRU1000
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221014221011.7360-1-quic_molvera@quicinc.com>
 <20221014221011.7360-3-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221011.7360-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/10/2022 18:10, Melody Olvera wrote:
> Add compatible strings for RPMHCC for QDU1000 and QRU1000.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 437a34b930e3..7cacbfe745a5 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -17,6 +17,8 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - qcom,qdu1000-rpmh-clk
> +      - qcom,qru1000-rpmh-clk

Nope, you sent something entirely else.

Best regards,
Krzysztof


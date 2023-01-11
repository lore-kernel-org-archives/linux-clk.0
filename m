Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2800C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 09:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236466AbjAKJqd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 04:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238936AbjAKJoB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 04:44:01 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633AB1BCA9
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:39:42 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso13885698wms.5
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8BizcVfug2KR7X95xTtR4MdSG9d3r4Rots/UtEZ7CBI=;
        b=Of0k7HBvGkE4sMlsW/dwrcvfReK1FihY9KXg830i6h3svleqr9v2JQ5I8YeBOw/sH6
         D1aOICoKy3EhSQX5s//nGL2NAqfQrp/xHoBZXZdbwGwUDoWFejGgmOmRi94FLXUsMs/V
         j1nweLV9qzXCXhK6C7W0k4ecQQUnsFXDTOQ5oNcZy6Z5WPXtknGAty/3B9CGWM85Fb88
         z4zSaogjxtiJdcrH4sdURsIUlr4WhAZuxZ1w8AEgX6TNaayJ30+daeIb4B+RVK5Va7uM
         oknpOxu3PZNddRO0AYmVllbcoYfOKJoIlLxq/N0SRQx+gx9m87qnQMzUDH/AKcaEoSAt
         Vs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8BizcVfug2KR7X95xTtR4MdSG9d3r4Rots/UtEZ7CBI=;
        b=5UZpRMFY+J9ZFLjo6NU8IodfxAJ2FCAodJgaett/7nfwXc5ekQPKs8iR1uOokxLgNo
         hCBRDfe+ujU0OQ+DV+ZM8K4zeqR1nPq/Bk/ofJXOqVelSlr6pqdqGF2d2r0snDCrMHYm
         ko9tE7h8C41i0WfgkO1r93wDPugi2fWBDTySzlFaBW22G4Me3oJ+7V40NXC+uwUC3L2H
         0Q3sXcYDedDbZNbwZ2FJDsTqroxMcR/vP1ofnNkCYgrlYXwrdxdXpn0DmxQWxDScMDb2
         AguIs9bKHzy+YyDN11R8mdTpo6smUu8dnG7KhnQMF+x6mKZshFKWts5uTDLUJwS0oPrE
         SYyQ==
X-Gm-Message-State: AFqh2kre46XbZtIC+bYI4cyNzbpQ7YGDM2ZqjlCQFYbQZvhtR0pb1Y+w
        ih74fJrC8VQ3gUGOoAYT3COECw==
X-Google-Smtp-Source: AMrXdXuqn+zAyvwszF/XjDEUSVdpODOmNL5B+AoI/aCtejqgX2WnAyTnFxvxnsJq1yKIBC8v8A0AFg==
X-Received: by 2002:a7b:c449:0:b0:3d1:e1f4:21dc with SMTP id l9-20020a7bc449000000b003d1e1f421dcmr51769599wmi.14.1673429981034;
        Wed, 11 Jan 2023 01:39:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c3b1100b003cfbbd54178sm5331233wms.2.2023.01.11.01.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:39:40 -0800 (PST)
Message-ID: <8b1848f1-1a26-ff8b-75e9-e336af80743c@linaro.org>
Date:   Wed, 11 Jan 2023 10:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/7] dt-bindings: qcom: Add ipq9574 bindings
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-6-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110121316.24892-6-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/01/2023 13:13, devi priya wrote:
> Document the new ipq9574 SOC/board device tree bindings
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 27063a045bd0..83102fe2d366 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -32,6 +32,7 @@ description: |
>          ipq4018
>          ipq6018
>          ipq8074
> +        ipq9574
>          mdm9615
>          msm8226
>          msm8916
> @@ -80,6 +81,7 @@ description: |
>          hk01
>          hk10-c1
>          hk10-c2
> +        ap-al02-c7

'a' rarely goes after 'h'.

>          idp
>          liquid
>          mtp
> @@ -304,6 +306,11 @@ properties:
>                - qcom,ipq8074-hk10-c2
>            - const: qcom,ipq8074

Best regards,
Krzysztof


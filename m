Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5C0C38145
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 09:53:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbiIHJxr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 05:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbiIHJxN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 05:53:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69BC19877A
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 02:52:52 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f11so12816653lfa.6
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 02:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MbAZZ7ImXCnAcX5j6c0OQ0QrifKC4P6NeZBSY/zCSx0=;
        b=WB6zbmxVadcxx+HMpPhfMGJ27YOZ9tqaqpHpkNY2q/yJ3tdIjYxihvgxQ3UVOwQE6E
         Th6aMRCdXhR8h+JQN/CE0zJ3kyoqqyrlLFH4OVVGE2XMkvJJPcPBptE6DiWa0CG7OIrt
         5xgUrnGC/8IJbBK2p332HaMYn3wDK/RVm3ontNqr+CiWveggtsDeFtkBzQqGD8IGcYfa
         1TF+eMa03ymKwcA45z3h0nuLSboJINw3u2GjU8pXXSYWYDVyTNYxls3QZ5Sertr7Gape
         OA+0d+ldAFy4OiGWNKwZYCVV1m+Rf6TFBFrcg2I4uOUtegxhW6OO1EylDmW3b0jm5bDl
         sZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MbAZZ7ImXCnAcX5j6c0OQ0QrifKC4P6NeZBSY/zCSx0=;
        b=mAK+nngf46D0Miqm7cm8rhCFXTaaSDBNg/k8Ov+pJqjDCQAfYMq6xmtDyrEKeiqHDR
         0+nQbanTvnmvfJ31v4zeejWDcQjoRJgbgLKQv1ZCwhdPJXKjtcNwooRHG5KctL7U9ulx
         JiM/JnIZyO8yUMyv5avtqvMd3qkXSCP/7hkVyQ5hKIMJZ308CwAP0hloPMBn+yOj5DHR
         I+K5SO5KULnValEix57tr9Gx/kOyccJHDNvgrCJxx2BM1lE2CkuCW7+mI1mCCHVOK5fX
         iIiXFdn19HQW8y0Dk39WjVfKnUQ8LrrL8uNj1OiMYqWXiYyuRV+m5lqqMt/7AP/7DHqj
         DJJQ==
X-Gm-Message-State: ACgBeo06VNZxIAESpVMpNLAbyab8Jbz3nCigqVUr84Jl5v66rR+rYr58
        wjenMNsDiIGDzHCLVSXPX+Vhtw==
X-Google-Smtp-Source: AA6agR4uIUy5M7yq+F2/csoUmcip3so7/aFAX2d6wiRe2HX9qa7VrFl3Pf3YfRp26nUrJMxDAnBTcg==
X-Received: by 2002:a05:6512:ad1:b0:498:f052:3a18 with SMTP id n17-20020a0565120ad100b00498f0523a18mr483600lfu.348.1662630770805;
        Thu, 08 Sep 2022 02:52:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p7-20020a05651211e700b0049487818dd9sm2958665lfs.60.2022.09.08.02.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 02:52:50 -0700 (PDT)
Message-ID: <8a593e0b-99e0-b1f4-20ab-ab2df2940518@linaro.org>
Date:   Thu, 8 Sep 2022 11:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: clock: add i.MX8M Anatop
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, abelvesa@kernel.org,
        abel.vesa@linaro.org, sboyd@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20220906090013.3724305-1-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906090013.3724305-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/09/2022 11:00, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8M Family features an anatop module the produces PLL to clock
> control module(CCM) root clock. Add the missing yaml file.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/clock/imx8m-anatop.yaml          | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8m-anatop.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-anatop.yaml b/Documentation/devicetree/bindings/clock/imx8m-anatop.yaml
> new file mode 100644
> index 000000000000..e247a5774d17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8m-anatop.yaml

Filename: fsl,imx8m-anatop.yaml

> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imx8m-anatop.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8M Family Anatop Module
> +
> +maintainers:
> +  - Peng Fan <peng.fan@nxp.com>
> +
> +description: |
> +  NXP i.MX8M Family anatop PLL module which generates PLL to CCM root.

Description suggests it is a clock controller (you literally write it
generates PLL), but bindings are for system registers (syscon). If it is
PLL, you should make it a real clock provider.

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx8mm-anatop
> +              - fsl,imx8mq-anatop
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - fsl,imx8mn-anatop
> +              - fsl,imx8mp-anatop
> +          - const: fsl,imx8mm-anatop
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    anatop: anatop@30360000 {

Node name: syscon or clock-controller if it is a clock provider.

> +        compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop", "syscon";
> +        reg = <0x30360000 0x10000>;
> +    };
> +
> +...


Best regards,
Krzysztof

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1845EB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 18:32:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239600AbjFMScY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbjFMScY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 14:32:24 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11F61BC5
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 11:32:22 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5183101690cso6482819a12.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 11:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686681141; x=1689273141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IwQxZn6vCIOOod2WsqOS2iKK2dM5ILhVhEaw91jN+A=;
        b=g2x7nF958tTd0yUf6gMMWTZS7MXebEz/qJW0elxmWSc87Fy4YCx1ZGdo+z6qymqABN
         txZwoSEz2hg7Y0m2797wXOMCphi9mDkHsGIO/DqBcXJmRg1cFzYVm+rqTJ+p7H0nnsew
         SUB65kKWg4ET7UtQEmFm4fux3OG45w2OJ352q9LwWFJ5WmcaH7RxSFGnko3e1+L3BQ7l
         JUBMjAhqM2na6yTPxr+juOQz1hqkhuD5a48C6QOMOGSKOP/ssbWx/zHZ5MK2hPnj8hu7
         8GRHGbjwXjNGRKu817QyRD1kJ3CxbqQM7prUEBvmv/+yTuvL5NgOMYhcgtGCB4kf7MRd
         0Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686681141; x=1689273141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IwQxZn6vCIOOod2WsqOS2iKK2dM5ILhVhEaw91jN+A=;
        b=KCp7YqVU/+0/LrovIg21MtGE8g1dNBmcfz4MUrVN+tdo5jfC+xYB5lZYeZXDeuyI0v
         TYnWvrNplpZ+T1ICXXY7WsKUvS0tN2E1x8TgK3pPkjeQZCeunn7AuimP7fI8DJXKFyLf
         xiianxRx7qefQLW+irMjxkJz+V+HigQ/Avutir9+f40ZADOQDlpBiREVe5nWKabau77w
         9yciwVpn4AvUcb5PjG9bJgr5gRgve2ipULWIYNcNoqSesmMSbAJgRVE9Do5qRuPM0lZW
         0n0XK/vI+LWnCkcIA3TrazdWtbm/l5BSWsMX6BcDFCIMfddVZYS1OE5uzWaoeFnh8TFy
         GPcw==
X-Gm-Message-State: AC+VfDx55tmKo872wG9xHIKfw+LWhKCsFJ7M7OdAkl1UTaJarwi4Nju7
        N5IcrEmyVp3KqkoY+EryiX3Q8g==
X-Google-Smtp-Source: ACHHUZ5vGVgTt9sy0qQTKp7+KaWUCWD8M2YRj/4q3fqu6qZXExsSGxGeMKWet0UvuiJIoHRwNhGNDg==
X-Received: by 2002:a05:6402:27c9:b0:506:bbf8:5152 with SMTP id c9-20020a05640227c900b00506bbf85152mr9960734ede.9.1686681141344;
        Tue, 13 Jun 2023 11:32:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id d22-20020a50fb16000000b005149c7b1f49sm6647150edq.64.2023.06.13.11.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:32:20 -0700 (PDT)
Message-ID: <bdd464a1-2279-9019-a19b-4aab5dd6045c@linaro.org>
Date:   Tue, 13 Jun 2023 20:32:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-3-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613125852.211636-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/06/2023 14:58, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 62 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++
>  2 files changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..a81190f8a54d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC system controller
> +
> +maintainers:
> +  - William Qiu <william.qiu@starfivetech.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The StarFive JH7110 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as MMC and PCIe.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: starfive,jh7110-sys-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - starfive,jh7110-aon-syscon
> +              - starfive,jh7110-stg-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
> +    type: object
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-aon-syscon
> +    then:
> +      required:
> +        - "#power-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
> +        reg = <0x10240000 0x1000>;

Extend example - add clock controller, add power-domains to STG (since
it has them, as you claim in the binding).

Make this one example complete.

Best regards,
Krzysztof


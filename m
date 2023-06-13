Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DAEEB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 18:31:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239496AbjFMSbe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjFMSbd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 14:31:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C721730
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 11:31:31 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-97458c97333so957569566b.2
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 11:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686681089; x=1689273089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5thdLVYeuJeTUk/dZICHlBR7keQEdx+TmjFnb0n07Q=;
        b=lWqpp6puRrFsbAwShsKqSraSDgQObj9USYvpffkItesvmaDcgsXF/WGZZ5Y5f921Ff
         1vHZcEY8552gz4V+6UU3jg6GebW8ykbiW2RwL8pH2ZJQUbkiNMWCBGAJhCCwXCtpj4Mn
         UHeXizNVq0XyD/uQKq3JcfuEjqiDsSX+pYgCWoEouDox+C7KP1cjEseLgNgULKtWAAAQ
         qta1fFgpPxUmeLzv8WOaWGA6vxxwrZbM8+JNjwNfYjFbPgVrgdUI+4Xm/bhyl3xszcOe
         37erSN21JN0piPgVvYcQ62/OfHBGc5JX/OR2qWu+4J4fUZxN6VGAKB2gYIRf6QFaWYjE
         DrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686681090; x=1689273090;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5thdLVYeuJeTUk/dZICHlBR7keQEdx+TmjFnb0n07Q=;
        b=Dp0ptS/kUbJd+PUKaY8KCO86lc8Ps5ekl8ifwvNBkOHjDI8qjN2M/x8JMOzQNAIxs2
         gsp2KQH2qbKnq0tRAY1r6mJNee34L86Zg3Fk/OPTv7aImJ5hLXqsBOQHzwo6lwS8CPLg
         xL3Mknrh9FZOig0s6eJX5D62yUQvKN2zvS0W+7A6utNIH82UYa3PdUtGhIM/+FLHKEFX
         /bpcJKakIQlrUYlpLU7C/yQWYqRctKcF9Ch/fq5ky/GPQildXkCKxATYb3sf6nx1Mw81
         bBq/L0YoPkEwB6MDnPpHPRbspJxyU+O+86teg6FvPXsbsWivuTdRu+PTw6ekmY3gXBXQ
         0nBw==
X-Gm-Message-State: AC+VfDxsIXi7jgtH5bO6+SvmoeouctjD+V+qyhYdiPNkz5lPlfEPL7x+
        K8ZJaCmrrHtabEho6L9GlQouow==
X-Google-Smtp-Source: ACHHUZ7FW4zcNCHYDLc8YmIToBwJQq9MRqn3NydANM5LTgdwq836BPniBmMoR6EXg/p91D8iAKdAqw==
X-Received: by 2002:a17:907:3fa4:b0:977:da9d:b842 with SMTP id hr36-20020a1709073fa400b00977da9db842mr13680418ejc.74.1686681089686;
        Tue, 13 Jun 2023 11:31:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id oq19-20020a170906cc9300b00977e0bcff1esm7071095ejb.10.2023.06.13.11.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:31:29 -0700 (PDT)
Message-ID: <7e2d6bfe-5687-97c5-778b-c02e9c0894af@linaro.org>
Date:   Tue, 13 Jun 2023 20:31:26 +0200
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

Where did you implement the results of the discussion that only some
devices can have power and clock controller?

According to your code all of above - sys, aon and stg - have clock and
power controllers. If not, then the code is not correct, so please do
not respond with what is where (like you did last time) but actually
implement what you say.

Best regards,
Krzysztof


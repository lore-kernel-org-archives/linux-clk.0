Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B72FC43217
	for <linux-clk@archiver.kernel.org>; Fri, 18 Nov 2022 16:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242282AbiKRQvG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Nov 2022 11:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242337AbiKRQvB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Nov 2022 11:51:01 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC8D94A4A
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 08:51:00 -0800 (PST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D3AEF3F2FF
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1668790258;
        bh=D7JhrXwjD/BBBqSqzrNVCIT+3QaOVEAS69GN8n0gs5k=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=KDNziP3fPO3np8WiRdyO0CL9VFYuN0SltJ0zKs27M9jZqlezrbVnXyxbVkQ9nz7CO
         7/7oeJaT67cEt2Hpbi5NggGR4Y9E3vfzR1IhnvIJpzDxTrra4PsTjhBD0tmfTTmNf6
         1NZNh3gMA8qmdgYGA/TJpIbLwtyyU3IiYzfK0k5YMJkE5boP9u+xOhysdmBQ+Tj9Rh
         Dqd4CpJRcfEzoCXj06ysQ5DHmYP2/p7QeaY1zQ6of7LzavHe9o/BlZXzTdLjZIvr5d
         qIex18V6vML69hybFtBEex6rkMtkNfKWOScd+BKtljD+2I5BeJLoWObtVymY+JWhF8
         ZZCrrSKE91xvg==
Received: by mail-yb1-f199.google.com with SMTP id 204-20020a2510d5000000b006be7970889cso4979424ybq.21
        for <linux-clk@vger.kernel.org>; Fri, 18 Nov 2022 08:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D7JhrXwjD/BBBqSqzrNVCIT+3QaOVEAS69GN8n0gs5k=;
        b=1QX6yRCbi28eDInBSGDMKJeUA76DfoR7tBfI7ic7AIFL8W57C6/O06WylNHCcqvOFy
         ab2oXnmXQl41nd+ai41p7Kvx6CSMJu8s0kd+0hQkOtEdK36lqDWzEvp4hCjlbhXYWqEC
         n47FSO8GGTHdAWezIebN7UFSuTeesGwITvGReHtjeeOf7W6VCHP/oUvv03vf3N3+RKdO
         IA1s61s0GCW4M5ZWqWL2qC2Y66p+kSkkdc1Z8/u7T0FZDNFXtP3wMwdTLaEXOyBc6xUN
         slrfx8Z6kdDtskrd7ny/gWb3he5DatDHIq9rutUFZMbJ5jLxQ3r5FwGBOO8enS0tvv0F
         GLHg==
X-Gm-Message-State: ANoB5pnSAKmI9/+ysqmwOBnIcDfpzYVUYlSTaiHzP4/O8S/bl1pQf+lz
        9Asdu5UfvPIBuyW44CkHgx2Cd71PGhixsYXn+MsZ2dR2hTz4dnkh06v97b1VkdFG63VnjHnt9hc
        uMqwcx8S4mjolXw9vHnCgyq2gyTqo71HMhC2mZo6Xv0a2sHSDXP5Tyw==
X-Received: by 2002:a0d:cad3:0:b0:36f:d611:a5fe with SMTP id m202-20020a0dcad3000000b0036fd611a5femr7231977ywd.230.1668790257887;
        Fri, 18 Nov 2022 08:50:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4tElp8nJoQLvE/hqWEoMn1u151CU6SJLh+Fi0lqoLGYR8AyP+OgUb500asOPg169mEZCCEMqafDTTt4wcsAHo=
X-Received: by 2002:a0d:cad3:0:b0:36f:d611:a5fe with SMTP id
 m202-20020a0dcad3000000b0036fd611a5femr7231956ywd.230.1668790257679; Fri, 18
 Nov 2022 08:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-10-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-10-hal.feng@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Fri, 18 Nov 2022 17:50:41 +0100
Message-ID: <CAJM55Z_Gq22NiVYHawvjsehL8j3agvp_b2RCgabdTki+ovWa8Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> From: Emil Renner Berthing <kernel@esmil.dk>
>
> Add bindings for the system clock and reset generator (SYSCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 80 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> new file mode 100644
> index 000000000000..a8cafbc0afe2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 System Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-syscrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: RMII reference clock
> +      - description: RGMII RX clock
> +      - description: I2S TX bit clock
> +      - description: I2S TX left/right clock
> +      - description: I2S RX bit clock
> +      - description: I2S RX left/right clock
> +      - description: TDM
> +      - description: mclk

Maybe you could ask your colleagues for a better description of these clocks.

> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: gmac1_rmii_refin
> +      - const: gmac1_rgmii_rxin
> +      - const: i2stx_bclk_ext
> +      - const: i2stx_lrck_ext
> +      - const: i2srx_bclk_ext
> +      - const: i2srx_lrck_ext
> +      - const: tdm_ext
> +      - const: mclk_ext
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive-jh7110.h> for valid indices.
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/reset/starfive-jh7110.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@13020000 {
> +        compatible = "starfive,jh7110-syscrg";
> +        reg = <0x13020000 0x10000>;
> +        clocks = <&osc>, <&gmac1_rmii_refin>,
> +                 <&gmac1_rgmii_rxin>,
> +                 <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
> +                 <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
> +                 <&tdm_ext>, <&mclk_ext>;
> +        clock-names = "osc", "gmac1_rmii_refin",
> +                      "gmac1_rgmii_rxin",
> +                      "i2stx_bclk_ext", "i2stx_lrck_ext",
> +                      "i2srx_bclk_ext", "i2srx_lrck_ext",
> +                      "tdm_ext", "mclk_ext";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeab26f5597c..ec6647e2772f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19602,7 +19602,7 @@ STARFIVE CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Hal Feng <hal.feng@starfivetech.com>
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
> +F:     Documentation/devicetree/bindings/clock/starfive*
>  F:     drivers/clk/starfive/
>  F:     include/dt-bindings/clock/starfive*
>
> --
> 2.38.1
>

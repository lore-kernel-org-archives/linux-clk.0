Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D54C001DC
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jul 2023 12:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbjGMMcQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jul 2023 08:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234752AbjGMMcP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jul 2023 08:32:15 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328D426AE
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:32:13 -0700 (PDT)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B3B7F3F202
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689251531;
        bh=OmJAYdfXr11pAMCyImFxnsohime3j/dmz8eTaaKAUKk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=EeOpKdTeWsUGMegm/tpIcxtC2im00+Rw8yg4uxkIcIu2zO+7WewGTzQOFPuYLW7r8
         +67aAoaPh6gG/Tr6Wc8oy04srXVCRi5TfXpNW/Y+l4NhsXE1e3oNo+bXqfpvK4j9Pw
         2IGe3YCbVfGe2+qM9R03sN8QjrJjF1LlZL6ktSj7SP1E3U0a386dmJEWPyEdY3dNy+
         vfpgTwn93eoqO2jxQKRGU8ZH9x2rO3CZPpH+S3rgdQuBosdMsR3D54zO0Rjro/ujDI
         bzPw3n9Ai9QDNQoAI2eBz8bGCuE63XJxl17hRotOknEO7WnB+35QRhzsv95VbM0hoC
         tnKx2Onhhm3vQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-403a435e333so4863541cf.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Jul 2023 05:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251529; x=1691843529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmJAYdfXr11pAMCyImFxnsohime3j/dmz8eTaaKAUKk=;
        b=WzK7ZiiU9Bl2+efbiuFJKRrgylV1ibmepbyuYJoXToUmQWQvVae5ThnM8/4JAozf+w
         vjdCWqXoKMzYNcLgjAxqxluQAHXvBR+jz2iIG4WRQvpfTzHspPgbKpBRhTaJlkslZlGB
         kAYBNACkia/R8LKOCUeHkgLStRgqAJ8AK/zACJeSH/aaBR3n2EdYjQUbTPXoS3OrMTtQ
         n6M+bHqmZAh7viJqJRiS5HyDEtmxAYTtoUQ3AVllyT9nCkL8ZyHdqA5mmM2RpqGkpjdL
         TYjvK3QbZpb/EmXx0aUP40fdxz3d1zrkEpxWw/xkX5NESGpq+LaqXYIRVWnCcUG06XQs
         MYOA==
X-Gm-Message-State: ABy/qLaq5HxImrNyCQGeefsJ/1EHraPSjWz2W9BZYhKMNg49iE2ZGBh4
        5l/LV79cKAvjywsT00WlqcbYftVWYcHUjehxiFHxPxt3KgGrj5CmK45rKsDKM5Yp3++w/GsoAq5
        56fL3J+PPbojml+LYXmDYXHX3JT/OwPvWopUOrm8psOcp2jTkiWnRCq35RYEWjA==
X-Received: by 2002:a05:622a:13d3:b0:400:9346:bf36 with SMTP id p19-20020a05622a13d300b004009346bf36mr1833911qtk.17.1689251529210;
        Thu, 13 Jul 2023 05:32:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHA5vK3hxfhXcY8G5rQmLZDXTBJyd7aSNs425ysD//K9J5R9Fx3mszf1d/OFc5OhPAt3GVAQ5/HeZZIq31NJYo=
X-Received: by 2002:a05:622a:13d3:b0:400:9346:bf36 with SMTP id
 p19-20020a05622a13d300b004009346bf36mr1833884qtk.17.1689251528953; Thu, 13
 Jul 2023 05:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com> <20230704064610.292603-3-xingyu.wu@starfivetech.com>
In-Reply-To: <20230704064610.292603-3-xingyu.wu@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Thu, 13 Jul 2023 14:31:52 +0200
Message-ID: <CAJM55Z_G-OA_zmYoYueOGgYKMFHjPurJYAypTBw=P4WLkyn9Bw@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive
 syscon module
To:     Xingyu Wu <xingyu.wu@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 4 Jul 2023 at 08:49, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> From: William Qiu <william.qiu@starfivetech.com>
>
> Add documentation to describe StarFive System Controller Registers.
>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 93 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
>
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> new file mode 100644
> index 000000000000..0039319e91fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -0,0 +1,93 @@
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
> +description:
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
> +            const: starfive,jh7110-sys-syscon
> +    then:
> +      required:
> +        - clock-controller
> +    else:
> +      properties:
> +        clock-controller: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jh7110-aon-syscon
> +    then:
> +      required:
> +        - "#power-domain-cells"
> +    else:
> +      properties:
> +        "#power-domain-cells": false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10240000 {
> +        compatible = "starfive,jh7110-stg-syscon", "syscon";
> +        reg = <0x10240000 0x1000>;
> +    };
> +
> +    syscon@13030000 {
> +        compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
> +        reg = <0x13030000 0x1000>;
> +
> +        clock-controller {
> +            compatible = "starfive,jh7110-pll";
> +            clocks = <&osc>;
> +            #clock-cells = <1>;
> +        };
> +    };
> +
> +    syscon@17010000 {
> +        compatible = "starfive,jh7110-aon-syscon", "syscon";
> +        reg = <0x17010000 0x1000>;
> +        #power-domain-cells = <1>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 35e19594640d..58ba04bd0bc8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20127,6 +20127,12 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/mmc/starfive*
>  F:     drivers/mmc/host/dw_mmc-starfive.c
>
> +STARFIVE JH7110 SYSCON
> +M:     William Qiu <william.qiu@starfivetech.com>
> +M:     Xingyu Wu <xingyu.wu@starfivetech.com>
> +S:     Supported
> +F:     Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> +
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Hal Feng <hal.feng@starfivetech.com>
> @@ -20164,6 +20170,7 @@ STARFIVE SOC DRIVERS
>  M:     Conor Dooley <conor@kernel.org>
>  S:     Maintained
>  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> +F:     Documentation/devicetree/bindings/soc/starfive/
>  F:     drivers/soc/starfive/
>
>  STARFIVE TRNG DRIVER
> --
> 2.25.1
>

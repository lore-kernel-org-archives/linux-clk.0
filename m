Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0C4C43334
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jun 2022 10:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236633AbiFHKQY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Jun 2022 06:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236225AbiFHKPW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Jun 2022 06:15:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DBA15A86A
        for <linux-clk@vger.kernel.org>; Wed,  8 Jun 2022 03:03:04 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id o7so7126401eja.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jun 2022 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NKyyO0R/DNBe59uojHSKmle13FrO8LlGaKpDZKb02gw=;
        b=OvE5wtNhJO0yn86Zz3zu3mzyNkKn7fTbPsleOrROptyar67lYp7iBvV0A8rhvLMK0g
         XecsXNhpS5zPcG2cwpy+7acWRYTjicHPWf4iuaFDyd/nF3ooShNIRtRISnJ5IbZNA6Oz
         SH5IG7yCc5V5JU5IBa/7F8VbwwR43osXPnkxCDbO/LK9O6AFNLMTcsV+EjlF32SKGu8j
         43tItwuTySQFLekPq8+NRO3h0frN2k+vqaEJC5O7OsD7nkyd1nahx3PLK6IyFPglpOr2
         bDtEagFdRPBZcDvu5V7V61WrK20ghbDX/Bs6KW5qDYu9qscfSAUGJSFmDP2ytDKQvfiS
         JAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NKyyO0R/DNBe59uojHSKmle13FrO8LlGaKpDZKb02gw=;
        b=UNtHg3MxeZZ1x5dbpXulYbr2kwsOoX7ig/w/9OPGCbrm6CE4FEDZ+KniOdBlpJJck7
         LGvBN17/LuOgE96UXRc7UaM3QjaX2a6qL7nJry6mFoqi2JsTUvmrlhOHf0QdQsLHuFwA
         4FqI6y3LZAHA3mERtiKJ6YTFI/PkbX/rbn8973J6M+3vmD4BbonZpYIiADDQaG4elOck
         NobrI6VEO7tLYKGd8CC2l6ulmSKOXf7P8MgTrJLWqE+cJMdZM9tM/Ix18+t3Y18oILpJ
         4mdceZu2WHfATvUR1sVtLJueHkl4PdZCQJHNJq1hUJv/5nwMuuFIJ3R6BsT7f1yuDl8m
         1F7g==
X-Gm-Message-State: AOAM533tuOeM004bPp/2HCh/Tvevm64QU3M3r8twJ/dGpYV0Ve2rytCf
        PMDZEv2eyULiIYOKUoy4sC8ynQ==
X-Google-Smtp-Source: ABdhPJzV0KH21jeek+JIQQNjs8yfpPCv0lnb9LX8dRez4j3ORgyTDpTexd8DT7y+4Qfu8ickVNGoXQ==
X-Received: by 2002:a17:906:9753:b0:6fe:dece:982a with SMTP id o19-20020a170906975300b006fedece982amr31180089ejy.560.1654682583385;
        Wed, 08 Jun 2022 03:03:03 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906590100b006fe97996423sm8869782ejq.219.2022.06.08.03.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:03:02 -0700 (PDT)
Message-ID: <f4899b6d-fec3-5940-709a-f5fbc7ae6233@linaro.org>
Date:   Wed, 8 Jun 2022 12:03:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 06/20] dt-binding: clk: npcm845: Add binding for
 Nuvoton NPCM8XX Clock
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220608095623.22327-1-tmaimon77@gmail.com>
 <20220608095623.22327-7-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608095623.22327-7-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/06/2022 11:56, Tomer Maimon wrote:
> Add binding for the Arbel BMC NPCM8XX Clock controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/clock/nuvoton,npcm845-clk.yaml   | 63 +++++++++++++++++++
>  .../dt-bindings/clock/nuvoton,npcm8xx-clock.h | 50 +++++++++++++++
>  2 files changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
>  create mode 100644 include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> new file mode 100644
> index 000000000000..e1f375716bc5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/nuvoton,npcm845-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM8XX Clock Controller Binding
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +description: |
> +  Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller, which
> +  generates and supplies clocks to all modules within the BMC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm845-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 25M reference clock
> +      - description: CPU reference clock
> +      - description: MC reference clock
> +
> +  clock-names:
> +    items:
> +      - const: refclk
> +      - const: sysbypck
> +      - const: mcbypck
> +

I asked what is the suffix about and you replied "ck"... ok, so let's
make clear. This should be:

    items:
      - const: ref
      - const: sysbyp
      - const: mcbyp

or something similar, without the same suffix all over.

> diff --git a/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h b/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h
> new file mode 100644
> index 000000000000..229915a254a5
> --- /dev/null
> +++ b/include/dt-bindings/clock/nuvoton,npcm8xx-clock.h

Same comment as before. No changes here...



Best regards,
Krzysztof

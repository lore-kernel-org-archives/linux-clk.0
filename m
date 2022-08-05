Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D18C25B08
	for <linux-clk@archiver.kernel.org>; Fri,  5 Aug 2022 09:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240497AbiHEJN0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Aug 2022 05:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240475AbiHEJNV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 05:13:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88B478206
        for <linux-clk@vger.kernel.org>; Fri,  5 Aug 2022 02:13:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t1so2562194lft.8
        for <linux-clk@vger.kernel.org>; Fri, 05 Aug 2022 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1YjciTp42v6B8MpUc3bNVR0+p597jmP1NofHHP0CW5A=;
        b=G+mXJvAK1kPPno2wsq/kuteBFt9rHaI3XejdqGG+vSGgabb/tWi6KkiARj4ncVr30H
         ozH8qcFU3E/N7VoT6+mvc1W/5DSc5mJ3pS7J4NaXRpqM1Oozjfa/1quzdWqRFH3xe00M
         Bl5gXBKCSD88+0dY5qYrxekCNmIS7ndOGQilK5JC9XTE0uX7rqY1w9JKmyaCUSkAHcHD
         04CX/swFSCUCtv/wQbqdwNTzIzRLXvrGb6vesKSkdIZURhGXwcGsqTlObd8sobGh0+8F
         N6wOp9h/YH3NZHAgbZKWG8vPOhoM7SrHQh5fIgFWsTda0l9RaJpgRE92Pvq5cvqP5+6Z
         nlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1YjciTp42v6B8MpUc3bNVR0+p597jmP1NofHHP0CW5A=;
        b=aUGyMhMQ31LDptPk1EgyQ6eZHYHfeiP503f4unIWDyKUHoWJhaeQQZMU32mQxS9iQy
         zxfXh8SX8/l2zRf+r9YXz4tUu7pRRWp05a9GKt6MhX8Qt9uvCfEAANBfbtPBJf7B3uY6
         bFVN0AYdU+UMRFBFEMbxgVGtBLJ0EFwIWyvCwCy9/hm9jMI1w3x+XHls5Ds3aVqUJoJO
         t5sA0bioB/WPCtHKF0eQRs9h3zD1Jgl+4FrxyqgZ7BJUAc1joiA/cod0gCh86+k/S8uC
         zYCFvBKDxib9hhgCNKjJK+aSCCpmPUcbnlqq+uRkxGEpFso3Fqcq/VToLMWGdGsGRuNS
         6BMg==
X-Gm-Message-State: ACgBeo25PLZjeRqAU4tSJtqugstElYgbvDRiB9GIlpM/RbVLvdvdwyZl
        Uo/7CIUsKtk4oCqlrhni+bxqhG/wh0DTH+sQLUg=
X-Google-Smtp-Source: AA6agR4bULYrPCXU3n8gQGnJBTOftjBg7+4i0kVjoCT2OP2w4PZcyJyxhpxAhpaVtFgNcT5U4DyRxw==
X-Received: by 2002:a05:6512:3b8e:b0:48b:23c6:9b0 with SMTP id g14-20020a0565123b8e00b0048b23c609b0mr2164925lfv.470.1659690795468;
        Fri, 05 Aug 2022 02:13:15 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id q1-20020a2eb4a1000000b0025e6d665a3fsm409199ljm.18.2022.08.05.02.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:13:12 -0700 (PDT)
Message-ID: <370378a9-4341-30fc-79b0-57ccfa7f3def@linaro.org>
Date:   Fri, 5 Aug 2022 11:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 1/6] dt-bindings: clock: meson: add S4 SoC PLL clock
 controller bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-2-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805085716.5635-2-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/08/2022 10:57, Yu Tu wrote:
> Add the documentation to support Amlogic S4 SoC PLL clock driver and
> add S4 SoC PLL clock controller bindings.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   | 30 +++++++++++
>  3 files changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> new file mode 100644
> index 000000000000..079ae905b69e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson S serials PLL Clock Controller Device Tree Bindings

s/Device Tree Bindings//

With above:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

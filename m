Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F923C61DB3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 11:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjAML3B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 06:29:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237909AbjAML14 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 06:27:56 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4386187F30
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 03:17:40 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ud5so51590892ejc.4
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAHsl98CG/fDYP0sHTVVPevitb6k0mLO+y4UR5S17ws=;
        b=rO55n1kXDBRrBIHjuqo1touxvhO5hNjfwY90pyGz0sCM3W/856cTLNOOYRKpX5PcGL
         rSQgkH1xRtwXkjqISOn+99ma+tsjgFJb9qRjuOt861vmBfi0nRX/iXf3oyWgf3y9cdGg
         aI+CeupWYwoiNaT38kIOj7+2YapQGpuYrrXcXm+X79LTvAMFPw2Nb/beIiEpBsljbRtQ
         6FwtNAZEo9j6JOSaxxTHi20/Um9j76HYDTe6yntvAmm15YTsvOlmhpWm+/BZKEPFpMOS
         4J9mKOw95UKB27KbRnt13xpOVEA+n+6eIISbjDU/l87yt+IELSShkK94r7gHnK5iLuVJ
         E8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAHsl98CG/fDYP0sHTVVPevitb6k0mLO+y4UR5S17ws=;
        b=EsMS6Nfl+RvdvPPmwvu7KI6FM0v99CxoiWY6RXl0hVMKpBNnDF6LuzEmNYJYCZDUXf
         ZX6jJ6AptjWfMelYRsORqVCwKuRGYDMbQlrFOu5Y7XEq+GatX33k5Jid/1T5JBHZIndc
         B5YtuaNrzlbP1wD32RZyGxV6hWhugZl10QWpO6pJ/jq+SQ6mdaGoG50MWoPN/LkQ4BMJ
         qOhF86/xmn/feH2yaAoCGZo/uiYqMMcV8fMqMeNTt/l8tuRob+8MOm8umFPxjfxa+3Kc
         4Cw+xeThp5If26yUT9b+PWpjLd5Xfq031fus1lhVE6vBBwd+ZFy2sVaJRHoO27h5PhmP
         1KdQ==
X-Gm-Message-State: AFqh2kpLB21DeaPgtGU7DP6OXPyqheg35L0uMZz4Dulz3T8/koOBwCGB
        8Cl9XwXPbvyjc6TBSwLVO4saPw==
X-Google-Smtp-Source: AMrXdXtK7YAEGRUOWzs41epBgJvNi/mOK9+XEuk1w/FCzjBdpqY4FoD7/7XhR3QePTmT+MlmLRnvTg==
X-Received: by 2002:a17:907:73c1:b0:7c1:2868:65f1 with SMTP id es1-20020a17090773c100b007c1286865f1mr61779721ejc.72.1673608658631;
        Fri, 13 Jan 2023 03:17:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u13-20020aa7db8d000000b004833aac6ef9sm7996567edt.62.2023.01.13.03.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:17:38 -0800 (PST)
Message-ID: <63fdd223-c5e1-302d-ffef-9e582874e938@linaro.org>
Date:   Fri, 13 Jan 2023 12:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add binding for Loongson-1 clock
 driver
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230113110738.1505973-1-keguang.zhang@gmail.com>
 <20230113110738.1505973-2-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113110738.1505973-2-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2023 12:07, Keguang Zhang wrote:
> Add devicetree binding document for the Loongson-1 clock driver.

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

Subject: Drop driver, not related to hardware.

> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  .../bindings/clock/loongson,ls1x-clk.yaml     | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/loongson,ls1x-clk.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/loongson,ls1x-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls1x-clk.yaml
> new file mode 100644
> index 000000000000..4709c6757f1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/loongson,ls1x-clk.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/loongson,ls1x-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 Clock Controller

Wasn't this already sent?
https://lore.kernel.org/all/20190130194731.GA25716@bogus/
Then this is a v4? Aren't you duplicating efforts (and reviewers efforts)?

> +
> +maintainers:
> +  - Keguang Zhang <keguang.zhang@gmail.com>
> +
> +properties:

compatible is a first property.

> +  "#clock-cells":
> +    const: 0
> +
> +  compatible:
> +    enum:
> +      - loongson,ls1b-clk-pll
> +      - loongson,ls1b-clk-cpu
> +      - loongson,ls1b-clk-ahb
> +      - loongson,ls1c-clk-pll
> +      - loongson,ls1c-clk-cpu
> +      - loongson,ls1c-clk-ahb

Are you registering single clocks? It looks like. No, make a proper
clock controller.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - "#clock-cells"
> +  - compatible
> +  - clocks
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clocks {

No, not really related to the binding.

> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        xtal: xtal {

Incorrect in this context. Missing unit address.

> +            compatible = "fixed-clock";
> +            #clock-cells = <0>;
> +            clock-frequency = <33000000>;
> +        };
> +
> +        pll: pll@1fe78030 {

Node names should be generic, so "clock-controller"
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +            compatible = "loongson,ls1b-clk-pll";
> +            #clock-cells = <0>;
> +            clocks = <&xtal>;
> +            reg = <0x1fe78030 0x4>;

compatible is first property, then reg, then the rest.

> +        };
> +
> +        cpu_clk: cpu_clk@1fe78034 {

No underscores in node names. Anyway this should be gone - make a proper
clock controller.


Best regards,
Krzysztof


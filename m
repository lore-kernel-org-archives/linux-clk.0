Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1852C77B70
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 06:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbjDQG2z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 02:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjDQG2y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 02:28:54 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E473DA6
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 23:28:52 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id xd13so27348879ejb.4
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681712931; x=1684304931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FWt4j1Xyr69lbkAY813rpWiC/cGT82L+jMmEMr4HTcs=;
        b=loFYBhfJt3dyjdU6SBduolRdS1nAAbq6hyS4FSac/F2myypjS70HKvGuQwokG9V/zn
         lXP0WUl2QXmJ78Kxu6XsdtICqQp4evc0ovNa42HG/FK9qpAGMuxZeg7dqFMZNkfO7WsN
         bqFRdzxoeIkLSay0RyFZ3R4AsYQXRbwTrRVD3LC8vITg7SrTvi7Wg4xt1v58+/hVkiLD
         n+f/GWS21UZ6s0dCcqeeKxb46yY1uTzr8hA5X8L4yinlEhiAQa3ylZ/auPwYvoYhXlsH
         AlUwd4BeXZEFqbid2ttprh/XTf7wrOkG2vOTBftRHrwNJ/n+aJLIKs/NIGHmsK3O8zMS
         NVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681712931; x=1684304931;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWt4j1Xyr69lbkAY813rpWiC/cGT82L+jMmEMr4HTcs=;
        b=bGnz6xICiyk5bsN82YbtDxx7A/kN6JO19fpTF/vAraxsQrxeSWOFmxTelZfEf5X3sk
         MTBVh2t/9n1N76XUe5w9HrbeNqEyJIUZoFvQ5/LhlfixnjJtSY1Uxub1WwIPjpB2S0zx
         10d0yP8oyXJ3+I4M22pzk3HlQrzS5SReNK6/0zPqVEmcSByDlBxdyFLBgLW2AxdSETed
         4C+Ff6EtU/Ss0cCtqxhhi5I5Xc4tqfOQkdhHpA9gMu8Ms0ws7ybm2nGqOd80KeafgR6V
         3ztYiRVsRP4+6scEhSBb/iqll/8a7ga9Y7JMLEN9faIj7rxhgOlEqPSzxTCh3weXOPPq
         9R6Q==
X-Gm-Message-State: AAQBX9fzaXIP0T+nuw/6igiUpkbxM0I5fGxhtv2z9dUbDvyHIBsms2n1
        inTLgAlhfoJK2cajKQG/ejj2lw==
X-Google-Smtp-Source: AKy350aPIsKVFkNiUYJXoHhG85Ys1PSKY6PHLsNIO+VEZ20BRm9+qEcx56PYrkYAQUr7BtBudyZwJA==
X-Received: by 2002:a17:907:1c26:b0:94a:921b:c805 with SMTP id nc38-20020a1709071c2600b0094a921bc805mr8296953ejc.45.1681712931432;
        Sun, 16 Apr 2023 23:28:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b0ac:4d3b:966c:b33d? ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id la19-20020a170906ad9300b0094f8ff0d899sm525244ejb.45.2023.04.16.23.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 23:28:51 -0700 (PDT)
Message-ID: <dd3efedd-54b8-5d10-397f-4c7c2a62d3a2@linaro.org>
Date:   Mon, 17 Apr 2023 08:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add simple-clock-controller
Content-Language: en-US
To:     David Yang <mmyangfl@gmail.com>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230416194624.1258860-1-mmyangfl@gmail.com>
 <20230416194624.1258860-2-mmyangfl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416194624.1258860-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 21:46, David Yang wrote:
> Add DT bindings documentation for simple clock controller, just a
> contiguous region of multiple clock registers.
> 
> Signed-off-by: David Yang <mmyangfl@gmail.com>
> ---
>  .../clock/simple-clock-controller.yaml        | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/simple-clock-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/simple-clock-controller.yaml b/Documentation/devicetree/bindings/clock/simple-clock-controller.yaml
> new file mode 100644
> index 000000000000..3d9b436b0ef9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/simple-clock-controller.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/simple-clock-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple clock controller
> +
> +maintainers:
> +  - David Yang <mmyangfl@gmail.com>
> +
> +description: |
> +  A contiguous register region of multiple different clocks. No operations are
> +  required to enable or disable the clock controller.
> +
> +properties:
> +  compatible:
> +    const: simple-clock-controller
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  '.*clock.*':
> +    type: object
> +    description: Clock devices.

I don't know what improved here... this is still without any refs.

It looks like you ignored my feedback from v1 and maybe v2, so respond
to each of it.

Best regards,
Krzysztof


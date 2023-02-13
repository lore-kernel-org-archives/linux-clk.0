Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877CBC64EC4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 11:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjBMLCF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 06:02:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjBMLCE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 06:02:04 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BA4C170
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 03:02:03 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id o36so8427646wms.1
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WzWyArS5gEO/wRc+fU03BRey5p9sqIym9cvOO3Y6eU=;
        b=zTMeYc9cO7mscsDds2h1TZLFUu8Tl/dWC1eLhgkAYD33QzKi6lOyFZCe4+5knSiBwW
         XR9UNZ7XsvjvO+JG615egdZseIchSL73cinaBanQbKXDwrgW6dI+LJeA0+4BOQMu1/PF
         v9zI5YVn0kLkc96zUF45F0XddOourilUsjqZ5szNWdTcjvKSgFQ7Kr49GHZCMqFk8XYo
         6nXIBHRxVldefmfy3uIgJCqG2AYHb6yEFGpeYNwKl0qVOBfBX4MJGRdOwPOuRWvjK2iH
         i+aPALN0LvPGF6CkeuXz11c6z1jOZewTHifzj233mIEG8CXKDMNEdNxzgiLC/bHO7oc6
         XePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WzWyArS5gEO/wRc+fU03BRey5p9sqIym9cvOO3Y6eU=;
        b=Op6lnKmSRQsYvQHxfpm6TZgwc9zcVG8Tj7f80dbgUt+SLAZJtP736tDMgaW4HnF1ub
         IvvgedkoXKNJSqYB05ThtoHdyFWwzl8H8mtjt+TinOUQoqnvVIF618cI14J8Jj7H8NhB
         6R9XFgvImtHFx6UXTJAIjFi33kcH8+bj5ZVaUEO8xbA5N9wAPeDlVKhkvS9hCMJLcDqj
         vUlzVZd7Uk/0thII8yABbFgQufJEC5EDtgrK0Ibc2MfALfObLP1XWMjhVw6dFtCVbflX
         bMDiTRgAoEkYMDLUM9/ROI2rHSfMnACjmsrZ4q3C6VU9jYfTVldZ2FCQJEK612nMlNlT
         t0cg==
X-Gm-Message-State: AO0yUKWduYt7n3p/zzW23uZ/X8fc33X56ZhxzpzuYuI+gYiAND3G7Lf2
        vF7WqdcXWSryUYTg8S2+tacfWA==
X-Google-Smtp-Source: AK7set+QKXqhsOFrxdGsWPqrhu0Ju0VH7kga/YlH2Hs/FF4nhofUvdKD5RlJPyj/WOB3XGC6kDFFXg==
X-Received: by 2002:a05:600c:30ca:b0:3df:c284:7e78 with SMTP id h10-20020a05600c30ca00b003dfc2847e78mr20536285wmn.38.1676286121946;
        Mon, 13 Feb 2023 03:02:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c310a00b003e1e8d794e1sm4719972wmo.13.2023.02.13.03.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:02:01 -0800 (PST)
Message-ID: <4b8e3164-f39a-c559-7bac-86c4fdcd6834@linaro.org>
Date:   Mon, 13 Feb 2023 12:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/6] dt-bindings: soc: amlogic: convert
 amlogic,gxbb-clkc.txt to dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-4-c4fe9049def9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-4-c4fe9049def9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/02/2023 14:41, Neil Armstrong wrote:
> Convert the Amlogic Clock Controller bindings to dt-schema.

Subject prefix - clock, not soc.

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/clock/amlogic,gxbb-clkc.txt           | 53 ----------------------
>  .../bindings/clock/amlogic,gxbb-clkc.yaml          | 51 +++++++++++++++++++++
>  2 files changed, 51 insertions(+), 53 deletions(-)


> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xtal
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +unevaluatedProperties: false

additionalProperties: false

> +
> +examples:
> +  - |
> +    sysctrl: system-controller@0 {
> +        compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
> +        reg = <0 0x400>;

Drop the parent node, not needed here. You could even skip the example
entirely as it is part of your syscon. If you keep example, then without
parent pieces.

> + 
> +        clkc: clock-controller {
> +            compatible = "amlogic,gxbb-clkc";
> +            #clock-cells = <1>;
> +            clocks = <&xtal>;
> +            clock-names = "xtal";
> +        };
> +    };
> 

Best regards,
Krzysztof


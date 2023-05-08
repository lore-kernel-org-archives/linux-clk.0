Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D086C7EE22
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 16:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbjEHQWn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 12:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjEHQWm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 12:22:42 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC866A6B
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 09:22:41 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965cc5170bdso654678666b.2
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683562960; x=1686154960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMEF0WSJvUh33vaUqnZYN4TcD7T+ib2FTpwoVdwEQJo=;
        b=l/NIc/dsRNlSKhlTsW9bWkIrz9i6BS17/75HwbDRDSKXuwaanmMEAWkIh5U6NpJtAS
         HTry0AGsF8CVTZuAmRklP+12M1w0nshCc207Bh7u0WFZJGgNwkQLJlYUtj6QzlRJrnEi
         yk7/FPWPC8JjoN8d+EvdosHsMd77HfsA2GmW1yj6DFw90KfBgs4RYTreMId5iWLZD5KA
         0OA/he+wy4/rVt7sZSo8/lHF5/9gWNqRGLTdykyRxUbMhcjkX8R1n5egOsZDHEdTuDEf
         4H+GUUc4Ho/xgMsZpg5Fm4mz09qhczMWpPJbYhR0AqY2O3HQiJBKSd8BSTnLqbdc5pu/
         MrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683562960; x=1686154960;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMEF0WSJvUh33vaUqnZYN4TcD7T+ib2FTpwoVdwEQJo=;
        b=l9FDBtJp/GcIvM9SAHyCm3+JTMG9vs6gdAfvmtwfM0gV5heMwKdPwEDRRL6MXEtWTC
         Q5jD8VlbEaHTwc9vhP7ks2Tb6VFwNJ7zvdpFf2lriHi5AE10sw4NCHQ412bKgIPAJZrQ
         U0Yf8pkoFVK9+wLSfkjuV9w82fsKcmijkymjMEJ8khIIwpG/8rg4i8G53jKZAK0TLoh8
         Or1Bk6UjLMp4zXoX9HSJLtIW9ytzcYiRH0Kt39Sj4i8T6Zi6jro7e622v3G22wgzn7qN
         WrUlxMrth6WzJdOyJhhxw9RKFmwsuAkJWn/2hdWPigPv6KzjsPHV3fen8Y9dcZcafDuv
         QmVw==
X-Gm-Message-State: AC+VfDygYV28PaqNwba0rWM8qUXVu+QjZ52skhf98vLc40XsOQOs/ySj
        o3kuD28+EsmjMuF8D0VT/oBSog==
X-Google-Smtp-Source: ACHHUZ5Semx0Qyf5W4lNDrOleMZGsYp1D2/sYQew3pVB4wfxYzRezsyJGhLL2oFddoN1GwGMiuNvJA==
X-Received: by 2002:a17:907:a409:b0:94e:ffcb:b15d with SMTP id sg9-20020a170907a40900b0094effcbb15dmr9564296ejc.71.1683562959901;
        Mon, 08 May 2023 09:22:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id ty20-20020a170907c71400b0096621340285sm141283ejc.198.2023.05.08.09.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:22:39 -0700 (PDT)
Message-ID: <095239ec-973a-c333-b7de-28b573e02422@linaro.org>
Date:   Mon, 8 May 2023 18:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/5] dt-bindings: clocks: atmel,at91rm9200-pmc: convert
 to yaml
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org
References: <20230508104801.445261-1-claudiu.beznea@microchip.com>
 <20230508104801.445261-3-claudiu.beznea@microchip.com>
 <168354524853.789265.9741363586759296275.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168354524853.789265.9741363586759296275.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/05/2023 13:27, Rob Herring wrote:
> 
> On Mon, 08 May 2023 13:47:58 +0300, Claudiu Beznea wrote:
>> Convert Atmel PMC documentation to yaml.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>> ---
>>  .../devicetree/bindings/clock/at91-clock.txt  |  28 ----
>>  .../bindings/clock/atmel,at91rm9200-pmc.yaml  | 154 ++++++++++++++++++
>>  2 files changed, 154 insertions(+), 28 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml

These can be ignored.

Best regards,
Krzysztof


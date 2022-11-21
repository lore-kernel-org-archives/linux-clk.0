Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D39C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 08:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiKUIrp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 03:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiKUIro (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 03:47:44 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C998E27B0A
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:47:43 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d20so13670979ljc.12
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O63hibjYAlrDnPNGTBFzJzkRraoluFL/kguca7bLrYo=;
        b=EltU4fn2WwltWnxGtHI95UcKp8i7eq+YAlW2jT4kEfKWGeet48gr7Oebr6G+/JeJSN
         k4nMJuCyQYSLAT3mCXCYXA0vJsbMZ0chZryjsRemEqhgCF5D/hp45PV24S9hXquP2v2i
         7rroPLe7bCePychqzc4/nlgOSvGkHpxK6H6Zl/n/9H993Eg1Jvn1/CNXT7kq2og5Nx2C
         /qENFve7xFzUK2ed0IXworEBRL/XR3xLN7GDis8GrvEyXRcEOeen5BaRKHVyix0FJR4a
         /yoU/5sWtY42qhHP+t1+gnxEtXkA2T98wQCfFW91rGLMwhH571k3q1MI7/wZOQSBiBnF
         P5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O63hibjYAlrDnPNGTBFzJzkRraoluFL/kguca7bLrYo=;
        b=Q61/Rel2O9RLiFEaZvBVRs5HI151MRjKbtnl6YaHo8iu3eVod8g6zNfn+HX6piK2g0
         Mq2j859wUZFQZ4xf+0F3gbop1ocInEE4FQ6Z4iWfBisozQl7cUSbp8Sicqz094JmWNXA
         37qEcJm07zt3uqAvgcRmXI8PS0w40OOGqZKA5/XHK+riTA7E0sEj5G8y92KELRca6I0T
         vMvNZ4dQSx+pn5PIM5sjqGZK/jRwRutGUYqIpCvsIGHrpEheF1uOqFOKs0forhAwe4tC
         UvwOHciIy6CHBJlj8R/QD90ElcOKLO1a4+29TU/xU1A0X8bec78F4M+w0+Uw6O3o6BT/
         D43Q==
X-Gm-Message-State: ANoB5plFhT4Nic0WReaP+uctSHT9Lw9mkO/KiOj1sWvlBa6t7PKUiO42
        yFpMQZSDJznp9OYuw0P+RWPCjg==
X-Google-Smtp-Source: AA0mqf6CP55rs1V20Qglel+czmAfoGR50CNjnpZfVEcHfcsCVlMnJzzXwnIjMoW1Yz0V7922SH02+Q==
X-Received: by 2002:a05:651c:158a:b0:26f:c160:6dde with SMTP id h10-20020a05651c158a00b0026fc1606ddemr5035948ljq.20.1669020462193;
        Mon, 21 Nov 2022 00:47:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t9-20020a056512030900b004a05837103csm1923980lfp.196.2022.11.21.00.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:47:41 -0800 (PST)
Message-ID: <c75d1799-d7f7-d461-b412-27c084357c99@linaro.org>
Date:   Mon, 21 Nov 2022 09:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <CAJM55Z_Gq22NiVYHawvjsehL8j3agvp_b2RCgabdTki+ovWa8Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJM55Z_Gq22NiVYHawvjsehL8j3agvp_b2RCgabdTki+ovWa8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/11/2022 17:50, Emil Renner Berthing wrote:
> On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>>
>> From: Emil Renner Berthing <kernel@esmil.dk>
>>
>> Add bindings for the system clock and reset generator (SYSCRG) on the
>> JH7110 RISC-V SoC by StarFive Ltd.
>>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../clock/starfive,jh7110-syscrg.yaml         | 80 +++++++++++++++++++
>>  MAINTAINERS                                   |  2 +-
>>  2 files changed, 81 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> new file mode 100644
>> index 000000000000..a8cafbc0afe2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>> @@ -0,0 +1,80 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-syscrg.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: StarFive JH7110 System Clock and Reset Generator
>> +
>> +maintainers:
>> +  - Emil Renner Berthing <kernel@esmil.dk>
>> +
>> +properties:
>> +  compatible:
>> +    const: starfive,jh7110-syscrg
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Main Oscillator (24 MHz)
>> +      - description: RMII reference clock
>> +      - description: RGMII RX clock
>> +      - description: I2S TX bit clock
>> +      - description: I2S TX left/right clock
>> +      - description: I2S RX bit clock
>> +      - description: I2S RX left/right clock
>> +      - description: TDM
>> +      - description: mclk
> 
> Maybe you could ask your colleagues for a better description of these clocks.

And drop "clock" from previous descriptions. All these are clocks, so no
need to repeat it.

Best regards,
Krzysztof


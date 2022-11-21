Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5012C43219
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 08:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiKUItK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 03:49:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbiKUItJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 03:49:09 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68597C004
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:49:07 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h12so13694313ljg.9
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVT43T/dHnFe2fySXLzb5zjQ/wmCHIUhX9kGLd6O8bg=;
        b=m7YEpSdoPncIay7CK55dZamOK33iC41fbxI561jsG8EtQOA/NW2Vp+Ys1Qt0NFmitZ
         TXx8mFQhSTfbpEJ2aDLtvWWLUdpGTb2ktCgqBKMi9d5IchW6xLsTaQavafYkRx4sb135
         BoQyKgxloiHckVgNKcB4BHrc/bfpPo4GBQL11STHd+81mYBQWskdvXXsAxW68mC4RNCW
         tpP4QdID8cFLxNEdUUXaOHTS5u8oHNpr+Xg64BVPBShhUPi/ZWAnS2YxaTTa0CdeIZlW
         5YsXs+vXT8OrojWiDUG4qp0kJ8y+ukUk0ePHkPQvNsmf1rz6icdokA3IUkoFvZo8xXq5
         9JFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVT43T/dHnFe2fySXLzb5zjQ/wmCHIUhX9kGLd6O8bg=;
        b=UtJ5T+5afS0r2XkssgKSaKpIa5OSkIOHfetDKyPml0Kyrh4N99ugjF8Gr+DsVNqZqa
         wHqj9qZOHiv8jWRIELg9w6/mEicPb24lpLC+A4ZKEHwGUo8QDCSYwURhpv4iZQAc6Tmj
         +6gyCBLQmKlNn1EGM/l/giJHWGa9cV7hNSdFsDd2qReyumQ18+BGuDagpYwe5TifmXD6
         fsr4iWb8QaBj6N3HERowpVbAosw+ucmk0+zRHfRtJpIG6eciW8Y26XeYC2vtqy/0VzRH
         3NFoEPba9cklvnXpMFF0OkS8rLej5VLEdmaEPChwOzcdn1iAmCUPcUABfbF15cUt/A0i
         loPA==
X-Gm-Message-State: ANoB5pmL1+cvfgmulYkt0M3mvqwBO23EX6vNJCkBu69hciNl4U4XLtkU
        IYDHuGOrp3iwIMXdFsf+KXc/qQ==
X-Google-Smtp-Source: AA0mqf5kutEIoaxtevDmPqDbnLgxJ+m8XshHejRbM21MKTWUvRWlYZn6/xrxrWSEwZDb/uwiQFbWjw==
X-Received: by 2002:a05:651c:32b:b0:277:8d3:4298 with SMTP id b11-20020a05651c032b00b0027708d34298mr4891897ljp.302.1669020546204;
        Mon, 21 Nov 2022 00:49:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m22-20020a0565120a9600b004a608ec6d8csm1938901lfu.27.2022.11.21.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:49:05 -0800 (PST)
Message-ID: <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
Date:   Mon, 21 Nov 2022 09:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/14] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Content-Language: en-US
To:     Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-11-hal.feng@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-11-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/11/2022 02:06, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> new file mode 100644
> index 000000000000..afbb205e294f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Always-On Clock and Reset Generator
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-aoncrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator
> +      - description: RTC clock

Real Time Clock clock? :) I don't think the input to clock controller is
the output of RTC...

Best regards,
Krzysztof


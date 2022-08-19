Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D6AC32771
	for <linux-clk@archiver.kernel.org>; Fri, 19 Aug 2022 12:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348922AbiHSMpa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Aug 2022 08:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349066AbiHSMpO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 08:45:14 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C91A100F25
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:45:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z6so5967755lfu.9
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 05:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qqffeJ1cELkTvZi2yVxU+KEC+V9oMcB95umfP5C+/ms=;
        b=C0gCvt6FGl2dkLGc++ML4O+KSqvWSCQnKOwA9F5j3zwkJOsDpb2jOMd2PfEsq/TyRW
         lNxrVzNySX24r+5Vs1PXCzbOltRSDmMaCPqRv8vpqFqkDjqex2EgqF4zv5XAuO95nBDy
         WiJcuwyKZCyjxBwDw3q8F6HTLNIPapWU63m6yXKuohaY0aD3oWRQ2svfuhijls0dSy+7
         pZZ4t6quHgFo45JY9FIics9N+MpO670rTh/pTjPAjOP3SOAb7RYBZO4CglNALOVrhPJk
         oQt5uxxhVE1lBLUu6tiD2WvUCkfWsqZm3zMjGOXm468VqMMUMvnFsvfKJi4ck5ZLHoK/
         tkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qqffeJ1cELkTvZi2yVxU+KEC+V9oMcB95umfP5C+/ms=;
        b=WvQriYy/iJ7Hh/pGz8BMPh8XFnFUD0CfXd7ZX5DIM2edOd8+cye+jCtRxfgrK0/Vcb
         zrxj98GsXGqX/INzyvH0GInC3AV7PVmu+r9Y1YnioK/uEFA0ipP2Yelgg2pQ8ICdCxQ1
         8pagO2G0xkPQmmPJDD9GZIxUoc8MCGjkTCpwhyuEbSvBv5LIijgVgmThy++YluvNVRez
         rVsdhbBtDbGRQK5AizmFKc2t7E2hBLY/mYzyPtllEeFOsxSsSzjtfQKSyL7qoWVGY/qt
         DZ19q5HCUEZg9q44QlmMwiCUSiDqyL8pERvcRlftTZZhXvY5kvcZiR6IQ015X7lUuxOm
         wVjw==
X-Gm-Message-State: ACgBeo2G41LYEeWkQNY+a7D36gkc0/7dUxboWMPTcepR4cGY2tz+k8G4
        aDVGD300Jk7HVDacerFUw2lW0w==
X-Google-Smtp-Source: AA6agR7/PRkYQLtYE0l0kOSX2qoSLm7uckRWBd/nF3eYbhF9x+nTNIyBDipk1CoYBEgaYkztlr74kw==
X-Received: by 2002:a05:6512:282c:b0:492:b415:6def with SMTP id cf44-20020a056512282c00b00492b4156defmr2503429lfb.615.1660913111394;
        Fri, 19 Aug 2022 05:45:11 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id t5-20020a195f05000000b00491734dcb89sm624998lfb.196.2022.08.19.05.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:45:10 -0700 (PDT)
Message-ID: <0976b1c1-a8e0-5a61-51ff-9b47f29569a5@linaro.org>
Date:   Fri, 19 Aug 2022 15:45:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/6] dt-bindings: clk: document PolarFire SoC fabric
 clocks
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-3-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-3-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/08/2022 15:22, Conor Dooley wrote:
> On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
> ordinal corners of the chip, which our documentation refers to as
> "Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
> highly configurable & many of the input clocks are optional.
> 

Thank you for your patch. There is something to discuss/improve.

> +  '#clock-cells':
> +    const: 1
> +    description: |
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell.
> +      See include/dt-bindings/clock/microchip,mpfs-clock.h for the full list of
> +      PolarFire clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ccc_nw: cccnwclk@38100000 {

Node names should be generic: clock-controller

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

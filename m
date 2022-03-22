Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA48C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Mar 2022 08:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbiCVIqu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Mar 2022 04:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbiCVIqs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Mar 2022 04:46:48 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047015591
        for <linux-clk@vger.kernel.org>; Tue, 22 Mar 2022 01:45:21 -0700 (PDT)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 818313F1D8
        for <linux-clk@vger.kernel.org>; Tue, 22 Mar 2022 08:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647938719;
        bh=neGecA7HBSwD46fG4cAmxThQpgGejbSlPRN3sQKWp0I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=AinNeP/Np4LDGSGmGCD2N07ltqHIzok5a/Mp3FevBAD+z4yHnCBGpc4aIZ6Lr3r7S
         fbBVO1UMse4ZaBJWnex1uCHllZFK9CQO6sgA1cTbPZdCe5L/ugx7qlVs0cWtYjEN9K
         cH5q6F9+U37lK5McWiAgucQKMy3k2ZbnA3qdC54hEzn2V9SiCIdTG63jMBFTW0cBrK
         ZfcS/AkLXu31awg16KEkDiJi8BwzLU49TXvAzz7yzd7O6QD5Rm6Q1MGjUQWZQowuW8
         PFdScq41CtngaXxXS4gINvSnjGfI3Wa8+rzEuVsbvb13nBbMKQSK4LIMiTjPBcVcyI
         /LF4+/FSM7PUg==
Received: by mail-lf1-f72.google.com with SMTP id x26-20020a056512131a00b00448708fa822so4480467lfu.6
        for <linux-clk@vger.kernel.org>; Tue, 22 Mar 2022 01:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=neGecA7HBSwD46fG4cAmxThQpgGejbSlPRN3sQKWp0I=;
        b=wOBWdjhYLR0lN1IrL3Li3XMIr4dGao5Lt2oL93xpRHnb0nrtTNCYTLNP+Th3ZfKqU7
         b8EmHN9FrKBYUNf3cZP/6ww1hfuODfsMjW6BgQkKxlarKtudtXYZQFSe2eg8nd4PKF9N
         jgP9UWEAkFKltTx6PVrvrSMzC4eNLltfO57Ppx9EVloe/nFpkbcyx2n13oQhMCotRWGH
         l9aRAWicZgwagyGC5Px+9aXCK6HJxcJPILBF3esr1nO3SWkDpm3w96EgYmApfclwe1mg
         mNfax/M/c7MwY/kXipcot/UJsykLNtlOcnApBKGnKFOSyRnJVKyKQvpzHG0QdZsOYXmM
         lfWQ==
X-Gm-Message-State: AOAM532pkp5NpKVs5fSxbHgb+BlnMUli/adKU11Wu0qbvi8cwJKBIQuf
        41NmH39vGYHM56ehFsLd9Zm1Xu3S6MPYkXy5QO9oMwt4yXxQVDqRBYWC84Jv/M5Ohorntw9H3Rl
        FyRBQ3XorEHINKzazH2Sz1Fo9x3SOHGpfKXt1HA==
X-Received: by 2002:a5d:59a1:0:b0:204:1777:fc08 with SMTP id p1-20020a5d59a1000000b002041777fc08mr5740207wrr.545.1647938708541;
        Tue, 22 Mar 2022 01:45:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw04a3TswDavls/3TZ+Ylafig5G9XRM4IJdq5o+8htxAoCK7PnTDqyBAOY10yAJcYtgnX428g==
X-Received: by 2002:a5d:59a1:0:b0:204:1777:fc08 with SMTP id p1-20020a5d59a1000000b002041777fc08mr5740165wrr.545.1647938708324;
        Tue, 22 Mar 2022 01:45:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c4e8900b0038c740951ebsm1522235wmq.24.2022.03.22.01.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 01:45:07 -0700 (PDT)
Message-ID: <a8290aa4-8a2c-68c3-bc55-82abcd27385e@canonical.com>
Date:   Tue, 22 Mar 2022 09:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] dt-bindings: clock: drop useless consumer example
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Alexander Shiyan <shc_work@mail.ru>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20220316130858.93455-1-krzysztof.kozlowski@canonical.com>
 <20220316130858.93455-2-krzysztof.kozlowski@canonical.com>
 <YjjCpQ9vwFoEmFFi@robh.at.kernel.org>
 <ca6c4fe5-93c5-9ad4-0c9f-86ec3213d44e@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ca6c4fe5-93c5-9ad4-0c9f-86ec3213d44e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/03/2022 02:45, Jesse Taube wrote:
> 
> 
> On 3/21/22 14:23, Rob Herring wrote:
>> On Wed, Mar 16, 2022 at 02:08:58PM +0100, Krzysztof Kozlowski wrote:
>>> Consumer examples in the bindings of resource providers are trivial,
>>> useless and duplication of code.  Remove the example code for consumer
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>   .../bindings/clock/bitmain,bm1880-clk.yaml           | 12 ------------
>>>   .../devicetree/bindings/clock/idt,versaclock5.yaml   |  7 -------
>>>   .../devicetree/bindings/clock/imx1-clock.yaml        |  9 ---------
>>>   .../devicetree/bindings/clock/imx21-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx23-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx25-clock.yaml       |  8 --------
>>>   .../devicetree/bindings/clock/imx27-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx28-clock.yaml       |  9 ---------
>>>   .../devicetree/bindings/clock/imx31-clock.yaml       |  8 --------
>>>   .../devicetree/bindings/clock/imx35-clock.yaml       |  8 --------
>>>   .../devicetree/bindings/clock/imx7ulp-pcc-clock.yaml | 11 -----------
>>>   .../devicetree/bindings/clock/imx7ulp-scg-clock.yaml | 11 -----------
>>>   .../devicetree/bindings/clock/imx8qxp-lpcg.yaml      | 11 -----------
>>>   .../devicetree/bindings/clock/imxrt1050-clock.yaml   |  8 --------
>>>   .../bindings/clock/nvidia,tegra124-car.yaml          |  7 -------
>>>   .../bindings/clock/nvidia,tegra20-car.yaml           |  7 -------
>>>   16 files changed, 143 deletions(-)
>>
>> Doesn't apply to my tree (no imxrt1050-clock.yaml), so
> merge against linux-next I can submit another patch if needed.
>> Acked-by: Rob Herring <robh@kernel.org>

Let me send it after the merge window - all dependencies should be there.


Best regards,
Krzysztof

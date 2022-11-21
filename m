Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BBDC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 08:45:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbiKUIp0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 03:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiKUIpQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 03:45:16 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E895473408
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:45:14 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id d3so13751432ljl.1
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mycMge6787I2pSG246uybE+7CW7nJVNvvmftra6HFuc=;
        b=EpCIUBS1xLeEDrqaJF+VCHWZRLmXU/nQF3q72N6xLlGNAOw9okfhX6AJTkUsmacS++
         8GHdCUDpo7gDtaNU4CRgy84ky9JKr11n9jsSQHU4nacXn750M5txZ77fCl0losTGiCF9
         AX7DlOE6fbMx/FYg02ASuqJ0m0TsVS3i5nIlDr+oaGBn1DnZFVtMRRgnpVR7co9sTdKW
         TeYd/uSlquRtpUN8ngminea2BQ4JuFGMun3RPjkuZxGkQ4/0nTZg6AkF7Y5N2v1f6Ys8
         dulwvixdg5kqlvvvqwoeTQOjGgMIGBitFv1LnjCEbM8b8yhSXwUlRvBrgkIo3GiQ39Jb
         8bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mycMge6787I2pSG246uybE+7CW7nJVNvvmftra6HFuc=;
        b=gwTSQocOzJbJo/lt5YUmEdrlA0BK78c61Yr1rdOAydlBbAlswp5enyuBTfys0bppLO
         9ttrP78kM0vgW/B5GqZaSHRjhNc91qxa2aydxbwWxOuCtq3kF/EmwPm03oPEwKdwJf9e
         WDVbVcYsELYwZyk6AYMkcfa4nMFf2jj/3YycB1Af5/3wpPKX8VmyNEQzGghU3WRMWFJ5
         Un3ZUmMr5NCtQB5zBO7V/TMHtTV0Ngm2f2ejhigVhTD3fF5tzbpxpbrUjiLIhhohyTxF
         WFGkOWjoF50/9Fe2mEXVuoaXC9vNegNmB5IUB9v6HdSi38lFa9zefqX6ESAY/CeEgMcL
         +spw==
X-Gm-Message-State: ANoB5pm99l5GfXzgXK11xRsebJ0276SMzHESj2Ay6PB58vlQDjd+0qrQ
        2nbKNCyEzrCCKNTH7JQEHgj5ZA==
X-Google-Smtp-Source: AA0mqf7lf5Y283PltKwNYB6rVc/aL101oDcgs/xDNwunV6PjB/jvcixKvd81YQAo5e3xQh08QOAdWg==
X-Received: by 2002:a2e:b523:0:b0:277:31c3:ca17 with SMTP id z3-20020a2eb523000000b0027731c3ca17mr413372ljm.523.1669020313313;
        Mon, 21 Nov 2022 00:45:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b0049f54c5f2a4sm1922312lfc.229.2022.11.21.00.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:45:12 -0800 (PST)
Message-ID: <4d1fbddc-ee8b-1ab3-d1a9-8496bda3f668@linaro.org>
Date:   Mon, 21 Nov 2022 09:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/14] dt-bindings: clock: Add StarFive JH7110 system
 and always-on clock definitions
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
 <20221118010627.70576-8-hal.feng@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-8-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/11/2022 02:06, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add all clock outputs for the StarFive JH7110 system (SYS) and
> always-on (AON) clock generator.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                 |   5 +-
>  include/dt-bindings/clock/starfive-jh7110.h | 234 ++++++++++++++++++++
>  2 files changed, 237 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/starfive-jh7110.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6f1060e7964..e97dac9c0ee4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19598,12 +19598,13 @@ M:	Ion Badulescu <ionut@badula.org>
>  S:	Odd Fixes
>  F:	drivers/net/ethernet/adaptec/starfire*
>  
> -STARFIVE JH7100 CLOCK DRIVERS
> +STARFIVE CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> +M:	Hal Feng <hal.feng@starfivetech.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
>  F:	drivers/clk/starfive/
> -F:	include/dt-bindings/clock/starfive-jh7100*.h
> +F:	include/dt-bindings/clock/starfive*
>  
>  STARFIVE JH7100 PINCTRL DRIVER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> diff --git a/include/dt-bindings/clock/starfive-jh7110.h b/include/dt-bindings/clock/starfive-jh7110.h

Filename based / the same as compatible (or bindings filename).


Best regards,
Krzysztof


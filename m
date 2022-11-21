Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110FEC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 08:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbiKUIuT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 03:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiKUIuS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 03:50:18 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41C77FC15
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:50:16 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id a29so17735058lfj.9
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 00:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k+tVJyc1L1GHiwD6JNInxUbkk05ZPiRwgmjlT/SkiMs=;
        b=gKGZQu2y6mg/8WHMd//eEFJILPyHxaZ2cRHFgJz6kT2msFXq4g2wX2d5YF0ssbr04d
         osoEN8dmIBl6od9V5UdHJ7xLiSrp6LaCgK7PJ4PdVE+LpsS6xGH+qKqCmAReatUGB2xT
         TfYShpuRvqqcDkvcAqtb48/MwpxEBuMIayo9h3rZZtWzTkphZXXdamjP2uMyX0mkA5km
         73yXC2w83xl092duhGELypFZOFwzlbizkXg0wfoP+7loHzvaWAwRyGqyRyRDdcJ8EHzE
         4qGy5vorawf6vIHOjsgvCcq7SzOEfzU9nMU11efa8d3B7ek0SNarfpAoLzA8w7Bl3wV1
         8pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+tVJyc1L1GHiwD6JNInxUbkk05ZPiRwgmjlT/SkiMs=;
        b=xwtWKee4tEkNROlhbzAhxezNvYozTe7x0RVy1fuSXL8FkPGR6fcvukLBOS1XbdCuUp
         ZvslBRTpMOjLjZSmV+aSNH9LpJJKIBP3ltdk7Md9+eqooEzrfLoyGwXnUR2OT1SuWUHg
         6fpiEy/gELzjcF0eiVJ5/+TLIRTdM1aIOTHnSQxdBzcIFBv4AsAT/REaVGzQwNC919uN
         DCC0DVvbkW4bgfXOS5/n0lq0oU++lfhbTdl2opYXeRS5dNiJ39n2lz7QAf8KNlR1Ng19
         5tT6c/RyJ4aTPmUrqvCzIxLHoYUONJHsatZIJwer+kzEHUmDqYRQKIyQ2bMV6RkPzPnc
         ooLw==
X-Gm-Message-State: ANoB5pkU3lYPjSKLAk/h+LJH1t6HpBykE/LckmfjhtnSbCP0bZ8lzM7F
        Pd15fkRhnbDoehD2RBaQR/QLrw==
X-Google-Smtp-Source: AA0mqf58KjMdv56Ofm6F9NuTs0Nbk9Pu3XnmSVj7yu0e6lJ2r5xkwkF38bsTGDcua+lPe1NMFfJtUw==
X-Received: by 2002:a19:4f02:0:b0:4a2:1d18:45d8 with SMTP id d2-20020a194f02000000b004a21d1845d8mr5383607lfb.330.1669020615158;
        Mon, 21 Nov 2022 00:50:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d14-20020a056512368e00b00494706193adsm1949906lfs.208.2022.11.21.00.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:50:14 -0800 (PST)
Message-ID: <e4237444-2d3a-d168-f95f-d1b1e6ac95ec@linaro.org>
Date:   Mon, 21 Nov 2022 09:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/14] dt-bindings: reset: Add StarFive JH7110 system
 and always-on reset definitions
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
 <20221118010627.70576-9-hal.feng@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118010627.70576-9-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/11/2022 02:06, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add resets for the StarFive JH7110 system (SYS) and always-on (AON)
> reset controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  MAINTAINERS                                 |   5 +-
>  include/dt-bindings/reset/starfive-jh7110.h | 154 ++++++++++++++++++++
>  2 files changed, 157 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/starfive-jh7110.h
> 

Thank you for your patch. There is something to discuss/improve.

> +#define JH7110_SYSRST_TIMER0			118
> +#define JH7110_SYSRST_TIMER1			119
> +#define JH7110_SYSRST_TIMER2			120
> +#define JH7110_SYSRST_TIMER3			121
> +#define JH7110_SYSRST_INT_CTRL_APB		122
> +#define JH7110_SYSRST_TEMP_APB			123
> +#define JH7110_SYSRST_TEMP_CORE			124
> +#define JH7110_SYSRST_JTAG_CERTIFICATION	125
> +
> +#define	JH7110_SYSRST_END			126

Drop weird indentation in the middle of syntax.

> +
> +/* AONCRG resets */
> +#define JH7110_AONRST_GMAC0_AXI			0
> +#define JH7110_AONRST_GMAC0_AHB			1
> +#define JH7110_AONRST_AON_IOMUX			2
> +#define JH7110_AONRST_PMU_APB			3
> +#define JH7110_AONRST_PMU_WKUP			4
> +#define JH7110_AONRST_RTC_APB			5
> +#define JH7110_AONRST_RTC_CAL			6
> +#define JH7110_AONRST_RTC_32K			7
> +
> +#define	JH7110_AONRST_END			8

Ditto

> +
> +#endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_H__ */

Best regards,
Krzysztof


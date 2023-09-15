Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63D5EE6452
	for <linux-clk@archiver.kernel.org>; Fri, 15 Sep 2023 10:36:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbjIOKgQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Sep 2023 06:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbjIOKgN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Sep 2023 06:36:13 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22D794
        for <linux-clk@vger.kernel.org>; Fri, 15 Sep 2023 03:36:07 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ada2e6e75fso264006566b.2
        for <linux-clk@vger.kernel.org>; Fri, 15 Sep 2023 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694774166; x=1695378966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOGuQvyKIEvGatIdgqwwx1vnmFxyP0QzDb7QKoox0rU=;
        b=KNW3zmZj4hD//4GOVtgSBq9/ON/12lATBn4v7X+qDLZNpbBS9ILJA7AKfYlYGQrZUT
         Zn2MUSJxIMkUyxp7tMs0MjMICJ15iGhgJAvKSJgKC7HhrN6kxLT0qTrnTrr+qkheYbZw
         XT8uKLgqZ2yiy96Isoki+I/H0IoFG1CoWDypvZwTEVNQLw2A2i9VXM21C1nVOU5XAs6l
         DnkOc+PdvTkULUg5oOEdyjxAob2lJjvCUgW//83MN4NsQSNm9xqcQdY3EsbK+MBx8iKU
         //vONQUxhODriVqVjeY7XZcl25tMAkFFIKmT9H63gOFxBz9WY/ntha+aMFeWyp4UH/Bi
         YeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694774166; x=1695378966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOGuQvyKIEvGatIdgqwwx1vnmFxyP0QzDb7QKoox0rU=;
        b=oxtfHjPLAQMIdjLcYnywaGV43hzbh4XiJUBZdrw85hINq0bduqgivxPd1sl88Hdhij
         Mj6/Td8JtO2xtWNRoOTZzwW+ryBuY8R8Fy5UdgtBlOiN2hzCLuVp4/y+oTotHhO5boOs
         UqB1H/RpZpOej8gQwra9hL1pc69hUrrQhDWM3F3OEsZT0ncy0QLYcXZ5QqWa1sG3tr0D
         xbJz72DqOFYbNjdFQ9qiJPaBR88M1CcAsH4QXs9HWaiWRbJ4PR+id0S+BZxOvtF4136i
         RtJRo/PN9sufPGr1bLOLb2Tvrtb9n978nnHUH+U/fF8Wfh+IEL3g8IKcYO7TF2lnpnTH
         SdEg==
X-Gm-Message-State: AOJu0YzT8TP1V5gvHw+QrcVgJ1UcQpeF7wFTYKw179Q9QpsDRSZlWKk4
        wHghNXs8v8GKfD+GRae3DufpZw==
X-Google-Smtp-Source: AGHT+IGS0jKR8/GziN8CPYCaB+oKHmwOUHJOR8LOLDNfKE1g71vzGMk2ygtAxDqrZgORxBrUTqjoxg==
X-Received: by 2002:a17:906:3019:b0:9a9:f14f:7e3b with SMTP id 25-20020a170906301900b009a9f14f7e3bmr1169368ejz.16.1694774166327;
        Fri, 15 Sep 2023 03:36:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090655cf00b00997d7aa59fasm2274540ejp.14.2023.09.15.03.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 03:36:05 -0700 (PDT)
Message-ID: <aa15d41e-c05b-7fc5-77fb-9416f4f190b5@linaro.org>
Date:   Fri, 15 Sep 2023 12:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 03/42] dt-bindings: clock: Add Cirrus EP93xx
Content-Language: en-US
To:     nikita.shubin@maquefel.me,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
 <20230915-ep93xx-v4-3-a1d779dcec10@maquefel.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915-ep93xx-v4-3-a1d779dcec10@maquefel.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/09/2023 10:10, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 

Thank you for your patch. There is something to discuss/improve.


> diff --git a/include/dt-bindings/clock/cirrus,ep9301-clk.h b/include/dt-bindings/clock/cirrus,ep9301-clk.h
> new file mode 100644
> index 000000000000..3cd053c0fdea
> --- /dev/null
> +++ b/include/dt-bindings/clock/cirrus,ep9301-clk.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +#ifndef DT_BINDINGS_CIRRUS_EP93XX_CLOCK_H
> +#define DT_BINDINGS_CIRRUS_EP93XX_CLOCK_H
> +
> +#define EP93XX_CLK_UART1	0
> +#define EP93XX_CLK_UART2	1
> +#define EP93XX_CLK_UART3	2
> +
> +#define EP93XX_CLK_ADC		3
> +#define EP93XX_CLK_ADC_EN	4
> +
> +#define EP93XX_CLK_KEYPAD   5

Wrong indentation - use tab instead of spaces, just like in other places.

> +
> +#define EP93XX_CLK_VIDEO	6
> +
> +#define EP93XX_CLK_I2S_MCLK	7
> +#define EP93XX_CLK_I2S_SCLK	8
> +#define EP93XX_CLK_I2S_LRCLK	9
> +
> +#define EP93XX_CLK_UART		10
> +#define EP93XX_CLK_SPI		11
> +#define EP93XX_CLK_PWM		12
> +#define EP93XX_CLK_USB		13
> +
> +#define EP93XX_CLK_M2M0		14
> +#define EP93XX_CLK_M2M1		15
> +
> +#define EP93XX_CLK_M2P0		16
> +#define EP93XX_CLK_M2P1		17
> +#define EP93XX_CLK_M2P2		18
> +#define EP93XX_CLK_M2P3		19
> +#define EP93XX_CLK_M2P4		20
> +#define EP93XX_CLK_M2P5		21
> +#define EP93XX_CLK_M2P6		22
> +#define EP93XX_CLK_M2P7		23
> +#define EP93XX_CLK_M2P8		24
> +#define EP93XX_CLK_M2P9		25
> +
> +#define EP93XX_CLK_END      26

Here as well... except I propose to drop it. Number of clocks should not
be part of bindings, because then you cannot grow it.

With indentation fixed and CLK_END dropped:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


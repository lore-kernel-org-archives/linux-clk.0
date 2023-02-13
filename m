Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3219BC636D7
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 09:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjBMJrV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 04:47:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbjBMJrA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 04:47:00 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27B7F74F
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:46:52 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so8501434wmb.5
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOPgLCW7T8vK/LSUPT7A6YVcJlxOCqf9nMJwHUXwdEU=;
        b=SJdEpQrWIorwhYxdpYo5dT1Hf7Cm32zZOIHcIfzdVpTxS1TvyGiPg0CPAhxKRZRx2U
         ZFgbjQ/o5ScN49Ht+6UKYyiXtshnxk5TSouQI1BEZKuqDGk1yWCsSpcFoQh3z3U2+fen
         GiY6eS1NwG7mVTDBfaLtJ9FzA1zkGKRuv2xQPPWk0qRfxEdN3g1N/hYlygfCFrUeiq5A
         7WMz7oMTpCMDi7oLIJvQv3JvLFawVXF1reIHqRvM79W1YtGI9gp0fBd8mGYnyxtLEcM0
         AJEUFVq/cx6EX9XGRzy0jZKeshAR3ed6XdTu5vq+y4gap6m4Lm088ez35KxVLhHZ4uXM
         Z3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOPgLCW7T8vK/LSUPT7A6YVcJlxOCqf9nMJwHUXwdEU=;
        b=f5ozrzQEuvGTq9nsb/m+q0nJg2sHa3+ApVQjIr/OV+bBo7HhdtDCGdVbq8w8cdcnBT
         TeMqWpo7j2AEC7XiTNvf/vjmq2an7LkW0ltojCF7I/Lm59YBzsdbUdXoCnhq+naAlyM9
         owVOqt67He0nwfR1Cz4Hiz3apgzBXYYJ21cb+jGvK6reoec7D5lk+pqwM+Z8MBhnf3vB
         4dNsQd+AC4ZnpgyC+5cT7JuUCifIRoQBlfzM8OeMzZELch1fKL8JoxS9o+LntcjJHd6q
         TakIUSRvxm0Kt16JHgtZvK3dtJGn77fHyWzt/eTSY0ZWnrdL0Te8pD/qjeA4pOgbsobz
         9rDA==
X-Gm-Message-State: AO0yUKVFqjNqBWc/f57ri9IchpKTCZIjjK3fbqDkXCFRfAXBF1AbRJ2q
        oVhac8zj5cDWIoznL1R5DMBFaw==
X-Google-Smtp-Source: AK7set+95nq5YeloUXV/H16QNZdb80eq/m50nMdjfMX/lyZ9KFUHlXUkRW98jtFC3saws8yua1JPDQ==
X-Received: by 2002:a05:600c:32a7:b0:3df:dea7:8ec with SMTP id t39-20020a05600c32a700b003dfdea708ecmr19050100wmp.20.1676281611437;
        Mon, 13 Feb 2023 01:46:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c5445000000b003dc492e4430sm13292404wmi.28.2023.02.13.01.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:46:51 -0800 (PST)
Message-ID: <238f6b4c-b4d3-5dfd-35b2-34fede2d1d84@linaro.org>
Date:   Mon, 13 Feb 2023 10:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] clk: aspeed: Add full configs for i3c clocks
Content-Language: en-US
To:     Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <jms@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <cover.1676259904.git.jk@codeconstruct.com.au>
 <68e306d262841a5435d1a7145764b64f524a2352.1676259904.git.jk@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <68e306d262841a5435d1a7145764b64f524a2352.1676259904.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 04:48, Jeremy Kerr wrote:
> The current ast2600 i3c clock definitions are top-level, and include a
> couple of definitions for (non-existent) i3c6 and i3c7.
> 
> This change re-parents these to the main i3c clock, sourced from the
> APLL. We also remove the i3c6 and i3c7 definitions and mark those entries
> in the gates array as reserved - all entries in the array must be
> contiguous.
> 
> This change is a partial cherry-pick and rework of ed44b8cdfdb and
> 1a35eb926d7 from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/clk/clk-ast2600.c                 | 39 ++++++++++++++++++-----
>  include/dt-bindings/clock/ast2600-clock.h |  6 ++--

Bindings are separate patches. Always.

>  2 files changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 9c3305bcb27a..24ad34440e1e 100644
> --- a/drivers/clk/clk-ast2600.c
> +++ b/drivers/clk/clk-ast2600.c
> @@ -4,6 +4,7 @@
>  
>  #define pr_fmt(fmt) "clk-ast2600: " fmt
>  
> +#include <linux/bitfield.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> @@ -32,6 +33,18 @@
>  #define ASPEED_G6_CLK_SELECTION1	0x300
>  #define ASPEED_G6_CLK_SELECTION2	0x304
>  #define ASPEED_G6_CLK_SELECTION4	0x310
> +#define ASPEED_G6_CLK_SELECTION5	0x314
> +#define   I3C_CLK_SELECTION		BIT(31)
> +#define     I3C_CLK_SELECT_HCLK		0
> +#define     I3C_CLK_SELECT_APLL_DIV	1
> +#define   APLL_DIV_SELECTION		GENMASK(30, 28)
> +#define     APLL_DIV_2			0b001
> +#define     APLL_DIV_3			0b010
> +#define     APLL_DIV_4			0b011
> +#define     APLL_DIV_5			0b100
> +#define     APLL_DIV_6			0b101
> +#define     APLL_DIV_7			0b110
> +#define     APLL_DIV_8			0b111
>  
>  #define ASPEED_HPLL_PARAM		0x200
>  #define ASPEED_APLL_PARAM		0x210
> @@ -97,14 +110,14 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
>  	[ASPEED_CLK_GATE_LHCCLK]	= { 37, -1, "lhclk-gate",	"lhclk", 0 },	/* LPC master/LPC+ */
>  	/* Reserved 38 RSA: no longer used */
>  	/* Reserved 39 */
> -	[ASPEED_CLK_GATE_I3C0CLK]	= { 40,  40, "i3c0clk-gate",	NULL,	 0 },	/* I3C0 */
> -	[ASPEED_CLK_GATE_I3C1CLK]	= { 41,  41, "i3c1clk-gate",	NULL,	 0 },	/* I3C1 */
> -	[ASPEED_CLK_GATE_I3C2CLK]	= { 42,  42, "i3c2clk-gate",	NULL,	 0 },	/* I3C2 */
> -	[ASPEED_CLK_GATE_I3C3CLK]	= { 43,  43, "i3c3clk-gate",	NULL,	 0 },	/* I3C3 */
> -	[ASPEED_CLK_GATE_I3C4CLK]	= { 44,  44, "i3c4clk-gate",	NULL,	 0 },	/* I3C4 */
> -	[ASPEED_CLK_GATE_I3C5CLK]	= { 45,  45, "i3c5clk-gate",	NULL,	 0 },	/* I3C5 */
> -	[ASPEED_CLK_GATE_I3C6CLK]	= { 46,  46, "i3c6clk-gate",	NULL,	 0 },	/* I3C6 */
> -	[ASPEED_CLK_GATE_I3C7CLK]	= { 47,  47, "i3c7clk-gate",	NULL,	 0 },	/* I3C7 */
> +	[ASPEED_CLK_GATE_I3C0CLK]	= { 40,  40, "i3c0clk-gate",	"i3cclk", 0 }, /* I3C0 */
> +	[ASPEED_CLK_GATE_I3C1CLK]	= { 41,  41, "i3c1clk-gate",	"i3cclk", 0 }, /* I3C1 */
> +	[ASPEED_CLK_GATE_I3C2CLK]	= { 42,  42, "i3c2clk-gate",	"i3cclk", 0 }, /* I3C2 */
> +	[ASPEED_CLK_GATE_I3C3CLK]	= { 43,  43, "i3c3clk-gate",	"i3cclk", 0 }, /* I3C3 */
> +	[ASPEED_CLK_GATE_I3C4CLK]	= { 44,  44, "i3c4clk-gate",	"i3cclk", 0 }, /* I3C4 */
> +	[ASPEED_CLK_GATE_I3C5CLK]	= { 45,  45, "i3c5clk-gate",	"i3cclk", 0 }, /* I3C5 */
> +	[ASPEED_CLK_GATE_RESERVED43]	= { 46,  46, "reserved-43",	NULL,	0 },
> +	[ASPEED_CLK_GATE_RESERVED44]	= { 47,  47, "reserved-44",	NULL,	0 },
>  	[ASPEED_CLK_GATE_UART1CLK]	= { 48,  -1, "uart1clk-gate",	"uart",	 0 },	/* UART1 */
>  	[ASPEED_CLK_GATE_UART2CLK]	= { 49,  -1, "uart2clk-gate",	"uart",	 0 },	/* UART2 */
>  	[ASPEED_CLK_GATE_UART3CLK]	= { 50,  -1, "uart3clk-gate",	"uart",  0 },	/* UART3 */
> @@ -772,6 +785,16 @@ static void __init aspeed_g6_cc(struct regmap *map)
>  	/* USB 2.0 port1 phy 40MHz clock */
>  	hw = clk_hw_register_fixed_rate(NULL, "usb-phy-40m", NULL, 0, 40000000);
>  	aspeed_g6_clk_data->hws[ASPEED_CLK_USBPHY_40M] = hw;
> +
> +	/* i3c clock: source from apll, divide by 8 */
> +	regmap_read(map, ASPEED_G6_CLK_SELECTION5, &val);
> +	val &= ~(I3C_CLK_SELECTION | APLL_DIV_SELECTION);
> +	val |= FIELD_PREP(I3C_CLK_SELECTION, I3C_CLK_SELECT_APLL_DIV);
> +	val |= FIELD_PREP(APLL_DIV_SELECTION, APLL_DIV_8);
> +	regmap_write(map, ASPEED_G6_CLK_SELECTION5, val);
> +
> +	hw = clk_hw_register_fixed_factor(NULL, "i3cclk", "apll", 0, 1, 8);
> +	aspeed_g6_clk_data->hws[ASPEED_CLK_I3C] = hw;
>  };
>  
>  static void __init aspeed_g6_cc_init(struct device_node *np)
> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
> index d8b0db2f7a7d..98dc82702755 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -57,9 +57,8 @@
>  #define ASPEED_CLK_GATE_I3C3CLK		40
>  #define ASPEED_CLK_GATE_I3C4CLK		41
>  #define ASPEED_CLK_GATE_I3C5CLK		42
> -#define ASPEED_CLK_GATE_I3C6CLK		43
> -#define ASPEED_CLK_GATE_I3C7CLK		44

This breaks the ABI and commit msg does not provide justfication for it.



Best regards,
Krzysztof


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2F0C636CC
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 09:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjBMJs3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 04:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbjBMJsU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 04:48:20 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A08F11176
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:48:13 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id j23so11516812wra.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 01:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+1kwf1vAAGzxCmCPcA7pId76+TiaZMPeuqbYRjhDajU=;
        b=iqg1iidpuC878bjhi1dUE+ySfvTTHYjtd1Ufcm/6TohoU44N5mE/qYqYYf09cizx2J
         kvcB9EMg6UJjyr2YjmasBo9D27xpV3zDhIysvOJmjDNgPaeFNvcbys4zRTU6u8y/cslL
         vgFMGAS99taGEjU8ptczo/oGJ5zE/5n73GytMa0Tc0e8oNd8OuDy5Xi1BMdfq9Yvkncz
         sQoT/rtvgGNn2uR1rEGrU79qxGV7Rd2IrdSjzqtObHfJcHc5PUaeYafVDHy6TnDOhTlv
         MCpsz7CcJFhDBQPwDer/Dr/8fL/QKd6bVdRpINrnTSC4OQzylieFslAYztTLzYWBImG5
         E0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+1kwf1vAAGzxCmCPcA7pId76+TiaZMPeuqbYRjhDajU=;
        b=qjBVuOG4WJokFNNunMTdAYIrzcwKVDK6drBZ72Re8oeA9fadjDS04ULWErw18tFwiL
         i+p2KGlrQvq9fX2xCBzX0TBbBV4JsblCo4N/dypplUTwfTMvI126Fk8JXL/GQsBqPMHm
         HKGclvmW5znFWjgWC+BMG/fuJpjkOmGiRkwd8Jf6fwGCsUphy5FxTLZiNxEVHBJNBY/P
         X3nxma6navMhlLR1g3zpQTCcVFT03wiKnPc/bGHh2oCF7v3wST1EMgcg44W3GYmwBjVW
         PKfc0dsbPpFwPN67sS3h2dfJBZFKUji4v/o1k1CHpcpvkTxmCRdjNZC7FfgQgOvoXbvH
         YtNQ==
X-Gm-Message-State: AO0yUKXXBSIEMJf1rw0N5M3p6deRPrCelO4crLkR01LBVg7Pocaq3EcH
        qKmUou7JDsrL5adlva/BwZ0z0w==
X-Google-Smtp-Source: AK7set/mlUlrcEB/1ZY4P1k17QQhdOmwcDlJJEmcaw/T8ayP16umrQ9Gvz6kD7LORoZW+F4JkBTH9A==
X-Received: by 2002:a5d:66ce:0:b0:2bc:aa67:28fb with SMTP id k14-20020a5d66ce000000b002bcaa6728fbmr20117943wrw.49.1676281692402;
        Mon, 13 Feb 2023 01:48:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k6-20020adfe8c6000000b002c55551e6e9sm3292285wrn.108.2023.02.13.01.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:48:12 -0800 (PST)
Message-ID: <45ce9e62-2620-b959-985d-ae00b071e350@linaro.org>
Date:   Mon, 13 Feb 2023 10:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] clk: aspeed: Add full configs for i3c clocks
Content-Language: en-US
To:     Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
 <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5ee4ade6820a9db8dc9c20bb39fd8a4c4cd7c2a6.1676267865.git.jk@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/02/2023 07:02, Jeremy Kerr wrote:
> The current ast2600 i3c clock definitions are top-level (rather than
> based on their actual hw sources: either HCLK or APLL), and include a
> couple of definitions for (non-existent) i3c6 and i3c7.
> 
> This change re-parents these to the main i3c clock, explicitly sourced
> from the APLL rather than whatever G6_CLK_SELECTION5 was last set to. We
> also remove the i3c6 and i3c7 definitions.
> 
> This change is a partial cherry-pick and rework of ed44b8cdfdb and
> 1a35eb926d7 from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  drivers/clk/clk-ast2600.c                 | 38 ++++++++++++++++++-----
>  include/dt-bindings/clock/ast2600-clock.h |  3 +-

My comments from v1:

Bindings are always separate patches.

>  2 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 1f08ff3c60fa..45549cb18107 100644
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
> @@ -97,14 +110,13 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
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
> +	/* Reserved: 46 & 47 */
>  	[ASPEED_CLK_GATE_UART1CLK]	= { 48,  -1, "uart1clk-gate",	"uart",	 0 },	/* UART1 */
>  	[ASPEED_CLK_GATE_UART2CLK]	= { 49,  -1, "uart2clk-gate",	"uart",	 0 },	/* UART2 */
>  	[ASPEED_CLK_GATE_UART3CLK]	= { 50,  -1, "uart3clk-gate",	"uart",  0 },	/* UART3 */
> @@ -775,6 +787,16 @@ static void __init aspeed_g6_cc(struct regmap *map)
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
> index d8b0db2f7a7d..600549d7bee8 100644
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h
> @@ -57,8 +57,6 @@
>  #define ASPEED_CLK_GATE_I3C3CLK		40
>  #define ASPEED_CLK_GATE_I3C4CLK		41
>  #define ASPEED_CLK_GATE_I3C5CLK		42
> -#define ASPEED_CLK_GATE_I3C6CLK		43
> -#define ASPEED_CLK_GATE_I3C7CLK		44

This is an ABI break and commit msg does not really justify it.


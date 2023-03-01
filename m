Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8318C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 00:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjCAAsc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 19:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjCAAsa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 19:48:30 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFC51ABEB;
        Tue, 28 Feb 2023 16:48:29 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cy6so47488474edb.5;
        Tue, 28 Feb 2023 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E4nqFS4bUyvvbhYjM0gBTx6DKWNE9vnb92XDebUFGiQ=;
        b=OcWWjKveDrSt4lKbio34DKIEB7/tKQdPvkzd1RloA17WZO4/aSanPjscSDszZb//gR
         nLFS9D0tRqTtHP7As3Yfl9kuEQFyMf/nOVZPblAvIgG9PLkiftI5ziOPDTKqbzt5qU5Y
         5q7o3dn4TFZ+Pai4iS5nzNNhWdNTRi4xbtKF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4nqFS4bUyvvbhYjM0gBTx6DKWNE9vnb92XDebUFGiQ=;
        b=cTfflLE5t8x1PYIzP2jcsP9sryqhNMeiyUxekoo9BhXr2RudjGY5YCjnDz8UOfLtye
         Zp5VvO8HXDOJK4/bEmHd872MNk4/lFQaKRzXsmNSFCAuuvGVu3FIdUBK2I/HcEnZLV7m
         VP/3HWZaJBKFWs7AbJJMREFIyeGtxu5juEtpevmhKBQ32pnnipodivK+DGQEbwKN/sDC
         cSlALa7UX1KnmeBL+rHFZAEr5lZ7/b2Nskq2HgQ+uwoRbfmD1TAh9n/hpazLGNgHj8dj
         V4+2eQwYIHTKJwG3nD8ue9Jv8vM5ayL+Y3iLkuj2SV28Xi5LlSSHlAz1dyOSf+Q4YOrY
         7kXg==
X-Gm-Message-State: AO0yUKVwtTjuXdlmrx+UxD3faGa7Y6oemi5RfayzBuv73V1twJMgJT7w
        Oj1CKVIW/PEAbW4wqnNibqMzFUu6VKv6HbZNzfE=
X-Google-Smtp-Source: AK7set8Dgyo2xfOQ5xPsP7lSIDVjHdK9h5/lB6KW45LIooKBaiJzzL6JnQKsnZZDMooutoiSimZQjIOArOAf07ceHq0=
X-Received: by 2002:a17:906:a84f:b0:8bf:e82a:2988 with SMTP id
 dx15-20020a170906a84f00b008bfe82a2988mr2342904ejb.4.1677631707852; Tue, 28
 Feb 2023 16:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au> <20230228091638.206569-4-jk@codeconstruct.com.au>
In-Reply-To: <20230228091638.206569-4-jk@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 1 Mar 2023 00:48:15 +0000
Message-ID: <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] clk: ast2600: Add full configs for I3C clocks
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 28 Feb 2023 at 09:16, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> The current ast2600 I3C clock definitions are top-level (rather than
> based on their actual hw sources: either HCLK or APLL), and include a
> couple of definitions for (non-existent) i3c6 and i3c7.
>
> Re-parent the individual I3C controller clocks to the main i3c clock,
> explicitly sourced from the APLL rather than whatever G6_CLK_SELECTION5
> was last set to.
>
> While we're at it, remove the definitions for the i3c6 and i3c7 clock
> lines; this hardware isn't present.
>
> This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
> from Aspeed's own tree, originally by Dylan Hung
> <dylan_hung@aspeedtech.com>.
>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Looks good. I have some suggestions below.

>
> ---
> v4:
>  - expand NUM_CLKS for the new I3C clock
> v3:
>  - split dt-bindings and clk changes
> v2:
>  - reword commit message
> ---
>  drivers/clk/clk-ast2600.c | 40 ++++++++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
> index 1f08ff3c60fa..d465d097e6f2 100644
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
> @@ -15,7 +16,7 @@
>
>  #include "clk-aspeed.h"
>
> -#define ASPEED_G6_NUM_CLKS             71
> +#define ASPEED_G6_NUM_CLKS             72

NUM_CLKS seems dangerous. Should we instead use ARRAY_SIZE(aspeed_g6_gates)?

Or at least a BUILD_BUG_ON( ARRAY_SIZE(aspeed_g6_gates) != ASPEED_G6_NUM_CLKS))?

>
>  #define ASPEED_G6_SILICON_REV          0x014
>  #define CHIP_REVISION_ID                       GENMASK(23, 16)
> @@ -32,6 +33,18 @@
>  #define ASPEED_G6_CLK_SELECTION1       0x300
>  #define ASPEED_G6_CLK_SELECTION2       0x304
>  #define ASPEED_G6_CLK_SELECTION4       0x310
> +#define ASPEED_G6_CLK_SELECTION5       0x314
> +#define   I3C_CLK_SELECTION            BIT(31)
> +#define     I3C_CLK_SELECT_HCLK                0
> +#define     I3C_CLK_SELECT_APLL_DIV    1
> +#define   APLL_DIV_SELECTION           GENMASK(30, 28)
> +#define     APLL_DIV_2                 0b001
> +#define     APLL_DIV_3                 0b010
> +#define     APLL_DIV_4                 0b011
> +#define     APLL_DIV_5                 0b100
> +#define     APLL_DIV_6                 0b101
> +#define     APLL_DIV_7                 0b110
> +#define     APLL_DIV_8                 0b111
>
>  #define ASPEED_HPLL_PARAM              0x200
>  #define ASPEED_APLL_PARAM              0x210
> @@ -97,14 +110,13 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
>         [ASPEED_CLK_GATE_LHCCLK]        = { 37, -1, "lhclk-gate",       "lhclk", 0 },   /* LPC master/LPC+ */
>         /* Reserved 38 RSA: no longer used */
>         /* Reserved 39 */
> -       [ASPEED_CLK_GATE_I3C0CLK]       = { 40,  40, "i3c0clk-gate",    NULL,    0 },   /* I3C0 */
> -       [ASPEED_CLK_GATE_I3C1CLK]       = { 41,  41, "i3c1clk-gate",    NULL,    0 },   /* I3C1 */
> -       [ASPEED_CLK_GATE_I3C2CLK]       = { 42,  42, "i3c2clk-gate",    NULL,    0 },   /* I3C2 */
> -       [ASPEED_CLK_GATE_I3C3CLK]       = { 43,  43, "i3c3clk-gate",    NULL,    0 },   /* I3C3 */
> -       [ASPEED_CLK_GATE_I3C4CLK]       = { 44,  44, "i3c4clk-gate",    NULL,    0 },   /* I3C4 */
> -       [ASPEED_CLK_GATE_I3C5CLK]       = { 45,  45, "i3c5clk-gate",    NULL,    0 },   /* I3C5 */
> -       [ASPEED_CLK_GATE_I3C6CLK]       = { 46,  46, "i3c6clk-gate",    NULL,    0 },   /* I3C6 */
> -       [ASPEED_CLK_GATE_I3C7CLK]       = { 47,  47, "i3c7clk-gate",    NULL,    0 },   /* I3C7 */
> +       [ASPEED_CLK_GATE_I3C0CLK]       = { 40,  40, "i3c0clk-gate",    "i3cclk", 0 }, /* I3C0 */
> +       [ASPEED_CLK_GATE_I3C1CLK]       = { 41,  41, "i3c1clk-gate",    "i3cclk", 0 }, /* I3C1 */
> +       [ASPEED_CLK_GATE_I3C2CLK]       = { 42,  42, "i3c2clk-gate",    "i3cclk", 0 }, /* I3C2 */
> +       [ASPEED_CLK_GATE_I3C3CLK]       = { 43,  43, "i3c3clk-gate",    "i3cclk", 0 }, /* I3C3 */
> +       [ASPEED_CLK_GATE_I3C4CLK]       = { 44,  44, "i3c4clk-gate",    "i3cclk", 0 }, /* I3C4 */
> +       [ASPEED_CLK_GATE_I3C5CLK]       = { 45,  45, "i3c5clk-gate",    "i3cclk", 0 }, /* I3C5 */
> +       /* Reserved: 46 & 47 */
>         [ASPEED_CLK_GATE_UART1CLK]      = { 48,  -1, "uart1clk-gate",   "uart",  0 },   /* UART1 */
>         [ASPEED_CLK_GATE_UART2CLK]      = { 49,  -1, "uart2clk-gate",   "uart",  0 },   /* UART2 */
>         [ASPEED_CLK_GATE_UART3CLK]      = { 50,  -1, "uart3clk-gate",   "uart",  0 },   /* UART3 */
> @@ -775,6 +787,16 @@ static void __init aspeed_g6_cc(struct regmap *map)
>         /* USB 2.0 port1 phy 40MHz clock */
>         hw = clk_hw_register_fixed_rate(NULL, "usb-phy-40m", NULL, 0, 40000000);
>         aspeed_g6_clk_data->hws[ASPEED_CLK_USBPHY_40M] = hw;
> +
> +       /* i3c clock: source from apll, divide by 8 */
> +       regmap_read(map, ASPEED_G6_CLK_SELECTION5, &val);
> +       val &= ~(I3C_CLK_SELECTION | APLL_DIV_SELECTION);

Is there any value in registering a mux device here? See the emmc extclk device.

> +       val |= FIELD_PREP(I3C_CLK_SELECTION, I3C_CLK_SELECT_APLL_DIV);
> +       val |= FIELD_PREP(APLL_DIV_SELECTION, APLL_DIV_8);
> +       regmap_write(map, ASPEED_G6_CLK_SELECTION5, val);

This is a departure in style from the existing code. The existing code
did things like this:

        regmap_update_bits(map, ASPEED_G6_CLK_SELECTION1, GENMASK(10,
8), BIT(10));

Which uses the regmap API instead of FIELD_PREP macros. If you think
FIELD_PREP is better then that's fine.

> +
> +       hw = clk_hw_register_fixed_factor(NULL, "i3cclk", "apll", 0, 1, 8);
> +       aspeed_g6_clk_data->hws[ASPEED_CLK_I3C] = hw;
>  };
>
>  static void __init aspeed_g6_cc_init(struct device_node *np)
> --
> 2.39.1
>

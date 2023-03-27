Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFCCC76195
	for <linux-clk@archiver.kernel.org>; Mon, 27 Mar 2023 10:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbjC0KT1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Mar 2023 06:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233554AbjC0KTZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 06:19:25 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5738246BC
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 03:19:23 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id n19so4741968wms.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 03:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679912361;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=Q193+qQbGmL9z6G4FxC+zWcxN9diay8DaaL43/+W/u8=;
        b=XcTpQMkfVUrA+Pi1esztDk96t1qs73ePIdcTmUSlkhjfToIrSRJNQYHHYGLWY0TqzM
         nVFuyk05pZlv5lPbwO9zK0WzgVFl7KjKn4DGov6+qMOoWvnmNGbbQsaObhU/FwaRm5pB
         JUQhAiGECwtW5fg6sswxeiXoanseG4chLs0e1pI6JdCNTTY0jeEeEWSFKg1SREcwH5JD
         22kxoYKdL91ApJtxNcGrw6yzZ2ZOLpbzr6tztM0RVaQhs62iApGGVTRJIusyoo+MDwo1
         gTKHmJye7be5sgiYM+zcPPM9QLdWeXHxJeVJmFMZqJlVRPHV9ENSiwraTZxfLrqsPAA8
         bx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912361;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q193+qQbGmL9z6G4FxC+zWcxN9diay8DaaL43/+W/u8=;
        b=JWXqOUB18kGzML4hwGzrqooLRHbw7OCE1Z1iG0Ovx4OGvAR0MIgtLtBmepQU/EzwUj
         +dh6U37HhR4SrLm8dUtCVMcS7EMdcX3bj9oaleEL3FZHxa6RwcKAKGSSs9MZVsnvB1Bk
         vq1+yRGDFkOaaroQAb4raMDFWq/GnO4Bg2uM2gx/E+2uLQ6/G9AzfEwodiiBrx1feQnE
         YS7YvH7rOnUmebZ14DERlT/y7FLb5iCxqUhtf4OJOmwMlheke2DIoWJLMcn/yAunA9JN
         9LZM6FpVCkBjr04ZCqyALuC+BRa/HPiFdzk3lGUD9+OUmiHei6GXWUd7ZFugpD+t3Unp
         B/rg==
X-Gm-Message-State: AO0yUKVijX8f+CiwUEHXny8GimNz4q9SfNzJffJOph0TNwXmPS+vcJo6
        Mtg7q05YaeaVL/93dS9kDBGpAQ==
X-Google-Smtp-Source: AK7set8FsG4tKWlAe1g+Z9lv7YuWI5lmdwWsaz4HZxhpVMHIcDwHlEbjUtUIaWotZWfhaYxhl3r5eQ==
X-Received: by 2002:a1c:4b02:0:b0:3ee:4481:5415 with SMTP id y2-20020a1c4b02000000b003ee44815415mr9184360wma.26.1679912361658;
        Mon, 27 Mar 2023 03:19:21 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b002d75909c76esm17848785wrt.73.2023.03.27.03.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 03:19:21 -0700 (PDT)
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-6-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Dmitry Rokosov <ddrokosov@sberdevices.ru>,
        neil.armstrong@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc:     jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 5/5] clk: meson: a1: add Amlogic A1 Peripherals
 clock controller driver
Date:   Mon, 27 Mar 2023 11:58:30 +0200
In-reply-to: <20230321193014.26349-6-ddrokosov@sberdevices.ru>
Message-ID: <1jtty6o5so.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> Introduce Peripherals clock controller for Amlogic A1 SoC family.
>
> A1 SoC has four clock controllers on the board: PLL, Peripherals, CPU,
> and Audio.
> This patchset adds support for Amlogic A1 Peripherals clock driver and
> allows to generate clocks for all A1 SoC peripheral IPs.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  drivers/clk/meson/Kconfig  |   10 +
>  drivers/clk/meson/Makefile |    1 +
>  drivers/clk/meson/a1.c     | 2344 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/a1.h     |   49 +
>  4 files changed, 2404 insertions(+)
>  create mode 100644 drivers/clk/meson/a1.c
>  create mode 100644 drivers/clk/meson/a1.h
>

[...]

> +static struct clk_regmap dspa_b_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = DSPA_CLK_CTRL0,
> +		.mask = 0x7,
> +		.shift = 26,
> +		.table = mux_table_dsp_ab,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "dspa_b_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = dsp_ab_parent_data,
> +		.num_parents = ARRAY_SIZE(dsp_ab_parent_data),
> +		/*
> +		 * DSPA_B clk can be inherited from more accurate RTC clock,
> +		 * so in some situations we may want to freeze its parent.
> +		 * Therefore force dsp parent setup on device tree side
> +		 */

This gets copy-pasted A LOT.
Please comment this once and for all ... then reference the comment if
you need to.

> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};

[...]

> +static struct clk_regmap cecb_32k_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = CECB_CLK_CTRL1,
> +		.mask = 0x1,
> +		.shift = 31,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "cecb_32k_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&cecb_32k_sel_pre.hw,
> +			&rtc.hw,
> +		},
> +		.num_parents = 2,
> +		/*
> +		 * CECB_32K clk can be inherited from more accurate RTC clock,
> +		 * so in some situations we may want to freeze its parent.
> +		 * Therefore force cecb_32k parent setup on device tree side
> +		 */

How do you plan on doing that ?

You've made the parent "private" and it is not even available to be
referenced in DT.

This whole concept of public and private to seems broken to me.
I would much prefer you keep the existing model, with one big table and
possibly some IDs not exposed in the bindings.

This gives an hint about the clocks we think consummers should use while
allowing us to change things if we got it wrong, and keep the IDs stable
for DT. This has been working so far. I don't see the benefit of
changing that right now.

> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};
> +

[...]

> +
> +static int meson_a1_periphs_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	void __iomem *base;
> +	struct regmap *map;
> +	int i, err;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base),
> +				     "can't ioremap resource\n");
> +
> +	map = devm_regmap_init_mmio(dev, base, &a1_periphs_regmap_cfg);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map),
> +				     "can't init regmap mmio region\n");
> +
> +	/* Populate regmap for the regmap backed clocks */
> +	for (i = 0; i < ARRAY_SIZE(a1_periphs_regmaps); i++)
> +		a1_periphs_regmaps[i]->map = map;
> +
> +	/* DT clocks registration */
> +	err = meson_a1_periphs_clks_register(dev, &a1_periphs_public_clks);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "public clks registration failed\n");
> +
> +	/* Internal clocks registration */
> +	err = meson_a1_periphs_clks_register(dev, &a1_periphs_private_clks);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "private clks registration failed\n");

I defenitely don't like this public/private concept.
Please remove it

> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   &a1_periphs_public_clks);
> +}
> +

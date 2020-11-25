Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300CCC56201
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 17:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB29E206D9
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 17:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jK5CH9sE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732754AbgKYRcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 12:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732724AbgKYRcg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Nov 2020 12:32:36 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A9FC061A4F
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 09:32:28 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id e7so2707319wrv.6
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 09:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=YeiDrEc86xIycJfwKc5bLCqAgMKj5XTfNaIBX6lyjdA=;
        b=jK5CH9sEY686hQgSKe1CwyrnXFmIAXDl+oH3T/yxkKLng6zt5CB9uStMQrqx9Kuuaw
         dDKmaV/d8ZQr8XFFV5sl1t7MD1d6pjgw8aP/xEywbNs+e/hzP5/DBPH8X0xPoUj+kTm4
         remvAq2JEgWSHMBKs4vp04i4hGdo0gz3l8hS4umApryHihbAC1gIycECc2qbeTQaiRqr
         jq2u/U6sTX7pITA/7cceQIbjh0Na7Ci5G4TXL7mhjzMbbEe03kBP4vlbjOvFzmGq4omk
         t3cpmgZrR0xklyKicea/ZejNOe4ojbtdwPPYOlPa0m9UdegnotnOg0dc3gF/vYu95dRy
         X9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=YeiDrEc86xIycJfwKc5bLCqAgMKj5XTfNaIBX6lyjdA=;
        b=Ipa54rrJsoGHH1Ai0W8JOBPJGJpmB4yMUMtnsEv7VH6/PiG1zNv2L5gTMO/yodOqUZ
         9VonkA/4lST4+aemV4a7Qnln4ThCjtpJqQtgAtFQuX+PfXvwhj2CzTlFMm+cqodGA9up
         i1xJrUcLhy/N0V33tP8fu3+Ds+aNQ1znsc4FM3octiinDWnvQWTjXn32XHoNeu01AxFm
         s/UnnwVzQr84EbW3xrrwzOpVUw2qAhMGDFkrE3TxWKcYNrCkdqoz2XuWrcKQ1HyLeDZt
         mjjt3Yz93iiM30+o1yTOQjYWOzdNJ50VD9qxuHfqnqYurJ8k2Z+6rQnWSJtKwotG3r1M
         +T0A==
X-Gm-Message-State: AOAM532OX+yuOwit96tHL6FXis5rd5ZRqsHJlQf1Ka8h6rF7GsFUByKW
        TRyRzMdzRKjXdSbISGZHGamvMJ+DZ0g053sf
X-Google-Smtp-Source: ABdhPJyaibWquAMim/5GHYlHcizp6oZtp39RwCmendo1r++fTRExKmfqUjlExXkf4zP10ewkK4e+5w==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr5354145wrt.312.1606325547270;
        Wed, 25 Nov 2020 09:32:27 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id p4sm5740947wrm.51.2020.11.25.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 09:32:26 -0800 (PST)
References: <20201123163811.353444-1-narmstrong@baylibre.com>
 <20201123163811.353444-3-narmstrong@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
In-reply-to: <20201123163811.353444-3-narmstrong@baylibre.com>
Message-ID: <1jlfep8hqu.fsf@starbuckisacylon.baylibre.com>
Date:   Wed, 25 Nov 2020 18:32:25 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 23 Nov 2020 at 17:38, Neil Armstrong <narmstrong@baylibre.com> wrote:

> This adds the MIPI DSI Host Pixel Clock, unlike AXG, the pixel clock can be different
> from the VPU ENCL output clock to feed the DSI Host controller with a different clock rate.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Series looks good.
2 minor comments below 

> ---
>  drivers/clk/meson/g12a.c | 72 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h |  3 +-
>  2 files changed, 74 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 3cb8196c8e29..3dedf8408405 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -3658,6 +3658,66 @@ static struct clk_regmap g12a_hdmi_tx = {
>  	},
>  };
>  
> +/* MIPI DSI Host Clocks */
> +
> +static const struct clk_hw *g12a_mipi_dsi_pxclk_parent_hws[] = {
> +	&g12a_vid_pll.hw,
> +	&g12a_gp0_pll.hw,
> +	&g12a_hifi_pll.hw,
> +	&g12a_mpll1.hw,
> +	&g12a_fclk_div2.hw,
> +	&g12a_fclk_div2p5.hw,
> +	&g12a_fclk_div3.hw,
> +	&g12a_fclk_div7.hw,
> +};
> +
> +static struct clk_regmap g12a_mipi_dsi_pxclk_sel = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
> +		.mask = 0x7,
> +		.shift = 12,
> +		.flags = CLK_MUX_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mipi_dsi_pxclk_sel",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = g12a_mipi_dsi_pxclk_parent_hws,
> +		.num_parents = ARRAY_SIZE(g12a_mipi_dsi_pxclk_parent_hws),
> +		.flags = CLK_SET_RATE_PARENT,

The id of the mux is exposed which seems to hint the mux will be
manually controller but CLK_SET_RATE_NO_REPARENT is not set. Is this on
purpose ?

> +	},
> +};
> +
> +static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
> +	.data = &(struct clk_regmap_div_data){
> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mipi_dsi_pxclk_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +					&g12a_mipi_dsi_pxclk_sel.hw },

Alignment here is weird compared to the reset of the file

> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap g12a_mipi_dsi_pxclk = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = HHI_MIPIDSI_PHY_CLK_CNTL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mipi_dsi_pxclk",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +					&g12a_mipi_dsi_pxclk_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
>  /* HDMI Clocks */
>  
>  static const struct clk_parent_data g12a_hdmi_parent_data[] = {
> @@ -4403,6 +4463,9 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
>  		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>  		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>  		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -4658,6 +4721,9 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
>  		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
>  		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
>  		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -4904,6 +4970,9 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
>  		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
>  		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
>  		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
> +		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
> +		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
> +		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
>  		[NR_CLKS]			= NULL,
>  	},
>  	.num = NR_CLKS,
> @@ -5151,6 +5220,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
>  	&sm1_nna_core_clk_sel,
>  	&sm1_nna_core_clk_div,
>  	&sm1_nna_core_clk,
> +	&g12a_mipi_dsi_pxclk_sel,
> +	&g12a_mipi_dsi_pxclk_div,
> +	&g12a_mipi_dsi_pxclk,
>  };
>  
>  static const struct reg_sequence g12a_init_regs[] = {
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index 69b6a69549c7..a97613df38b3 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -264,8 +264,9 @@
>  #define CLKID_NNA_AXI_CLK_DIV			263
>  #define CLKID_NNA_CORE_CLK_SEL			265
>  #define CLKID_NNA_CORE_CLK_DIV			266
> +#define CLKID_MIPI_DSI_PXCLK_DIV		268
>  
> -#define NR_CLKS					268
> +#define NR_CLKS					271
>  
>  /* include the CLKIDs that have been made part of the DT binding */
>  #include <dt-bindings/clock/g12a-clkc.h>


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC40DC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 12:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B31E26115A
	for <linux-clk@archiver.kernel.org>; Thu, 23 Sep 2021 12:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240991AbhIWM3g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Sep 2021 08:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240787AbhIWM3f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Sep 2021 08:29:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59345C061574
        for <linux-clk@vger.kernel.org>; Thu, 23 Sep 2021 05:28:04 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t7so16576681wrw.13
        for <linux-clk@vger.kernel.org>; Thu, 23 Sep 2021 05:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=sAdDiXDZ/ozWki9RSCsBqvvHl/GawwV89+dUg68JVq8=;
        b=BDXZVCc2q3lUic06eI3A7pNDnf84wSyFsIdbpRH87Y1hocUMgNUr/65awHzxDmJZoY
         7qHQlEyKcr9x5XPCrFTDjw2HxK/neuaGQ7ikFVdBzhbqCfU4PeiNlwLNq3xdEWAtXMbc
         C76CU52Un+GJTwpTpncBNvcUZvt5D82xg96D5bm+LfylIPIUV+Xo/WxTkxiWPPGNl8Mw
         oe+dVo22saiCKJ49QVuhpK7O503tjNYNxkp3acDuF//Pn7Cz5i1Q2p2QE+kVVbH0Ebuw
         E/icgCdrONhpYBAE7aaeymF0FtGtkQFRrsvyCDSzkqko8hq3oT5fW7eSk3WuJoHstfJ9
         GlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=sAdDiXDZ/ozWki9RSCsBqvvHl/GawwV89+dUg68JVq8=;
        b=fNi68iX8h8aDpKNBMMZaNm8qKNBQjCDa2zpmuRvymOJ7HTLH+FE2iEXsGpcWVK9gk3
         AOIimyxWMXo3Ldnj73Vxw9SfWKmr8bphb4fl9y0ThrERRbaN7s+jjL46VOx+33SUad4+
         BB6o9XZ8A3ySis+4Ml7mPSmPHi09SkgkDoyFRHo8hvjWdEInNm5GJcvxfSrwQVZX1JNd
         gvX9r0MLRvLJ7E4CCyPem41cOssHqeUMJ4efaeLxOwzruqHNut39vaao1Q6Nso2vAW5N
         9A3mkmpJFsOH2OIXNlcZF2Ghuoj0Z7+Sho/YGwitXDTOM8lbcprYZWE+eHBcfHfU1diF
         PQkA==
X-Gm-Message-State: AOAM530ISGDqidHkxRpQ8r/0X0+6n0kRdx57/noGNpJ4PXuPfKzN4fzH
        W4pHG+bWZ7EI9RZhPXAFYlGaNwN+rsBa2Q==
X-Google-Smtp-Source: ABdhPJySJCgEKUbETC/WzFrGyif34wRWks/YRffd0ZNtreRY1aDIrHVWc3NFuOItxOSkidyD/nRpDA==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id e34mr16103109wmp.50.1632400082959;
        Thu, 23 Sep 2021 05:28:02 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y18sm5113842wrq.6.2021.09.23.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 05:28:02 -0700 (PDT)
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
 <20210713232510.3057750-4-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, narmstrong@baylibre.com
Subject: Re: [PATCH 3/6] clk: meson: meson8b: Add the HDMI PLL M/N parameters
Date:   Thu, 23 Sep 2021 14:22:37 +0200
In-reply-to: <20210713232510.3057750-4-martin.blumenstingl@googlemail.com>
Message-ID: <1jfstvschd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 14 Jul 2021 at 01:25, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The 3.10 vendor kernel uses only specific HDMI PLL M/N parameter
> combinations. The PLL won't lock for values smaller than 50 if the
> internal doubling (which is yet unknown how to use it) is disabled.
> However, when this doubling is enabled then the values smaller than 50
> will lock just fine. The only restriction for values greater than 50 is
> that the resulting frequency must not exceed the 3.0GHz limit.

Hum, it's not the first time we have that type of issue.
I'm thinking that, instead of using mult_range, we should probably have
min and max output frequencies . The datasheet usually documents these
values for PLL DCO. Something to think about ...

>
> These values are taken from the endlessm 3.10 kernel which includes
> additional M/N combinations for some VESA and 75Hz display modes.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 9ccffbfe44e5..8f29d26ed726 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -118,6 +118,27 @@ static struct clk_regmap meson8b_fixed_pll = {
>  	},
>  };
>  
> +static const struct pll_params_table hdmi_pll_params_table[] = {
> +	PLL_PARAMS(40, 1),
> +	PLL_PARAMS(42, 1),
> +	PLL_PARAMS(44, 1),
> +	PLL_PARAMS(45, 1),
> +	PLL_PARAMS(49, 1),
> +	PLL_PARAMS(52, 1),
> +	PLL_PARAMS(54, 1),
> +	PLL_PARAMS(56, 1),
> +	PLL_PARAMS(59, 1),
> +	PLL_PARAMS(60, 1),
> +	PLL_PARAMS(61, 1),
> +	PLL_PARAMS(62, 1),
> +	PLL_PARAMS(64, 1),
> +	PLL_PARAMS(66, 1),
> +	PLL_PARAMS(68, 1),
> +	PLL_PARAMS(71, 1),
> +	PLL_PARAMS(82, 1),
> +	{ /* sentinel */ }
> +};
> +
>  static struct clk_regmap meson8b_hdmi_pll_dco = {
>  	.data = &(struct meson_clk_pll_data){
>  		.en = {
> @@ -150,6 +171,7 @@ static struct clk_regmap meson8b_hdmi_pll_dco = {
>  			.shift   = 29,
>  			.width   = 1,
>  		},
> +		.table = hdmi_pll_params_table,
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		/* sometimes also called "HPLL" or "HPLL PLL" */


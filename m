Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FD828DB48
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138690; cv=none; b=seuF+botzwLZ9r7gSPdXqP4vwoz76ck3VFkXm2ubpWZQLesd0lPxu8coXpdciPPzAPTDufGc9h9evUcbhuLq+LPUvu2Ti0kKo89+aB6m2d+6z4jQW5KWzsOdJpVep1cKpTbOiJcJKl4V9ol9EfE7Fch+6bZBbzRlFJQxYKVgfq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138690; c=relaxed/simple;
	bh=3Kp2lL3c5bPezatIHuV8iC4EKTnIBC9oP8yrNWjQJ70=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DXHH6p5hKTEq3lEyT2feXa4vYVsh19gUB9jxRz8wZ0N6YRAs0kaltWlwf9nDXXANfq7ms417d/Z/rCFjRoijIPH/hCHVkrbmLUQhkSKxmyysdmGt/NC2Ws1PWzNV3n2f5VPZVhrQTHZZqXXx0c9ezvfcXPmTSQX+5nhzG/WjmaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pLs7fQvS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pLs7fQvS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso513479f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752138685; x=1752743485; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKAR3rf4mzMzM/j7JiGXgY9bLFcj2b58tTeLzbaqoAo=;
        b=pLs7fQvSE6veKD0D6ksh06Qm042XyPVBrcLhpOu2nuOfpyDKggAhU9zhmjVs11AQbQ
         5UcjxTWCwMw59tNUNjr201P83smffI0T0R9QhUKgpMeqyn61+lbeas8JoW1sny/6zVLc
         LR7zJ6gVUtkUkFZkGIndcq+BV8HBBbV+8KYCJQOPXYio6E0ecuK7C5Iz2H96usAqwoUf
         5IlQR5wlGRxVN1p5o4P7UYGoIQqAlXthU9mRFNMDss70wkQV8+s6kqfIrjQNr1bDFRhP
         0aJsboLVZ5gt4e24dsyD4R9/HVPUEFAfOU77fvBdu2H6u3Ox8/Pp231rbx72HZQru83c
         8Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752138685; x=1752743485;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKAR3rf4mzMzM/j7JiGXgY9bLFcj2b58tTeLzbaqoAo=;
        b=a54xIsh2lXGc+eKIlFklVbJT9CLJVPOMDDv9vYVpVJ+RYbTXLQ3cxRuL/tgAwBjj7I
         92lRShVb6imo1/53vGDaj7cRbIBzGSn214cUc+dMRBGBKzIIqJ4nGvXRY+KpC1Y5d2T4
         2x7EqUyH2w7oI0csBIfFJgJNcgsLS5/SH42aN0dWF159VOqnY/lYs0XuhWkFyqKC4IoC
         O92TjAAEKhEdApRvntX2U762inQunzlQA6ep9LudTyIlWPsvYBPli+EsgRGDbfQsam/N
         HPN3r5qz6DLvVers2ir3oMRmoAYr9e5MkXQCajMWZ0PJLaiMr54cKyVaPMWTfIUAqHl7
         LcWg==
X-Forwarded-Encrypted: i=1; AJvYcCW4CYervrG5zLw+9xqq45656JGhK8RKbf1ctfxlrcddizhzrKZfWBxC1MvD4k1WCO1qaBK+qdwfZ6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsrETkgVWavLYgbBkX4c+W/p19fbzeuVsb08pFGrB5pZIfgSa
	e6sE2H3gPSuLMFhY44qBdjVX5Hve5auoneAhe2zrC938Uc6qdnazejcsbpOoR3nnMg8=
X-Gm-Gg: ASbGncuXH8u5EMf7ZZHFKyM/8GmKFXZ6vLyJmLM0pb4KL8bv/znieYAg0q5LC5AAari
	IGoZpE0pYQSYgB9dBULlc9aTctHf5H70yO0zIT9L64KCKTKJBIxUs6y+EquBfoaoYelE3lWRagP
	2LYbW8F+Fz5CkmtafxmN8odukr/BDs5hYX1CUgC0Z6Q6jLSmxm6tJxZqBmLFv/G1VmYoac1Fi98
	SKql6Yhae0QRRfbpNKRPDMEHZNAWOsBmazcq+WgwnKCOcftM0KT1QrtKk5YwZPRj4jCg5FH4gK0
	Ciyntc9AIMuWxovT/a8tgw4wss8Xb71w0WVND/Dspjozm7njyxjzxasEP7MrwA==
X-Google-Smtp-Source: AGHT+IGycRS6fSRqcP2Oa3hZlpuCwYHD4j+AVDmp25ICqMzbzE4rwVF462heSULw4o+KLwX9MkZC9w==
X-Received: by 2002:a05:6000:643:b0:3a4:f72a:b18a with SMTP id ffacd0b85a97d-3b5e8680562mr1699621f8f.26.1752138684537;
        Thu, 10 Jul 2025 02:11:24 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc9268sm1317632f8f.41.2025.07.10.02.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:11:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v5 5/6] clk: meson: axg-audio: Add the mclk pad div for
 s4 chip
In-Reply-To: <20250710-audio_drvier-v5-5-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:41 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
	<20250710-audio_drvier-v5-5-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 11:11:23 +0200
Message-ID: <1j5xg0qukk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 10 Jul 2025 at 11:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> Add MCLK pad divider support and expanded LRCLK/SCLK pad count to five.

This does not describe what the change does and you have a fair amount
of rebasing to do

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  drivers/clk/meson/axg-audio.c | 435 +++++++++++++++++++++++++++++++++++++++++-
>  drivers/clk/meson/axg-audio.h |   6 +
>  2 files changed, 439 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 9df627b142f89788966ede0262aaaf39e13f0b49..7dc1f464bd55fa33ca3260002ed1b3929061f99b 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -323,6 +323,16 @@ static const struct clk_parent_data lrclk_pad_ctrl_parent_data[] = {
>  	AUD_MUX(_name, _reg, 0x7, _shift, 0, _parents,		\
>  		CLK_SET_RATE_NO_REPARENT)
>  
> +#define AUD_MCLK_PAD_MUX(_name, _reg, _shift)					\
> +	AUD_MUX(_name##_sel, _reg, 0x7, _shift, CLK_MUX_ROUND_CLOSEST,			\
> +		mclk_pad_ctrl_parent_data, 0)
> +#define AUD_MCLK_PAD_DIV(_name, _reg, _shift)					\
> +	AUD_DIV(_name##_div, _reg, _shift, 8, CLK_DIVIDER_ROUND_CLOSEST,			\
> +		aud_##_name##_sel, CLK_SET_RATE_PARENT)
> +#define AUD_MCLK_PAD_GATE(_name, _reg, _shift)					\
> +	AUD_GATE(_name, _reg, _shift, aud_##_name##_div,			\
> +		 CLK_SET_RATE_PARENT)
> +
>  /* Common Clocks */
>  static struct clk_regmap ddr_arb =
>  	AUD_PCLK_GATE(ddr_arb, AUDIO_CLK_GATE_EN, 0);
> @@ -826,6 +836,49 @@ static struct clk_regmap sm1_tdm_sclk_pad_1 = AUD_TDM_PAD_CTRL(
>  static struct clk_regmap sm1_tdm_sclk_pad_2 = AUD_TDM_PAD_CTRL(
>  	tdm_sclk_pad_2, AUDIO_SM1_MST_PAD_CTRL1, 8, sclk_pad_ctrl_parent_data);
>  
> +static struct clk_regmap s4_tdm_mclk_pad0_sel =
> +	AUD_MCLK_PAD_MUX(mclk_pad0, AUDIO_S4_MCLK_PAD_CTRL0, 8);
> +static struct clk_regmap s4_tdm_mclk_pad1_sel =
> +	AUD_MCLK_PAD_MUX(mclk_pad1, AUDIO_S4_MCLK_PAD_CTRL0, 24);
> +static struct clk_regmap s4_tdm_mclk_pad2_sel =
> +	AUD_MCLK_PAD_MUX(mclk_pad2, AUDIO_S4_MCLK_PAD_CTRL1, 8);
> +
> +static struct clk_regmap s4_tdm_mclk_pad0_div =
> +	AUD_MCLK_PAD_DIV(mclk_pad0, AUDIO_S4_MCLK_PAD_CTRL0, 0);
> +static struct clk_regmap s4_tdm_mclk_pad1_div =
> +	AUD_MCLK_PAD_DIV(mclk_pad1, AUDIO_S4_MCLK_PAD_CTRL0, 16);
> +static struct clk_regmap s4_tdm_mclk_pad2_div =
> +	AUD_MCLK_PAD_DIV(mclk_pad2, AUDIO_S4_MCLK_PAD_CTRL1, 0);
> +
> +static struct clk_regmap s4_tdm_mclk_pad_0 =
> +	AUD_MCLK_PAD_GATE(mclk_pad0, AUDIO_S4_MCLK_PAD_CTRL0, 15);
> +static struct clk_regmap s4_tdm_mclk_pad_1 =
> +	AUD_MCLK_PAD_GATE(mclk_pad1, AUDIO_S4_MCLK_PAD_CTRL0, 31);
> +static struct clk_regmap s4_tdm_mclk_pad_2 =
> +	AUD_MCLK_PAD_GATE(mclk_pad2, AUDIO_S4_MCLK_PAD_CTRL1, 15);
> +
> +static struct clk_regmap s4_tdm_sclk_pad_0 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_0, AUDIO_S4_SCLK_PAD_CTRL0, 0, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_1 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_1, AUDIO_S4_SCLK_PAD_CTRL0, 4, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_2 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_2, AUDIO_S4_SCLK_PAD_CTRL0, 8, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_3 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_3, AUDIO_S4_SCLK_PAD_CTRL0, 16, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_sclk_pad_4 =
> +	AUD_TDM_PAD_CTRL(tdm_sclk_pad_4, AUDIO_S4_SCLK_PAD_CTRL0, 20, lrclk_pad_ctrl_parent_data);
> +
> +static struct clk_regmap s4_tdm_lrclk_pad_0 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_0, AUDIO_S4_SCLK_PAD_CTRL1, 0, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_1 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_1, AUDIO_S4_SCLK_PAD_CTRL1, 4, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_2 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_2, AUDIO_S4_SCLK_PAD_CTRL1, 8, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_3 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_3, AUDIO_S4_SCLK_PAD_CTRL1, 16, lrclk_pad_ctrl_parent_data);
> +static struct clk_regmap s4_tdm_lrclk_pad_4 =
> +	AUD_TDM_PAD_CTRL(tdm_lrclk_pad_4, AUDIO_S4_SCLK_PAD_CTRL1, 20, lrclk_pad_ctrl_parent_data);
> +
>  /*
>   * Array of all clocks provided by this provider
>   * The input clocks of the controller will be populated at runtime
> @@ -1257,6 +1310,182 @@ static struct clk_hw *sm1_audio_hw_clks[] = {
>  	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
>  };
>  
> +/*
> + * Array of all S4 clocks provided by this provider
> + * The input clocks of the controller will be populated at runtime
> + */
> +static struct clk_hw *s4_audio_hw_clks[] = {
> +	[AUD_CLKID_DDR_ARB]		= &ddr_arb.hw,
> +	[AUD_CLKID_PDM]			= &pdm.hw,
> +	[AUD_CLKID_TDMIN_A]		= &tdmin_a.hw,
> +	[AUD_CLKID_TDMIN_B]		= &tdmin_b.hw,
> +	[AUD_CLKID_TDMIN_C]		= &tdmin_c.hw,
> +	[AUD_CLKID_TDMIN_LB]		= &tdmin_lb.hw,
> +	[AUD_CLKID_TDMOUT_A]		= &tdmout_a.hw,
> +	[AUD_CLKID_TDMOUT_B]		= &tdmout_b.hw,
> +	[AUD_CLKID_TDMOUT_C]		= &tdmout_c.hw,
> +	[AUD_CLKID_FRDDR_A]		= &frddr_a.hw,
> +	[AUD_CLKID_FRDDR_B]		= &frddr_b.hw,
> +	[AUD_CLKID_FRDDR_C]		= &frddr_c.hw,
> +	[AUD_CLKID_TODDR_A]		= &toddr_a.hw,
> +	[AUD_CLKID_TODDR_B]		= &toddr_b.hw,
> +	[AUD_CLKID_TODDR_C]		= &toddr_c.hw,
> +	[AUD_CLKID_LOOPBACK]		= &loopback.hw,
> +	[AUD_CLKID_SPDIFIN]		= &spdifin.hw,
> +	[AUD_CLKID_SPDIFOUT]		= &spdifout.hw,
> +	[AUD_CLKID_RESAMPLE]		= &resample.hw,
> +	[AUD_CLKID_SPDIFOUT_B]		= &spdifout_b.hw,
> +	[AUD_CLKID_MST_A_MCLK_SEL]	= &sm1_mst_a_mclk_sel.hw,
> +	[AUD_CLKID_MST_B_MCLK_SEL]	= &sm1_mst_b_mclk_sel.hw,
> +	[AUD_CLKID_MST_C_MCLK_SEL]	= &sm1_mst_c_mclk_sel.hw,
> +	[AUD_CLKID_MST_D_MCLK_SEL]	= &sm1_mst_d_mclk_sel.hw,
> +	[AUD_CLKID_MST_E_MCLK_SEL]	= &sm1_mst_e_mclk_sel.hw,
> +	[AUD_CLKID_MST_F_MCLK_SEL]	= &sm1_mst_f_mclk_sel.hw,
> +	[AUD_CLKID_MST_A_MCLK_DIV]	= &sm1_mst_a_mclk_div.hw,
> +	[AUD_CLKID_MST_B_MCLK_DIV]	= &sm1_mst_b_mclk_div.hw,
> +	[AUD_CLKID_MST_C_MCLK_DIV]	= &sm1_mst_c_mclk_div.hw,
> +	[AUD_CLKID_MST_D_MCLK_DIV]	= &sm1_mst_d_mclk_div.hw,
> +	[AUD_CLKID_MST_E_MCLK_DIV]	= &sm1_mst_e_mclk_div.hw,
> +	[AUD_CLKID_MST_F_MCLK_DIV]	= &sm1_mst_f_mclk_div.hw,
> +	[AUD_CLKID_MST_A_MCLK]		= &sm1_mst_a_mclk.hw,
> +	[AUD_CLKID_MST_B_MCLK]		= &sm1_mst_b_mclk.hw,
> +	[AUD_CLKID_MST_C_MCLK]		= &sm1_mst_c_mclk.hw,
> +	[AUD_CLKID_MST_D_MCLK]		= &sm1_mst_d_mclk.hw,
> +	[AUD_CLKID_MST_E_MCLK]		= &sm1_mst_e_mclk.hw,
> +	[AUD_CLKID_MST_F_MCLK]		= &sm1_mst_f_mclk.hw,
> +	[AUD_CLKID_SPDIFOUT_CLK_SEL]	= &spdifout_clk_sel.hw,
> +	[AUD_CLKID_SPDIFOUT_CLK_DIV]	= &spdifout_clk_div.hw,
> +	[AUD_CLKID_SPDIFOUT_CLK]	= &spdifout_clk.hw,
> +	[AUD_CLKID_SPDIFOUT_B_CLK_SEL]	= &spdifout_b_clk_sel.hw,
> +	[AUD_CLKID_SPDIFOUT_B_CLK_DIV]	= &spdifout_b_clk_div.hw,
> +	[AUD_CLKID_SPDIFOUT_B_CLK]	= &spdifout_b_clk.hw,
> +	[AUD_CLKID_SPDIFIN_CLK_SEL]	= &spdifin_clk_sel.hw,
> +	[AUD_CLKID_SPDIFIN_CLK_DIV]	= &spdifin_clk_div.hw,
> +	[AUD_CLKID_SPDIFIN_CLK]		= &spdifin_clk.hw,
> +	[AUD_CLKID_PDM_DCLK_SEL]	= &pdm_dclk_sel.hw,
> +	[AUD_CLKID_PDM_DCLK_DIV]	= &pdm_dclk_div.hw,
> +	[AUD_CLKID_PDM_DCLK]		= &pdm_dclk.hw,
> +	[AUD_CLKID_PDM_SYSCLK_SEL]	= &pdm_sysclk_sel.hw,
> +	[AUD_CLKID_PDM_SYSCLK_DIV]	= &pdm_sysclk_div.hw,
> +	[AUD_CLKID_PDM_SYSCLK]		= &pdm_sysclk.hw,
> +	[AUD_CLKID_MST_A_SCLK_PRE_EN]	= &mst_a_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_B_SCLK_PRE_EN]	= &mst_b_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_C_SCLK_PRE_EN]	= &mst_c_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_D_SCLK_PRE_EN]	= &mst_d_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_E_SCLK_PRE_EN]	= &mst_e_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_F_SCLK_PRE_EN]	= &mst_f_sclk_pre_en.hw,
> +	[AUD_CLKID_MST_A_SCLK_DIV]	= &mst_a_sclk_div.hw,
> +	[AUD_CLKID_MST_B_SCLK_DIV]	= &mst_b_sclk_div.hw,
> +	[AUD_CLKID_MST_C_SCLK_DIV]	= &mst_c_sclk_div.hw,
> +	[AUD_CLKID_MST_D_SCLK_DIV]	= &mst_d_sclk_div.hw,
> +	[AUD_CLKID_MST_E_SCLK_DIV]	= &mst_e_sclk_div.hw,
> +	[AUD_CLKID_MST_F_SCLK_DIV]	= &mst_f_sclk_div.hw,
> +	[AUD_CLKID_MST_A_SCLK_POST_EN]	= &mst_a_sclk_post_en.hw,
> +	[AUD_CLKID_MST_B_SCLK_POST_EN]	= &mst_b_sclk_post_en.hw,
> +	[AUD_CLKID_MST_C_SCLK_POST_EN]	= &mst_c_sclk_post_en.hw,
> +	[AUD_CLKID_MST_D_SCLK_POST_EN]	= &mst_d_sclk_post_en.hw,
> +	[AUD_CLKID_MST_E_SCLK_POST_EN]	= &mst_e_sclk_post_en.hw,
> +	[AUD_CLKID_MST_F_SCLK_POST_EN]	= &mst_f_sclk_post_en.hw,
> +	[AUD_CLKID_MST_A_SCLK]		= &mst_a_sclk.hw,
> +	[AUD_CLKID_MST_B_SCLK]		= &mst_b_sclk.hw,
> +	[AUD_CLKID_MST_C_SCLK]		= &mst_c_sclk.hw,
> +	[AUD_CLKID_MST_D_SCLK]		= &mst_d_sclk.hw,
> +	[AUD_CLKID_MST_E_SCLK]		= &mst_e_sclk.hw,
> +	[AUD_CLKID_MST_F_SCLK]		= &mst_f_sclk.hw,
> +	[AUD_CLKID_MST_A_LRCLK_DIV]	= &mst_a_lrclk_div.hw,
> +	[AUD_CLKID_MST_B_LRCLK_DIV]	= &mst_b_lrclk_div.hw,
> +	[AUD_CLKID_MST_C_LRCLK_DIV]	= &mst_c_lrclk_div.hw,
> +	[AUD_CLKID_MST_D_LRCLK_DIV]	= &mst_d_lrclk_div.hw,
> +	[AUD_CLKID_MST_E_LRCLK_DIV]	= &mst_e_lrclk_div.hw,
> +	[AUD_CLKID_MST_F_LRCLK_DIV]	= &mst_f_lrclk_div.hw,
> +	[AUD_CLKID_MST_A_LRCLK]		= &mst_a_lrclk.hw,
> +	[AUD_CLKID_MST_B_LRCLK]		= &mst_b_lrclk.hw,
> +	[AUD_CLKID_MST_C_LRCLK]		= &mst_c_lrclk.hw,
> +	[AUD_CLKID_MST_D_LRCLK]		= &mst_d_lrclk.hw,
> +	[AUD_CLKID_MST_E_LRCLK]		= &mst_e_lrclk.hw,
> +	[AUD_CLKID_MST_F_LRCLK]		= &mst_f_lrclk.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_SEL]	= &tdmin_a_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_SEL]	= &tdmin_b_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK_SEL]	= &tdmin_c_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_SEL]	= &tdmin_lb_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_SEL]	= &tdmout_a_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_SEL]	= &tdmout_b_sclk_sel.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK_SEL]	= &tdmout_c_sclk_sel.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_PRE_EN]	= &tdmin_a_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_PRE_EN]	= &tdmin_b_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK_PRE_EN]	= &tdmin_c_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_PRE_EN] = &tdmin_lb_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_PRE_EN] = &tdmout_a_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_PRE_EN] = &tdmout_b_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK_PRE_EN] = &tdmout_c_sclk_pre_en.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK_POST_EN] = &tdmin_a_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK_POST_EN] = &tdmin_b_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK_POST_EN] = &tdmin_c_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK_POST_EN] = &tdmin_lb_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK_POST_EN] = &tdmout_a_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK_POST_EN] = &tdmout_b_sclk_post_en.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK_POST_EN] = &tdmout_c_sclk_post_en.hw,
> +	[AUD_CLKID_TDMIN_A_SCLK]	= &tdmin_a_sclk.hw,
> +	[AUD_CLKID_TDMIN_B_SCLK]	= &tdmin_b_sclk.hw,
> +	[AUD_CLKID_TDMIN_C_SCLK]	= &tdmin_c_sclk.hw,
> +	[AUD_CLKID_TDMIN_LB_SCLK]	= &tdmin_lb_sclk.hw,
> +	[AUD_CLKID_TDMOUT_A_SCLK]	= &g12a_tdmout_a_sclk.hw,
> +	[AUD_CLKID_TDMOUT_B_SCLK]	= &g12a_tdmout_b_sclk.hw,
> +	[AUD_CLKID_TDMOUT_C_SCLK]	= &g12a_tdmout_c_sclk.hw,
> +	[AUD_CLKID_TDMIN_A_LRCLK]	= &tdmin_a_lrclk.hw,
> +	[AUD_CLKID_TDMIN_B_LRCLK]	= &tdmin_b_lrclk.hw,
> +	[AUD_CLKID_TDMIN_C_LRCLK]	= &tdmin_c_lrclk.hw,
> +	[AUD_CLKID_TDMIN_LB_LRCLK]	= &tdmin_lb_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
> +	[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
> +	[AUD_CLKID_TOP]			= &sm1_aud_top.hw,
> +	[AUD_CLKID_TORAM]		= &toram.hw,
> +	[AUD_CLKID_EQDRC]		= &eqdrc.hw,
> +	[AUD_CLKID_RESAMPLE_B]		= &resample_b.hw,
> +	[AUD_CLKID_TOVAD]		= &tovad.hw,
> +	[AUD_CLKID_LOCKER]		= &locker.hw,
> +	[AUD_CLKID_SPDIFIN_LB]		= &spdifin_lb.hw,
> +	[AUD_CLKID_FRDDR_D]		= &frddr_d.hw,
> +	[AUD_CLKID_TODDR_D]		= &toddr_d.hw,
> +	[AUD_CLKID_LOOPBACK_B]		= &loopback_b.hw,
> +	[AUD_CLKID_CLK81_EN]		= &sm1_clk81_en.hw,
> +	[AUD_CLKID_SYSCLK_A_DIV]	= &sm1_sysclk_a_div.hw,
> +	[AUD_CLKID_SYSCLK_A_EN]		= &sm1_sysclk_a_en.hw,
> +	[AUD_CLKID_SYSCLK_B_DIV]	= &sm1_sysclk_b_div.hw,
> +	[AUD_CLKID_SYSCLK_B_EN]		= &sm1_sysclk_b_en.hw,
> +	[AUD_CLKID_EARCRX]		= &earcrx.hw,
> +	[AUD_CLKID_EARCRX_CMDC_SEL]	= &sm1_earcrx_cmdc_clk_sel.hw,
> +	[AUD_CLKID_EARCRX_CMDC_DIV]	= &sm1_earcrx_cmdc_clk_div.hw,
> +	[AUD_CLKID_EARCRX_CMDC]		= &sm1_earcrx_cmdc_clk.hw,
> +	[AUD_CLKID_EARCRX_DMAC_SEL]	= &sm1_earcrx_dmac_clk_sel.hw,
> +	[AUD_CLKID_EARCRX_DMAC_DIV]	= &sm1_earcrx_dmac_clk_div.hw,
> +	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
> +
> +};
> +
> +static struct clk_hw *audio_clock_pads_hw_clks[] = {
> +	[AUD_CLKID_TDM_MCLK_PAD0]	= &s4_tdm_mclk_pad_0.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD1]	= &s4_tdm_mclk_pad_1.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD0]	= &s4_tdm_lrclk_pad_0.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD1]	= &s4_tdm_lrclk_pad_1.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD2]	= &s4_tdm_lrclk_pad_2.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD0]	= &s4_tdm_sclk_pad_0.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD1]	= &s4_tdm_sclk_pad_1.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD2]	= &s4_tdm_sclk_pad_2.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD0_SEL]		= &s4_tdm_mclk_pad0_sel.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD1_SEL]       = &s4_tdm_mclk_pad1_sel.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD0_DIV]		= &s4_tdm_mclk_pad0_div.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD1_DIV]       = &s4_tdm_mclk_pad1_div.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD2]	        = &s4_tdm_mclk_pad_2.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD2_SEL]		= &s4_tdm_mclk_pad2_sel.hw,
> +	[AUD_CLKID_TDM_MCLK_PAD2_DIV]       = &s4_tdm_mclk_pad2_div.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD3]	= &s4_tdm_sclk_pad_3.hw,
> +	[AUD_CLKID_TDM_SCLK_PAD4]	= &s4_tdm_sclk_pad_4.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD3]	= &s4_tdm_lrclk_pad_3.hw,
> +	[AUD_CLKID_TDM_LRCLK_PAD4]	= &s4_tdm_lrclk_pad_4.hw,
> +
> +};
>  
>  /* Convenience table to populate regmap in .probe(). */
>  static struct clk_regmap *const axg_clk_regmaps[] = {
> @@ -1678,6 +1907,177 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
>  	&sm1_earcrx_dmac_clk,
>  };
>  
> +static struct clk_regmap *const s4_clk_regmaps[] = {
> +	&ddr_arb,
> +	&pdm,
> +	&tdmin_a,
> +	&tdmin_b,
> +	&tdmin_c,
> +	&tdmin_lb,
> +	&tdmout_a,
> +	&tdmout_b,
> +	&tdmout_c,
> +	&frddr_a,
> +	&frddr_b,
> +	&frddr_c,
> +	&toddr_a,
> +	&toddr_b,
> +	&toddr_c,
> +	&loopback,
> +	&spdifin,
> +	&spdifout,
> +	&resample,
> +	&spdifout_b,
> +	&sm1_mst_a_mclk_sel,
> +	&sm1_mst_b_mclk_sel,
> +	&sm1_mst_c_mclk_sel,
> +	&sm1_mst_d_mclk_sel,
> +	&sm1_mst_e_mclk_sel,
> +	&sm1_mst_f_mclk_sel,
> +	&sm1_mst_a_mclk_div,
> +	&sm1_mst_b_mclk_div,
> +	&sm1_mst_c_mclk_div,
> +	&sm1_mst_d_mclk_div,
> +	&sm1_mst_e_mclk_div,
> +	&sm1_mst_f_mclk_div,
> +	&sm1_mst_a_mclk,
> +	&sm1_mst_b_mclk,
> +	&sm1_mst_c_mclk,
> +	&sm1_mst_d_mclk,
> +	&sm1_mst_e_mclk,
> +	&sm1_mst_f_mclk,
> +	&spdifout_clk_sel,
> +	&spdifout_clk_div,
> +	&spdifout_clk,
> +	&spdifin_clk_sel,
> +	&spdifin_clk_div,
> +	&spdifin_clk,
> +	&pdm_dclk_sel,
> +	&pdm_dclk_div,
> +	&pdm_dclk,
> +	&pdm_sysclk_sel,
> +	&pdm_sysclk_div,
> +	&pdm_sysclk,
> +	&mst_a_sclk_pre_en,
> +	&mst_b_sclk_pre_en,
> +	&mst_c_sclk_pre_en,
> +	&mst_d_sclk_pre_en,
> +	&mst_e_sclk_pre_en,
> +	&mst_f_sclk_pre_en,
> +	&mst_a_sclk_div,
> +	&mst_b_sclk_div,
> +	&mst_c_sclk_div,
> +	&mst_d_sclk_div,
> +	&mst_e_sclk_div,
> +	&mst_f_sclk_div,
> +	&mst_a_sclk_post_en,
> +	&mst_b_sclk_post_en,
> +	&mst_c_sclk_post_en,
> +	&mst_d_sclk_post_en,
> +	&mst_e_sclk_post_en,
> +	&mst_f_sclk_post_en,
> +	&mst_a_sclk,
> +	&mst_b_sclk,
> +	&mst_c_sclk,
> +	&mst_d_sclk,
> +	&mst_e_sclk,
> +	&mst_f_sclk,
> +	&mst_a_lrclk_div,
> +	&mst_b_lrclk_div,
> +	&mst_c_lrclk_div,
> +	&mst_d_lrclk_div,
> +	&mst_e_lrclk_div,
> +	&mst_f_lrclk_div,
> +	&mst_a_lrclk,
> +	&mst_b_lrclk,
> +	&mst_c_lrclk,
> +	&mst_d_lrclk,
> +	&mst_e_lrclk,
> +	&mst_f_lrclk,
> +	&tdmin_a_sclk_sel,
> +	&tdmin_b_sclk_sel,
> +	&tdmin_c_sclk_sel,
> +	&tdmin_lb_sclk_sel,
> +	&tdmout_a_sclk_sel,
> +	&tdmout_b_sclk_sel,
> +	&tdmout_c_sclk_sel,
> +	&tdmin_a_sclk_pre_en,
> +	&tdmin_b_sclk_pre_en,
> +	&tdmin_c_sclk_pre_en,
> +	&tdmin_lb_sclk_pre_en,
> +	&tdmout_a_sclk_pre_en,
> +	&tdmout_b_sclk_pre_en,
> +	&tdmout_c_sclk_pre_en,
> +	&tdmin_a_sclk_post_en,
> +	&tdmin_b_sclk_post_en,
> +	&tdmin_c_sclk_post_en,
> +	&tdmin_lb_sclk_post_en,
> +	&tdmout_a_sclk_post_en,
> +	&tdmout_b_sclk_post_en,
> +	&tdmout_c_sclk_post_en,
> +	&tdmin_a_sclk,
> +	&tdmin_b_sclk,
> +	&tdmin_c_sclk,
> +	&tdmin_lb_sclk,
> +	&g12a_tdmout_a_sclk,
> +	&g12a_tdmout_b_sclk,
> +	&g12a_tdmout_c_sclk,
> +	&tdmin_a_lrclk,
> +	&tdmin_b_lrclk,
> +	&tdmin_c_lrclk,
> +	&tdmin_lb_lrclk,
> +	&tdmout_a_lrclk,
> +	&tdmout_b_lrclk,
> +	&tdmout_c_lrclk,
> +	&spdifout_b_clk_sel,
> +	&spdifout_b_clk_div,
> +	&spdifout_b_clk,
> +	&sm1_aud_top,
> +	&toram,
> +	&eqdrc,
> +	&resample_b,
> +	&tovad,
> +	&locker,
> +	&spdifin_lb,
> +	&frddr_d,
> +	&toddr_d,
> +	&loopback_b,
> +	&sm1_clk81_en,
> +	&sm1_sysclk_a_div,
> +	&sm1_sysclk_a_en,
> +	&sm1_sysclk_b_div,
> +	&sm1_sysclk_b_en,
> +	&earcrx,
> +	&sm1_earcrx_cmdc_clk_sel,
> +	&sm1_earcrx_cmdc_clk_div,
> +	&sm1_earcrx_cmdc_clk,
> +	&sm1_earcrx_dmac_clk_sel,
> +	&sm1_earcrx_dmac_clk_div,
> +	&sm1_earcrx_dmac_clk,
> +};
> +
> +static struct clk_regmap *const clk_pads_regmaps[] = {
> +	&s4_tdm_mclk_pad_0,
> +	&s4_tdm_mclk_pad_1,
> +	&s4_tdm_mclk_pad_2,
> +	&s4_tdm_lrclk_pad_0,
> +	&s4_tdm_lrclk_pad_1,
> +	&s4_tdm_lrclk_pad_2,
> +	&s4_tdm_lrclk_pad_3,
> +	&s4_tdm_lrclk_pad_4,
> +	&s4_tdm_sclk_pad_0,
> +	&s4_tdm_sclk_pad_1,
> +	&s4_tdm_sclk_pad_2,
> +	&s4_tdm_sclk_pad_3,
> +	&s4_tdm_sclk_pad_4,
> +	&s4_tdm_mclk_pad0_sel,
> +	&s4_tdm_mclk_pad1_sel,
> +	&s4_tdm_mclk_pad0_div,
> +	&s4_tdm_mclk_pad1_div,
> +	&s4_tdm_mclk_pad2_sel,
> +	&s4_tdm_mclk_pad2_div,
> +};
> +
>  struct axg_audio_reset_data {
>  	struct reset_controller_dev rstc;
>  	struct regmap *map;
> @@ -1802,7 +2202,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  	if (IS_ERR(clk))
>  		return PTR_ERR(clk);
>  
> -	ret = device_reset(dev);
> +	/*some clock control might be no reset*/
> +	ret = device_reset_optional(dev);

It is not optional on existing SoC.

What about RESET1 bit 0 on S4 ?

>  	if (ret) {
>  		dev_err_probe(dev, ret, "failed to reset device\n");
>  		return ret;
> @@ -1886,6 +2287,30 @@ static const struct audioclk_data sm1_audioclk_data = {
>  	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
>  };
>  
> +static const struct audioclk_data s4_audioclk_data = {
> +	.regmap_clks = s4_clk_regmaps,
> +	.regmap_clk_num = ARRAY_SIZE(s4_clk_regmaps),
> +	.hw_clks = {
> +		.hws = s4_audio_hw_clks,
> +		.num = ARRAY_SIZE(s4_audio_hw_clks),
> +	},
> +	.reset_offset = AUDIO_SM1_SW_RESET0,
> +	.reset_num = 39,
> +	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
> +};
> +
> +static const struct audioclk_data audioclk_pads_data = {
> +	.regmap_clks = clk_pads_regmaps,
> +	.regmap_clk_num = ARRAY_SIZE(clk_pads_regmaps),
> +	.hw_clks = {
> +		.hws = audio_clock_pads_hw_clks,
> +		.num = ARRAY_SIZE(audio_clock_pads_hw_clks),
> +	},
> +	.reset_offset = AUDIO_SM1_SW_RESET0,
> +	.reset_num = 0,
> +	.max_register = AUDIO_S4_SCLK_PAD_CTRL1,
> +};

Ok ... now I get it. This is not described anywhere !
There is no reason from this be in the same file/driver AFAICT.

> +
>  static const struct of_device_id clkc_match_table[] = {
>  	{
>  		.compatible = "amlogic,axg-audio-clkc",
> @@ -1896,7 +2321,13 @@ static const struct of_device_id clkc_match_table[] = {
>  	}, {
>  		.compatible = "amlogic,sm1-audio-clkc",
>  		.data = &sm1_audioclk_data
> -	}, {}
> +	}, {
> +		.compatible = "amlogic,s4-audio-clkc",
> +		.data = &s4_audioclk_data
> +	}, {
> +		.compatible = "amlogic,clock-pads-clkc",
> +		.data = &audioclk_pads_data
> +	}, { },
>  };
>  MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
> diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
> index 9e7765b630c96a8029140539ffda789b7db5277a..24233c40171034eba86c699db0200f07555926af 100644
> --- a/drivers/clk/meson/axg-audio.h
> +++ b/drivers/clk/meson/axg-audio.h
> @@ -67,4 +67,10 @@
>  #define AUDIO_EARCRX_CMDC_CLK_CTRL	0x0D0
>  #define AUDIO_EARCRX_DMAC_CLK_CTRL	0x0D4
>  
> +/* s4 clock pads use new reg base */
> +#define AUDIO_S4_MCLK_PAD_CTRL0 0x0
> +#define AUDIO_S4_MCLK_PAD_CTRL1 0x4
> +#define AUDIO_S4_SCLK_PAD_CTRL0 0x8
> +#define AUDIO_S4_SCLK_PAD_CTRL1 0xC
> +
>  #endif /*__AXG_AUDIO_CLKC_H */

-- 
Jerome

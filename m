Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCBD21149F
	for <linux-clk@vger.kernel.org>; Thu,  6 Mar 2025 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276744; cv=none; b=YR4+P83rEzbwhiqvIgS4X1Yxq4xm20Kvbv4YD2pUKBs4tnEga47D5w2SXl6MC17/cLp22MQ0W3tnXLaAQWPKGCgdt93xCQjtsherfNuHEgzY2uoQtwjHOqxYL87SnhV91+VKkDd/RtmT8EkErXwwoB6ZS1TIyI5u2Gux77WuuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276744; c=relaxed/simple;
	bh=1jz3wmvzLkfkl5PFGAa1pnV6apaxVdgRZACkDbowk8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TGVOIhfvbV5QLq3aMIxuV25ZKucwecE+lKO05r3wSf3dnWVnMvcVzSmJHHhR0/UHOuoa5mt7PIwM7ba2KiK42fDu7iZIT/9Ti/RShxIBeB0Bm8ZkXXh40m8VM2iTwUoD1lLSqgegAFRm5b+Ms/5rXswOP1qhWWt7b7wX6l/EPYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LD9CrNxJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LD9CrNxJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso5587505e9.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Mar 2025 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741276740; x=1741881540; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rr6HJYrIFdh0rI3RgJKPVqyOkkzSUwbjgMWnVkXlprE=;
        b=LD9CrNxJLsn0xQe8Ti0/QLggnwQkcozZX97HRbp38cecmmTolLyrJhR5Lhoq6j3Xzl
         /AuyJr8+6nP5cRZ9KLUPBVYVf1jsy+HvsEq/8hsgU5W0pBGcRzcMfFIahiGDpCYq5ANp
         HINkZQw+Yl1BtXLd5mMgBtcnW/JqSpjhb6sZa0OVPsWVqoQqEobDczbvsHE6tQNDth+q
         dytHcuOXIGLComwrPyZiLJqxpeUqh/18bqTfDO68Yxe+al16qhMzWDilBJfz8IrRfQlm
         3TOLjOFVxj0Loomvwqk3BapIrJLFicWTLM7J34u0htkLG7zh2MscE95pcrXAEMSacQ0i
         8tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276740; x=1741881540;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr6HJYrIFdh0rI3RgJKPVqyOkkzSUwbjgMWnVkXlprE=;
        b=kvYqPAvD7UjNMxOTNoWPV8Ybch4WGvXYPIyAag0TEHza+S6fJL82r3xQJX34eprq3O
         maboGTRUsD+qK5IzT+G0P6eS2F0q5/0oESBpTS81lTB45lM4V+HCs0iJFYL+NNlYo17A
         hpp5+skjmh68tdGjkE0e72OZNHCoz1trg1h6HK61le6a6uPgCi5NtFx/CpyTH+FowvgU
         lNmjlqfuwOQGOtfFtyn+Ra1Lrz2ZYVjK5G/MRsXSTCBpA986xC1DhrUEJ+pExU1ofrW2
         iKpZfbMLPovykUzLS8gZS75EBW6eYGYD693Lku4KkrJVCDtRn/0PGytZ0ZR/yH0sylCB
         g/iw==
X-Forwarded-Encrypted: i=1; AJvYcCUIfRV3wYQp3qFW5/K6iYHIGIdaKFRoEWZOf4iOmmIQ0J2qavqjZgg4P+W9IohO2Ah2Ui8MJSdPyXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKRpFaeG4IGIpKkGE23boGUiX9Q/dKhOe0+wX8V8yIuK9xLP+L
	bBWl2e7qT7KYAvNtxtRyrmw47AcI++C4Vpd0xt6IsscV0q0XykKBXlz6OcvH7TVkYsHHKcpfp+l
	R
X-Gm-Gg: ASbGncuSAQ7FAaGW4EpMm47OUnZmRV5aZaoWJnvYcV5BbHPk+/PTwhTGgviITrAnEnG
	DS/Voh6Pb/JfXSmIoSfkJAPuqL4iOMiBO7BMmcOWPhrzQrYEmV4dCZDB1eYAjVbDeDLO895633V
	BmFYBu8a6U9EUTd2c1BfysVLAN238KUp6eFU8apLEV/aaYiK+E09aI4fw5nkphEIGIjo+WC+DxU
	I9KQLhUK0k/Uf/DCLCbceJcu97am1Q7JhRT7dT10Rx409qoVe/5MElP26GWwsjCsS8LBR/l7IPf
	9PtGGqdPpEBVHwmg9tynizjWaihIPKcHoqvo5nybHyg=
X-Google-Smtp-Source: AGHT+IHVG48PQ3PbBxa6Pppm5OOQfY2250cBwz7kifepeP6HNmcBzErFykhRYqq1LVB1ReOFWmHCsg==
X-Received: by 2002:a05:6000:4020:b0:391:2e0f:efec with SMTP id ffacd0b85a97d-3912e0ff334mr1501348f8f.7.1741276740418;
        Thu, 06 Mar 2025 07:59:00 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:29d4:36d9:5043:acd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c103f41sm2391111f8f.85.2025.03.06.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:58:59 -0800 (PST)
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
Subject: Re: [PATCH v3 5/6] ASoC: meson: s4: Add s4 tocodec driver
In-Reply-To: <20250228-audio_drvier-v3-5-dbfd30507e4c@amlogic.com> (jiebing
	chen via's message of "Fri, 28 Feb 2025 16:04:13 +0800")
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
	<20250228-audio_drvier-v3-5-dbfd30507e4c@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 06 Mar 2025 16:58:59 +0100
Message-ID: <1jfrjq5ews.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 28 Feb 2025 at 16:04, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> S4 tocodec support 8 lane to input, It need to enable
> bclk and mclk control bit when work
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..41eef9980059285275f0189a06469fc694775955 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -41,6 +41,9 @@
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>  
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29
> +
>  #define TOACODEC_OUT_CHMAX		2
>  
>  struct g12a_toacodec {
> @@ -129,6 +132,10 @@ static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>  				    CTRL0_ENABLE_SHIFT, 1, 0);
>  
> +static const struct snd_kcontrol_new s4_toacodec_clk_enable =
> +	SOC_DAPM_DOUBLE("Switch", TOACODEC_CTRL0,
> +			CTRL0_BCLK_ENABLE_SHIFT, CTRL0_MCLK_ENABLE_SHIFT, 1, 0);
> +
>  static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>  	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>  			 &g12a_toacodec_mux),
> @@ -143,6 +150,15 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +	SND_SOC_DAPM_SWITCH("CLK EN", SND_SOC_NOPM, 0, 0,
> +			    &s4_toacodec_clk_enable),

I don't see a reason for the user to control that.

A user controls if the component is enable or not, and possibly select
the lane ... but that's it

You could have to flipped automatically which dapm when the component is
powered, that would make a lot more sense.

> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -228,6 +244,15 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "OUT Capture", NULL, "OUT EN" },
>  };
>  
> +static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
> +	{ "SRC", "I2S A", "IN A Playback" },
> +	{ "SRC", "I2S B", "IN B Playback" },
> +	{ "SRC", "I2S C", "IN C Playback" },
> +	{ "OUT EN", "Switch", "SRC" },
> +	{ "CLK EN", "Switch", "OUT EN" },
> +	{ "OUT Capture", NULL, "CLK EN" },
> +};
> +
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>  };
> @@ -236,6 +261,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>  };
>  
> +static const struct snd_kcontrol_new s4_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
> +};
> +
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -258,6 +287,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= s4_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= s4_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(s4_toacodec_routes),
> +	.endianness		= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -278,6 +318,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
>  };
>  
> +static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
> +	.component_drv	= &s4_toacodec_component_drv,
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 20),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +};
> +
>  static const struct of_device_id g12a_toacodec_of_match[] = {
>  	{
>  		.compatible = "amlogic,g12a-toacodec",
> @@ -287,6 +334,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
>  		.compatible = "amlogic,sm1-toacodec",
>  		.data = &sm1_toacodec_match_data,
>  	},
> +	{
> +		.compatible = "amlogic,s4-toacodec",
> +		.data = &s4_toacodec_match_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);

-- 
Jerome

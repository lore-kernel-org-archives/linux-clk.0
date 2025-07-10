Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BE62BE057
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139802; cv=none; b=PjBt8WDxe4vnivt9SBjy8m3YqE8/RZOv/mky6N677zOF/JbQ8N+5DiJHpoCeZZzUuiSxjkoH+My+wYxnItVS/CZqBBzCf0sp19RR0L9ajiI+kDAUqjISmGKYtXr2fuOby8gYIEt9/7xotILfaVcOQmcgg7v7ZfYbqyYKWcisPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139802; c=relaxed/simple;
	bh=RvWx0THnhd8C6rcGaqHmSfjP4lgZODoB638I2q/pN6A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gcsl31Lcp1K29ztz91MGSt+C+9wUJ8gzB3oUZMKX7Ui/4rmRKidA2Gsjuwsh2sOeyq2KxQ8KttlrlkwV/Mdo2pDto/sd3pD9DUdS+ksOVCnwZ5qxRtcN9c6GkYTb6Dejwr3h6xoMHk5swfqba5OM9LSxHwKEaKgzE6HLSZNBpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TCra7FBm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TCra7FBm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4537deebb01so3978125e9.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752139797; x=1752744597; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbeTP4cE9kq271i0CBkzPGTfY9QH/lS2BgWUwRgbv0s=;
        b=TCra7FBmZWwHjp7N7BfVC+eqnb+yFwDPelAru6KrO3TMneAZcXbn+wch7up2lU7yeV
         X5AzvrqiQltXfqxpUxL0uLIVJdif0bH78+2g4KB8QU78IbyoLrHtSTrYYnK1OBfU7B6w
         ax4Ecm2uVHPE/9dH5tw56b34/NA2b93t7Eg6yGzFcgUae+QpAdrcLUkQ1LC/YMeQ0lRE
         dzQSdQWzmJlVcIiRYtFJpXkZhmPm55n2QtPRK5PD7l2Lpj4WTnZbvMP1k+UvFyr5rM13
         8vli35rD6+cV04V0yMs1G3TqJS1MGgHl/5eJZPPCptDCWkTwHyzWZy3U0aICOEQHQrfj
         bolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139797; x=1752744597;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbeTP4cE9kq271i0CBkzPGTfY9QH/lS2BgWUwRgbv0s=;
        b=bvdszDF+Ay/ctUJsBkvwRmg9hEkn5q9YBSRgTjL/LXtInkh1vnp4kdnTqh+lHIwxoB
         Tnvf/56SFZHd6/1FCm3lKbpiO7y+mJjQLOEdYcoGSxr54WyiavkJBMLI7YktYe6qIAxB
         SEm+waQ+3/Z/xwbUTbuSzrxsjoxkfhlQ+4flILQcYDzyHplqWzkbGP5sm1x4motra4wn
         yGRlYFtWEuSqCZ8Ov0hcjzpgQYjPDYubrWiIX+2ZDsIzu7LqvAaezBwZqfmpzdcCSslA
         3zHcAvBAB8SDUs7DgqPTgAH5GKYMy3wu+i0FfMn8S9cnA/8KvWG6J53hLtQAHR+1EcuJ
         Xm7A==
X-Forwarded-Encrypted: i=1; AJvYcCXZFgDPN+bbQ57r2WRlr8gRwxo36G2Qa2srmWwdqN2VE8tzBt+6cBaznUQmigDQ6KQwGHz96oB6msQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8qhKVS1y2svSBKZPk07ZcfZj5olEChGjk2kA8e3/KtWJ+pl7T
	vgc8UT1P1syUG/cDiIWxjXsYH4TEZZ1c68Efjzvva8ZTyDYv/WTg8pWoKopz67in4J4=
X-Gm-Gg: ASbGnctVdw9kFoLpaqL7KsRltxa3rsnWq8BNQPuKgYdLI4yjrh7RjzWRUB4/Lt4Rzwm
	TkJz7gQFLX4LGMGst2xXL99ekl+ykAE4aM6F6zXUZCQ/i/pdYUaru/nA8/HS96OmZUcM27XSjmi
	AduKbwTgf/EyI8baZ/2qX9qETbgvYbZGoyjPGQlyUQjHG1XodJ3GeW+a9li829vCGa6iwCIig5y
	mBFNDl7ZuKaTWe3yomI2LVeRg9qdr1BAnNwvqVUxJGBLfVZeC5wedu1Hs1PYnm0OKgEoXvNzCus
	o7dxrJZMuc64xvOvpMiQTkn5Jsv5q2KJ+DIn/AmQcZreJPaljjOQukGUKjHTaw==
X-Google-Smtp-Source: AGHT+IHX7lTl/HTMcGBrX14bHfh/MeZzub6RiU4ihi3NXd1nTuCUfqXfnAxJUw+FMOS9g116fFGL/g==
X-Received: by 2002:a05:600c:8b02:b0:44a:775d:b5e8 with SMTP id 5b1f17b1804b1-454dd1c8c8dmr16546785e9.1.1752139797358;
        Thu, 10 Jul 2025 02:29:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454d5050d34sm54258595e9.9.2025.07.10.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:29:56 -0700 (PDT)
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
Subject: Re: [PATCH v5 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
In-Reply-To: <20250710-audio_drvier-v5-4-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:40 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
	<20250710-audio_drvier-v5-4-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 11:29:56 +0200
Message-ID: <1jtt3kpf57.fsf@starbuckisacylon.baylibre.com>
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
> The S4 tocodec supports 8-lane input configuration, requiring BCLK
> and MCLK control bits to be enabled during operation.

This is oddly formulated, like there is some form of causality between 8
lane support and the new clock bits of this SoC.

If it is not the case then simply

"""
Add s4 support to the toacodec driver.

The s4 requires additional clock control bits to be turn on  while enabled.
The s4 has 8 TDM lanes, instead of 4 on previous SoC. Update the widget accordingly.

"""

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 42 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..cb2169293f0e800bd9c0893087ffc4813f3360e2 100644
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
> @@ -143,6 +146,19 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +/*
> + * FIXME:
> + * On this soc, tocodec need enable mclk and bclk control
> + * just enable it when dapm power widget power on.

If those are needed only when the widget is enabled, then I think it is
fine and the FIXME is not necessary

If not, more explanation are needed because I don't get what the
limitation is.

> + */
> +
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
> +			    &g12a_toacodec_out_enable),
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -236,6 +252,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
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
> @@ -258,6 +278,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= s4_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= g12a_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
> +	.endianness		= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -278,6 +309,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
> @@ -287,6 +325,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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

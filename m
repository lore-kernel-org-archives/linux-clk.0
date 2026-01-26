Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076C13DDAE
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425472; cv=none; b=DYWnS2D/qAUI9Naqnn+YXkqu1OHa5LIPes8YfTcFp1ZWMLV036EYF0XOyShkxX44IszjeNU2AtukCUqwQVzzsBiUsVm78FHeVL+RwjA26HRzRNv6hHdX+2fHry51+WK7WqC9Zi9Qt5MtvLqknZhrSNINZPFyrXovQgtpviO1rM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425472; c=relaxed/simple;
	bh=8D1VW2AOoRSMssvrVWN1WQiajWGXn55DSzdjY21vhEA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MOd8S2+I+GUMW6k4/0fPCe5rqPxSjIxhuk0/MtSrj2O8Saj14FElvwcFrUrRfswpBNY4ruZI3696mKXKq5WZRO2o6lJFl6J+y6FnHSW5RmlEmdYLwdFMhjqmgBqM13saOzQk4VFg3c3afnFpfKxWa4vZRcq4ATsGzPz9x/B2u6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QMmzAjO9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QMmzAjO9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so4506618f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 03:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769425468; x=1770030268; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxxggqu7lY1Sckmv7ByHvQyZJWGtg/A0ImvB7PnxYRE=;
        b=QMmzAjO9my3U8M8PkCWi0xiFVFtnw+8dCJDOFTMAPT6rYC9n9F28NcwqDkUjjmTdvv
         7VTU3sbvK9aBXKFcFoiaGwnp8iyzFeC3nB3V+7rx7at2WLqx2YeLYUdBp3b1ROlG4m7u
         fIa5e3bHCmRluO1Pw/RfzsPIk39S+tKfajgyJsMr0Kz5vj2tUEVrXFRrcu5M59QgsDLD
         AA+D/4gl/SYyQC0aHBrKWhjzd8cIDdUDzCwyVZ3jIoeuewgK/ud7z4fXiJlIJxlnI3SY
         dj+qHN0EujwuT2yMbUPUjVOA2+2wWk2rNlyftPe/f5pDcQg8siPgmWm9zwFLOG0eYef9
         lQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425468; x=1770030268;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oxxggqu7lY1Sckmv7ByHvQyZJWGtg/A0ImvB7PnxYRE=;
        b=HK1RqarEhLKpC8QnMCyijKc850IpfP1sl7oXY1pnV20WZg3kPbTnvBP3dp6X8Xbs1S
         9ROoILF7HSL3rcKTjMcN+xtSXPb2STkx6JwMFJhNvNvglm8BQgw2tc/SmucBQGnQtO2C
         EKgupmdfDGrbNhkBIG7Yll4jOT4Zm+lxuYe2QsTgGl/qaRDyEHJD05KmJvRG3lGL0juQ
         Dy0H3m7CephMj1IbvYtX6hW0tmdnZvpkTvEaTtrenkGpnmf4EfYvTUo8PHvjOZHXNP/z
         52/iGYWd3IDNdhfV3TimeIGKjpE1XB7/m0C/VrSiQCVf88NpWAfMu2X5CTjthHvQ5NAZ
         2ziA==
X-Forwarded-Encrypted: i=1; AJvYcCUxLfos2y5RjQjaVjxRR46NcuFqX0o62uL2nAkoh6Wspy0ZkLz18s7PZ4Dw5Zl1yCUMQI747WWoRxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Q7YkaMGEtxbSM1LH0Il9oUnQQQDwVxrR7PCCtIvEe9VunaHQ
	44vig+9LOcx4QWN/j583c6aTVCyxLsrues7oM2udjCiNv/N/CruCwOp2CVELWBLSITY=
X-Gm-Gg: AZuq6aJ9e9zzOx6cyoQiwRmMUn32FjLSSHLlN4v2swEJ4ZWzcjePJFU2uCEnXNy/Lqg
	XlBwgFYmbFv2XjNESy8Vuq7DHrrwsjRwvE8oObbVE7uLyeRyBkAac20+7XbErtf7MI4rljpsg/s
	aqhMGcEU+A8JJ8FOVTNp8gW1zogXw3baTfbCZjg58BF5Qt8O/S6kx0W5XpBQeyEa/x3X2DP/v7+
	/am1CwbZlSCJCtNZwuTYRtsGQOcOWDUtJXPtxtoZp7/Fj8p/u01/VB3MSnySfJAigCO85rddTTR
	xdeEsGm+5iUpQ0+YGwWmF0fCqV4hQIvUTg6bT6xBm0CC7HXmb8WgC1+Ix92NELvIF2eyPtQa28O
	6WyypWWjIdKdU91FY6cS8aI3rKLSMHJiWIgegNj28l7dXBI7JX97dnOevE2yMvNYPBZmugaccOd
	o127xJ+xhdRg==
X-Received: by 2002:adf:e60c:0:b0:435:9bf5:b32c with SMTP id ffacd0b85a97d-435ca1ac8f5mr5355432f8f.29.1769425468113;
        Mon, 26 Jan 2026 03:04:28 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d1d:ac62:8521:30a0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-435b1c24a8asm29321914f8f.12.2026.01.26.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:04:27 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
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
Subject: Re: [PATCH v6 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
In-Reply-To: <20260126-audio_drvier-v6-3-99e350855bc2@amlogic.com> (Jiebing
	Chen via's message of "Mon, 26 Jan 2026 06:01:44 +0000")
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
	<20260126-audio_drvier-v6-3-99e350855bc2@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 26 Jan 2026 12:04:26 +0100
Message-ID: <1jikcohbyd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 26 janv. 2026 at 06:01, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: Jiebing Chen <jiebing.chen@amlogic.com>
>
> The S4 requires additional clock control bits to be turn on while enabled.
> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
> Update the widget accordingly.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index a95375b53f0a..a7f9ac2d08f7 100644
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
> @@ -141,6 +144,13 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
> +			    &g12a_toacodec_out_enable),

I guess that works but it is a bit hackish to hijack the output control
to enable a something really clock related. A supply widget connect to
this widget would be more approriate I think

> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -234,6 +244,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
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
> @@ -256,6 +270,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
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
> @@ -276,6 +301,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
> @@ -285,6 +317,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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

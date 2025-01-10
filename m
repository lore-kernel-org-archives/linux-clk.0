Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D920E714
	for <linux-clk@vger.kernel.org>; Fri, 10 Jan 2025 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736517359; cv=none; b=T7GVKoJQZIMrb2bF89GCZS+CuiZ8FErJZFzOu8no/k4rmCjrCnY8huUAwLAaamTx8htQqJWjlm1HJdBLinF6eFbtwpdMzaTKsys3ESJ8507c5RquCisDAsLz3Vo2AcCbeZaX4+LMxq6CqNVTzcwDH453sTbPq+53LxQQjU0HeiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736517359; c=relaxed/simple;
	bh=XKtfrZeHxc9+cyzKm0MPReg0K1uvvd5Lo0kIUMLSBnI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WmzvYm7EuhnpaX2+BQw2IN0fm984hKe1kP5eKGMctTTZFzhZ1etg0QLAlxqIWNJsQlXZqhDk4jpBHib6YuvW9e8qyjTvTQkUcd0SZSqXnAkGwq5BGmBAiZuQQS9hE7+R9KRulpgI7lEgtcoI1/7MdQhkCzeW/1+C7eoelkUk/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=K/jg9uM+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="K/jg9uM+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1122221f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 10 Jan 2025 05:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736517355; x=1737122155; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftbjBXQ4HXQ8pJsgEsmhz+TvwinUzZhPiZFB0jwt4RI=;
        b=K/jg9uM+P6Hm+ztSlnN4FETxyw6S+faBsZc913NTera7r6sYJ+14T6Wmpb8d7u37o8
         Kfl2sNFjhOxRZQQhVqODIbOhMapA2osh12oovYGqFzQ9SmIw1jbGanpjBbJeut7TxFYV
         QtbV9AbXhS6+KMsa65OKN5ApFakilPy9I35RkeH+NHzJwG/Bj+H0kqMDNs5T3dVPpysp
         bAtMNKnupyhY3RJqUbRgoyPB75OJylVAGInwQ8aDeXyShXWiyc9LCL+3KljBb3Tz8zC+
         e8YdrGMX50QXlKDnzIBPQHlFwiukLlfwxpbSaVnci215nZrdJlqrywcxaKNYkI9uYX6J
         dvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736517355; x=1737122155;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftbjBXQ4HXQ8pJsgEsmhz+TvwinUzZhPiZFB0jwt4RI=;
        b=RO09QOhLbMwKem1utGrWvz4jkY8q90sQIrCRHU9IsEoNW36HdWcMKOAxCRTrjV4yU8
         bTv9ytUkgJxa4iwkgFbnfTxZ7vE3B9hTC9926bK9VVlDygd482Khq62zzf+KIIMmzGNR
         Hvr1lrAj/nS83aHtwt9exNUVGDn0N5htnGF4cKsQl2nE5WbL9MpEltnefW4EUB+XLsM3
         7s80fw88t9cE6XYFbN0SHnHjfQIU2rOFo96IuOdICXH134I3bi/0b5Rhx5q0nJTSqvCz
         VbY5me40Xs0PfmaBdNrnputvmIIDX4AFxEwEXjPtNYj60AmjIl9sWNR2l88jBkY+QBai
         RFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCULKyxjtNnief3iZifDNlUl8PUwGlO1PqF3nbo0/WzfGPOPJYzaTlaX488TGfML+gZk3ioDaEDWuoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp29JaYFa1pHN4WynFMru5pIHPH17r71TCpVnao353+3gSkXQT
	CUZxbdpicQ7B3CkLajKgZv3kJtGbG8d5DsQSy+PqiEPsm9EjocuK/0+dIROrxus=
X-Gm-Gg: ASbGnctTy373aLeTobdh+FwKUAUJqCADcmK4xd3f54oAJCGI/l3K7mvvjLgezoSzICD
	nTJ5xWaIdTWJCo6sSOA+x7A7YlfX/laXW39rztNRYWISytoTsXSyHm3AvvGdDTJczEmSATw8wUH
	2fNijcyH1l4UtuVcsvjiNOuUrfaulCYtoBZIpFh19TrKXjIDgIDzEB67zNqDtDjG5ct4o7Az1ki
	IcUM+O07bddncQxNFfSqoZRf8+WdRvu0rIfLg+ad0TbXu3HW2SBgO0=
X-Google-Smtp-Source: AGHT+IE7F/hOS3FiocAfogciKCV+3xyyaiDnwQ7vSAvCcesLhCG99vmIp4Cuk/PUHH6FVgF+FANyPg==
X-Received: by 2002:a05:6000:401e:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38a872da868mr10354026f8f.16.1736517355167;
        Fri, 10 Jan 2025 05:55:55 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f3f7:a818:65b5:3db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80besm4527997f8f.83.2025.01.10.05.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 05:55:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: amlogic: c3: Limit the rate boundaries of clk_hw
In-Reply-To: <20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
	(Chuan Liu via's message of "Fri, 10 Jan 2025 19:47:11 +0800")
References: <20250110-limit-rate-range-of-clk-v1-0-dd618adc4aa8@amlogic.com>
	<20250110-limit-rate-range-of-clk-v1-2-dd618adc4aa8@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 14:55:54 +0100
Message-ID: <1j34hqai39.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 10 Jan 2025 at 19:47, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The PLL can only stably lock within a limited frequency range.
>
> Due to timing constraints, the maximum frequency of the peripheral clock
> cannot exceed the design specifications.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/c3-peripherals.c | 21 +++++++++++++++++++++
>  drivers/clk/meson/c3-pll.c         |  4 ++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index 7dcbf4ebee07..9f0a3990f0d6 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -568,6 +568,7 @@ static const struct clk_parent_data pwm_parent_data[] = {
>  		.ops = &clk_regmap_gate_ops,			\
>  		.parent_names = (const char *[]) { #_name "_div" },\
>  		.num_parents = 1,				\
> +		.max_rate = 200000000,				\
>  		.flags = CLK_SET_RATE_PARENT,			\
>  	},							\
>  }
> @@ -724,6 +725,7 @@ static struct clk_regmap spicc_a = {
>  			&spicc_a_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 500000000,

I'm sorry but the whole thing is completly wrong.

All the clocks I'm seeing here are gates. This type of HW hardly cares
what rates it handles. Same goes from mux, dividers, etc ...

All you are doing here is trying enforce some made up "safety" / use-case
defined limits that do not belong in the clock controller.

The only piece of HW where limits could possibly make sense are PLL DCO,
and even there, you've got multiplier range which is way better as an
abstraction.

So it's a nack on the series.

If devices are have particular requirement on rate range, have the
related driver set it.


>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -771,6 +773,7 @@ static struct clk_regmap spicc_b = {
>  			&spicc_b_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 500000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -829,6 +832,7 @@ static struct clk_regmap spifc = {
>  			&spifc_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 167000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -887,6 +891,7 @@ static struct clk_regmap sd_emmc_a = {
>  			&sd_emmc_a_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 250000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -934,6 +939,7 @@ static struct clk_regmap sd_emmc_b = {
>  			&sd_emmc_b_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 250000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -981,6 +987,7 @@ static struct clk_regmap sd_emmc_c = {
>  			&sd_emmc_c_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 1200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1074,6 +1081,7 @@ static struct clk_regmap eth_rmii = {
>  			&eth_rmii_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 50000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1132,6 +1140,7 @@ static struct clk_regmap mipi_dsi_meas = {
>  			&mipi_dsi_meas_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1190,6 +1199,7 @@ static struct clk_regmap dsi_phy = {
>  			&dsi_phy_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 1500000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1248,6 +1258,7 @@ static struct clk_regmap vout_mclk = {
>  			&vout_mclk_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 334000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1306,6 +1317,7 @@ static struct clk_regmap vout_enc = {
>  			&vout_enc_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1431,6 +1443,7 @@ static struct clk_regmap hcodec = {
>  		.ops = &clk_regmap_mux_ops,
>  		.parent_data = hcodec_parent_data,
>  		.num_parents = ARRAY_SIZE(hcodec_parent_data),
> +		.max_rate = 667000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1489,6 +1502,7 @@ static struct clk_regmap vc9000e_aclk = {
>  			&vc9000e_aclk_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 667000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1536,6 +1550,7 @@ static struct clk_regmap vc9000e_core = {
>  			&vc9000e_core_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 400000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1594,6 +1609,7 @@ static struct clk_regmap csi_phy0 = {
>  			&csi_phy0_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 200000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1652,6 +1668,7 @@ static struct clk_regmap dewarpa = {
>  			&dewarpa_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 800000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1710,6 +1727,7 @@ static struct clk_regmap isp0 = {
>  			&isp0_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 400000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1768,6 +1786,7 @@ static struct clk_regmap nna_core = {
>  			&nna_core_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 800000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1826,6 +1845,7 @@ static struct clk_regmap ge2d = {
>  			&ge2d_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 667000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> @@ -1884,6 +1904,7 @@ static struct clk_regmap vapb = {
>  			&vapb_div.hw
>  		},
>  		.num_parents = 1,
> +		.max_rate = 400000000,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
>  };
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index 35fda31a19e2..d80d6ee2409d 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -286,6 +286,8 @@ static struct clk_regmap gp0_pll_dco = {
>  			.fw_name = "top",
>  		},
>  		.num_parents = 1,
> +		.min_rate = 3000000000,
> +		.max_rate = 6000000000,
>  	},
>  };
>  
> @@ -370,6 +372,8 @@ static struct clk_regmap hifi_pll_dco = {
>  			.fw_name = "top",
>  		},
>  		.num_parents = 1,
> +		.min_rate = 3000000000,
> +		.max_rate = 6000000000,
>  	},
>  };

-- 
Jerome

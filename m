Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350CA37BE90
	for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382766; cv=none; b=plgWvWV7IzY/48noLpPMIMg9m2mHcgv0Q1dbmrxwwdw2i3l8JtSdkRzarmNRHsPQLSM8c5JEWAy1AUfa8bpKzVR/5ZwxQqsIvE46X8nnk4I8iLd5ssOyG3aUGHkQDGITRJMpYRB93z/DVi2EL/EdES6xG7XC8SLAzKLJ7vSxInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382766; c=relaxed/simple;
	bh=mfSjzPtewToyWGbZklE40lv8Ydr4yGvAwCINFR8WIQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V3MR16xF84SzTRbxPP7FLZxGsbPvaFLEKq5F0nyQcMP/1ZHrFd4UMU0HHSw8GL6ZfnGmXHv7fjnPQve8Zem4BNwKlKj2BM37EiNbk8ysmpC2vLD5qHB9FaStucNUmUCqoThLOEqgYWyi7ZOqCaj9gKdw7rIOgudSKGsYvYhc3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PdCER1c4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PdCER1c4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee0291921so9338795e9.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jan 2026 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768382761; x=1768987561; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9weBqObxH8DPoWd4EEXh1inSDulmXc6nULjQD6fasTg=;
        b=PdCER1c4Y11vkSlmOGcrUVZwqxKKd8FZFwduCRWZKokZ3JFxFSCMInqBf9Y2UyIdfA
         mr7MFWb4byWb6jGjHdH/qR5faPHdQ0aVg5zIjsiRVEdBdtVat6TZrCdQ7/ag5evcccVN
         SwCHzzfszIqj3mMhja+uJdAblXqbxkBTsVMRFqmO/hiPVYZVsamdyC3un/2i1kmwSiW+
         WUThgSw/CFnwB9q0mJLyrC5tY9MSiSIvkXA3ybS/yKS3QwvuL7IyCuHegLjlGpsvLbdb
         O337Q+zUSr3InnU3asFpDyZXkIDrr7txqih+DiDAjYgNpXbNnuOZtHj/GHKZ8HguAuHJ
         Z0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382761; x=1768987561;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9weBqObxH8DPoWd4EEXh1inSDulmXc6nULjQD6fasTg=;
        b=SAzus+o2rJlCZH5DF/BkUKFIxRiwK5j04mde/nPcpePMk8tSAPAORaYWE/GfUzQHYc
         FsVOhxFfvm2HgLNTFhQE46ij/kNQKT1FL8zmZg0UEIwxrrkLA6lWtUm9IlgVYhLkiXmC
         bzF2wTRrb3TalBYlRePnxZmBiczHY58+zN8ixU12QcO35x+B+/KSWlqZs240kNRamR5v
         4hTCZjmrDoqXyQfv/SkAkeP0YRuCCTcXTmehGtfmAZzGR88Os2YCU+FJAdYPK8erERHf
         BdRSozdfnm2WSFtHgs8HmDxjetLItCZagf93qjIS8BiTscVbVoK8GCMy8xnbzcCeNHpn
         Z+3g==
X-Forwarded-Encrypted: i=1; AJvYcCVbDOMZ5jy0k18JDY3aXLJKzO3v1+ImM/59S2EbmrhDZK7nFSCmPeeUfj6/AbyAogf5M0VJVqmLVic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNRLALNlvE4ACDsCD9JuNuhi3gv2MSNp1ezU6x/uT7J5rYcJg
	PZvN9T7DdFsaOCiRcHkhtSQJnW7UPX/NnvRga+Qta52mIvx2SctgHYfjpqpW0dYZ8K4=
X-Gm-Gg: AY/fxX7aP0OAzXNhn7lrY1MugkmsmoIiMglmo7c+d8cQf3306RAfrJvwt9HrGcfjcM8
	lJlYJ3BRfFc3tdlp3p3pgk4QfuOJdyZkVSSJywVPyiBujKS3y0QkXOG5XPE5/WvzJZCY04DrDhU
	LhfSmhzApvVR6mg0MziGUUuM8tJBl8dFMwqSdQme18KtZUJm8N1nkN0PgsxEwAh1gio6ha12auy
	E1NnJSkO8ipLxsDUWW8nmQkjSYb+DXP0hwxpusaYHUoB39UG1D0QtRUwmfTo+Jc5N4chh1Iheni
	jhP7Wv7BIOCDsdO8ypdEAbhU1QiK36xgsP+dqmoyi1C0w1oJbRW0U4wHu3GNPdPYBNOJkxgTqvj
	PvVIi9W9pUq/hzElu/cd+dO5d8pBByx8T0P0DYlKrdWy30behQyNYjZRaWFYrO1+YnoHZuiD14g
	Ixf8XSjVwe8OPfygSFigM9
X-Received: by 2002:a05:600c:3555:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-47ee33a1b80mr22290985e9.27.1768382761437;
        Wed, 14 Jan 2026 01:26:01 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee573e2eesm18698295e9.15.2026.01.14.01.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:26:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Chuan Liu <chuan.liu@amlogic.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/8] clk: amlogic: Add A5 clock peripherals
 controller driver
In-Reply-To: <20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com> (Chuan Liu via's
	message of "Thu, 08 Jan 2026 14:08:19 +0800")
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
	<20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 14 Jan 2026 10:25:59 +0100
Message-ID: <1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 08 janv. 2026 at 14:08, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> +static struct clk_regmap a5_rtc_clk = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = RTC_CTRL,
> +		.mask = 0x3,
> +		.shift = 0,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "rtc_clk",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_data = a5_rtc_clk_parents,
> +		.num_parents = ARRAY_SIZE(a5_rtc_clk_parents),
> +		.flags = CLK_SET_RATE_NO_REPARENT,
> +	},
> +};
> +
> +#define A5_PCLK(_name, _reg, _bit, _pdata, _flags)			\
> +struct clk_regmap a5_##_name = {					\
> +	.data = &(struct clk_regmap_gate_data) {			\
> +		.offset = (_reg),					\
> +		.bit_idx = (_bit),					\
> +	},								\
> +	.hw.init = &(struct clk_init_data) {				\
> +		.name = #_name,						\
> +		.ops = &clk_regmap_gate_ops,				\
> +		.parent_data = (_pdata),				\
> +		.num_parents = 1,					\
> +		.flags = (_flags),					\
> +	},								\
> +}

I wonder why I bothered reviewing v4 ... 

> +
> +static const struct clk_parent_data a5_sys_pclk_parents = { .fw_name = "sysclk" };
> +
> +#define A5_SYS_PCLK(_name, _reg, _bit, _flags) \
> +	A5_PCLK(_name, _reg, _bit, &a5_sys_pclk_parents, _flags)
> +
> +static A5_SYS_PCLK(sys_reset_ctrl,	SYS_CLK_EN0_REG0, 1, 0);
> +static A5_SYS_PCLK(sys_pwr_ctrl,	SYS_CLK_EN0_REG0, 3, 0);
> +static A5_SYS_PCLK(sys_pad_ctrl,	SYS_CLK_EN0_REG0, 4, 0);
> +static A5_SYS_PCLK(sys_ctrl,		SYS_CLK_EN0_REG0, 5, 0);
> +static A5_SYS_PCLK(sys_ts_pll,		SYS_CLK_EN0_REG0, 6, 0);
> +
>

[...]

> +
> +static struct clk_regmap a5_gen = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = GEN_CLK_CTRL,
> +		.bit_idx = 11,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gen",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_gen_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
> +	MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
> +
> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A5_COMP_GATE(_name, _reg, _bit, _iflags) \
> +	MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
> +

At the top. like C3 and T7

> +static const struct clk_parent_data a5_saradc_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "sysclk" }
> +};
> +
> +static A5_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x3, a5_saradc_parents, NULL);
> +static A5_COMP_DIV(saradc, SAR_CLK_CTRL0, 0, 8);
> +static A5_COMP_GATE(saradc, SAR_CLK_CTRL0, 8, 0);
> +
> +static const struct clk_parent_data a5_pwm_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .hw = &a5_rtc_clk.hw },
> +	{ .fw_name = "fdiv4" },
> +	{ .fw_name = "fdiv3" }
> +};
> +
> +static A5_COMP_SEL(pwm_a, PWM_CLK_AB_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_a, PWM_CLK_AB_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_a, PWM_CLK_AB_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_b, PWM_CLK_AB_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_b, PWM_CLK_AB_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_b, PWM_CLK_AB_CTRL, 24, 0);
> +
> +static A5_COMP_SEL(pwm_c, PWM_CLK_CD_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_c, PWM_CLK_CD_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_c, PWM_CLK_CD_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_d, PWM_CLK_CD_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_d, PWM_CLK_CD_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_d, PWM_CLK_CD_CTRL, 24, 0);
> +
> +static A5_COMP_SEL(pwm_e, PWM_CLK_EF_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_e, PWM_CLK_EF_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_e, PWM_CLK_EF_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_f, PWM_CLK_EF_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_f, PWM_CLK_EF_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_f, PWM_CLK_EF_CTRL, 24, 0);
> +
> +static A5_COMP_SEL(pwm_g, PWM_CLK_GH_CTRL, 9, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_g, PWM_CLK_GH_CTRL, 0, 8);
> +static A5_COMP_GATE(pwm_g, PWM_CLK_GH_CTRL, 8, 0);
> +
> +static A5_COMP_SEL(pwm_h, PWM_CLK_GH_CTRL, 25, 0x3, a5_pwm_parents, NULL);
> +static A5_COMP_DIV(pwm_h, PWM_CLK_GH_CTRL, 16, 8);
> +static A5_COMP_GATE(pwm_h, PWM_CLK_GH_CTRL, 24, 0);
> +
> +/*
> + * NOTE: Channel 7 is gp1, because gp1 is designed for DSU, so spicc does not
> + * support this source in the driver.
> + */
> +static const struct clk_parent_data a5_spicc_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "sysclk" },
> +	{ .fw_name = "fdiv4" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "fdiv2" },
> +	{ .fw_name = "fdiv5" },
> +	{ .fw_name = "fdiv7" }
> +};
> +
> +static A5_COMP_SEL(spicc_0, SPICC_CLK_CTRL, 7, 0x7, a5_spicc_parents, NULL);
> +static A5_COMP_DIV(spicc_0, SPICC_CLK_CTRL, 0, 6);
> +static A5_COMP_GATE(spicc_0, SPICC_CLK_CTRL, 6, 0);
> +
> +static A5_COMP_SEL(spicc_1, SPICC_CLK_CTRL, 23, 0x7, a5_spicc_parents, NULL);
> +static A5_COMP_DIV(spicc_1, SPICC_CLK_CTRL, 16, 6);
> +static A5_COMP_GATE(spicc_1, SPICC_CLK_CTRL, 22, 0);
> +
> +static const struct clk_parent_data a5_sd_emmc_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "fdiv2" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "hifi" },
> +	{ .fw_name = "fdiv2p5" },
> +	{ .fw_name = "mpll2" },
> +	{ .fw_name = "mpll3" },
> +	{ .fw_name = "gp0" }
> +};
> +
> +static A5_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL, 9, 0x7, a5_sd_emmc_parents,
> +		   NULL);
> +static A5_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL, 0, 7);
> +static A5_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL, 7, 0);
> +
> +static A5_COMP_SEL(sd_emmc_c, NAND_CLK_CTRL, 9, 0x7, a5_sd_emmc_parents,
> +		   NULL);
> +static A5_COMP_DIV(sd_emmc_c, NAND_CLK_CTRL, 0, 7);
> +static A5_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
> +
> +static struct clk_regmap a5_ts_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = TS_CLK_CTRL,
> +		.shift = 0,
> +		.width = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ts_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "oscin",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_ts = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = TS_CLK_CTRL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ts",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_ts_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor a5_eth_125m_div = {
> +	.mult = 1,
> +	.div = 8,
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_125m_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "fdiv2",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_eth_125m = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = ETH_CLK_CTRL,
> +		.bit_idx = 7,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_125m",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_eth_125m_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_eth_rmii_div = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = ETH_CLK_CTRL,
> +		.shift = 0,
> +		.width = 7,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_rmii_div",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "fdiv2",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a5_eth_rmii = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = ETH_CLK_CTRL,
> +		.bit_idx = 8,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "eth_rmii",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_eth_rmii_div.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/* Channel 6 is gp1 dedicated to the DSU. */
> +static u32 a5_dspa_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7};
> +
> +static const struct clk_parent_data a5_dspa_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "fdiv2p5" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "rtc" },  /* rtc_pll */
> +	{ .fw_name = "hifi" },
> +	{ .fw_name = "fdiv4" },
> +	{ .hw = &a5_rtc_clk.hw }
> +};
> +
> +static A5_COMP_SEL(dspa_0, DSPA_CLK_CTRL0, 10, 0x7, a5_dspa_parents,
> +		   a5_dspa_parents_val_table);
> +static A5_COMP_DIV(dspa_0, DSPA_CLK_CTRL0, 0, 10);
> +static A5_COMP_GATE(dspa_0, DSPA_CLK_CTRL0, 13, 0);
> +
> +static A5_COMP_SEL(dspa_1, DSPA_CLK_CTRL0, 26, 0x7, a5_dspa_parents,
> +		   a5_dspa_parents_val_table);
> +static A5_COMP_DIV(dspa_1, DSPA_CLK_CTRL0, 16, 10);
> +static A5_COMP_GATE(dspa_1, DSPA_CLK_CTRL0, 29, 0);
> +
> +static struct clk_regmap a5_dspa = {
> +	.data = &(struct clk_regmap_mux_data){
> +		.offset = DSPA_CLK_CTRL0,
> +		.mask = 0x1,
> +		.shift = 15,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "dspa",
> +		.ops = &clk_regmap_mux_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a5_dspa_0.hw,
> +			&a5_dspa_1.hw
> +		},
> +		.num_parents = 2,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/* Channel 6 is gp1 dedicated to the DSU. */
> +static u32 a5_nna_parents_val_table[] = { 0, 1, 2, 3, 4, 5, 7};
> +
> +static const struct clk_parent_data a5_nna_parents[] = {
> +	{ .fw_name = "oscin" },
> +	{ .fw_name = "fdiv2p5" },
> +	{ .fw_name = "fdiv4" },
> +	{ .fw_name = "fdiv3" },
> +	{ .fw_name = "fdiv5" },
> +	{ .fw_name = "fdiv2" },
> +	{ .fw_name = "hifi" }
> +};
> +
> +static A5_COMP_SEL(nna_core, NNA_CLK_CNTL, 9, 0x7, a5_nna_parents,
> +		   a5_nna_parents_val_table);
> +static A5_COMP_DIV(nna_core, NNA_CLK_CNTL, 0, 7);
> +static A5_COMP_GATE(nna_core, NNA_CLK_CNTL, 8, 0);
> +
> +static A5_COMP_SEL(nna_axi, NNA_CLK_CNTL, 25, 0x7, a5_nna_parents,
> +		   a5_nna_parents_val_table);
> +static A5_COMP_DIV(nna_axi, NNA_CLK_CNTL, 16, 7);
> +static A5_COMP_GATE(nna_axi, NNA_CLK_CNTL, 24, 0);
> +
> +static struct clk_hw *a5_peripherals_hw_clks[] = {
> +	[CLKID_RTC_DUALDIV_CLKIN]	= &a5_rtc_dualdiv_clkin.hw,
> +	[CLKID_RTC_DUALDIV]		= &a5_rtc_dualdiv.hw,
> +	[CLKID_RTC_DUALDIV_SEL]		= &a5_rtc_dualdiv_sel.hw,
> +	[CLKID_RTC_DUALDIV_CLKOUT]	= &a5_rtc_dualdiv_clkout.hw,
> +	[CLKID_RTC_CLK]			= &a5_rtc_clk.hw,
> +	[CLKID_SYS_RESET_CTRL]		= &a5_sys_reset_ctrl.hw,
> +	[CLKID_SYS_PWR_CTRL]		= &a5_sys_pwr_ctrl.hw,
> +	[CLKID_SYS_PAD_CTRL]		= &a5_sys_pad_ctrl.hw,
> +	[CLKID_SYS_CTRL]		= &a5_sys_ctrl.hw,
> +	[CLKID_SYS_TS_PLL]		= &a5_sys_ts_pll.hw,
> +	[CLKID_SYS_DEV_ARB]		= &a5_sys_dev_arb.hw,
> +	[CLKID_SYS_MAILBOX]		= &a5_sys_mailbox.hw,
> +	[CLKID_SYS_JTAG_CTRL]		= &a5_sys_jtag_ctrl.hw,
> +	[CLKID_SYS_IR_CTRL]		= &a5_sys_ir_ctrl.hw,
> +	[CLKID_SYS_MSR_CLK]		= &a5_sys_msr_clk.hw,
> +	[CLKID_SYS_ROM]			= &a5_sys_rom.hw,
> +	[CLKID_SYS_CPU_ARB]		= &a5_sys_cpu_apb.hw,
> +	[CLKID_SYS_RSA]			= &a5_sys_rsa.hw,
> +	[CLKID_SYS_SARADC]		= &a5_sys_saradc.hw,
> +	[CLKID_SYS_STARTUP]		= &a5_sys_startup.hw,
> +	[CLKID_SYS_SECURE]		= &a5_sys_secure.hw,
> +	[CLKID_SYS_SPIFC]		= &a5_sys_spifc.hw,
> +	[CLKID_SYS_DSPA]		= &a5_sys_dspa.hw,
> +	[CLKID_SYS_NNA]			= &a5_sys_nna.hw,
> +	[CLKID_SYS_ETH_MAC]		= &a5_sys_eth_mac.hw,
> +	[CLKID_SYS_RAMA]		= &a5_sys_rama.hw,
> +	[CLKID_SYS_RAMB]		= &a5_sys_ramb.hw,
> +	[CLKID_SYS_AUDIO_TOP]		= &a5_sys_audio_top.hw,
> +	[CLKID_SYS_AUDIO_VAD]		= &a5_sys_audio_vad.hw,
> +	[CLKID_SYS_USB]			= &a5_sys_usb.hw,
> +	[CLKID_SYS_SD_EMMC_A]		= &a5_sys_sd_emmc_a.hw,
> +	[CLKID_SYS_SD_EMMC_C]		= &a5_sys_sd_emmc_c.hw,
> +	[CLKID_SYS_PWM_AB]		= &a5_sys_pwm_ab.hw,
> +	[CLKID_SYS_PWM_CD]		= &a5_sys_pwm_cd.hw,
> +	[CLKID_SYS_PWM_EF]		= &a5_sys_pwm_ef.hw,
> +	[CLKID_SYS_PWM_GH]		= &a5_sys_pwm_gh.hw,
> +	[CLKID_SYS_SPICC_1]		= &a5_sys_spicc_1.hw,
> +	[CLKID_SYS_SPICC_0]		= &a5_sys_spicc_0.hw,
> +	[CLKID_SYS_UART_A]		= &a5_sys_uart_a.hw,
> +	[CLKID_SYS_UART_B]		= &a5_sys_uart_b.hw,
> +	[CLKID_SYS_UART_C]		= &a5_sys_uart_c.hw,
> +	[CLKID_SYS_UART_D]		= &a5_sys_uart_d.hw,
> +	[CLKID_SYS_UART_E]		= &a5_sys_uart_e.hw,
> +	[CLKID_SYS_I2C_M_A]		= &a5_sys_i2c_m_a.hw,
> +	[CLKID_SYS_I2C_M_B]		= &a5_sys_i2c_m_b.hw,
> +	[CLKID_SYS_I2C_M_C]		= &a5_sys_i2c_m_c.hw,
> +	[CLKID_SYS_I2C_M_D]		= &a5_sys_i2c_m_d.hw,
> +	[CLKID_SYS_RTC]			= &a5_sys_rtc.hw,
> +	[CLKID_AXI_AUDIO_VAD]		= &a5_axi_audio_vad.hw,
> +	[CLKID_AXI_AUDIO_TOP]		= &a5_axi_audio_top.hw,
> +	[CLKID_AXI_RAMB]		= &a5_axi_ramb.hw,
> +	[CLKID_AXI_RAMA]		= &a5_axi_rama.hw,
> +	[CLKID_AXI_NNA]			= &a5_axi_nna.hw,
> +	[CLKID_AXI_DEV1_DMC]		= &a5_axi_dev1_dmc.hw,
> +	[CLKID_AXI_DEV0_DMC]		= &a5_axi_dev0_dmc.hw,
> +	[CLKID_AXI_DSP_DMC]		= &a5_axi_dsp_dmc.hw,
> +	[CLKID_12_24M_IN]		= &a5_clk_12_24m_in.hw,
> +	[CLKID_12M_24M]			= &a5_clk_12_24m.hw,
> +	[CLKID_FCLK_25M_DIV]		= &a5_fclk_25m_div.hw,
> +	[CLKID_FCLK_25M]		= &a5_fclk_25m.hw,
> +	[CLKID_GEN_SEL]			= &a5_gen_sel.hw,
> +	[CLKID_GEN_DIV]			= &a5_gen_div.hw,
> +	[CLKID_GEN]			= &a5_gen.hw,
> +	[CLKID_SARADC_SEL]		= &a5_saradc_sel.hw,
> +	[CLKID_SARADC_DIV]		= &a5_saradc_div.hw,
> +	[CLKID_SARADC]			= &a5_saradc.hw,
> +	[CLKID_PWM_A_SEL]		= &a5_pwm_a_sel.hw,
> +	[CLKID_PWM_A_DIV]		= &a5_pwm_a_div.hw,
> +	[CLKID_PWM_A]			= &a5_pwm_a.hw,
> +	[CLKID_PWM_B_SEL]		= &a5_pwm_b_sel.hw,
> +	[CLKID_PWM_B_DIV]		= &a5_pwm_b_div.hw,
> +	[CLKID_PWM_B]			= &a5_pwm_b.hw,
> +	[CLKID_PWM_C_SEL]		= &a5_pwm_c_sel.hw,
> +	[CLKID_PWM_C_DIV]		= &a5_pwm_c_div.hw,
> +	[CLKID_PWM_C]			= &a5_pwm_c.hw,
> +	[CLKID_PWM_D_SEL]		= &a5_pwm_d_sel.hw,
> +	[CLKID_PWM_D_DIV]		= &a5_pwm_d_div.hw,
> +	[CLKID_PWM_D]			= &a5_pwm_d.hw,
> +	[CLKID_PWM_E_SEL]		= &a5_pwm_e_sel.hw,
> +	[CLKID_PWM_E_DIV]		= &a5_pwm_e_div.hw,
> +	[CLKID_PWM_E]			= &a5_pwm_e.hw,
> +	[CLKID_PWM_F_SEL]		= &a5_pwm_f_sel.hw,
> +	[CLKID_PWM_F_DIV]		= &a5_pwm_f_div.hw,
> +	[CLKID_PWM_F]			= &a5_pwm_f.hw,
> +	[CLKID_PWM_G_SEL]		= &a5_pwm_g_sel.hw,
> +	[CLKID_PWM_G_DIV]		= &a5_pwm_g_div.hw,
> +	[CLKID_PWM_G]			= &a5_pwm_g.hw,
> +	[CLKID_PWM_H_SEL]		= &a5_pwm_h_sel.hw,
> +	[CLKID_PWM_H_DIV]		= &a5_pwm_h_div.hw,
> +	[CLKID_PWM_H]			= &a5_pwm_h.hw,
> +	[CLKID_SPICC_0_SEL]		= &a5_spicc_0_sel.hw,
> +	[CLKID_SPICC_0_DIV]		= &a5_spicc_0_div.hw,
> +	[CLKID_SPICC_0]			= &a5_spicc_0.hw,
> +	[CLKID_SPICC_1_SEL]		= &a5_spicc_1_sel.hw,
> +	[CLKID_SPICC_1_DIV]		= &a5_spicc_1_div.hw,
> +	[CLKID_SPICC_1]			= &a5_spicc_1.hw,
> +	[CLKID_SD_EMMC_A_SEL]		= &a5_sd_emmc_a_sel.hw,
> +	[CLKID_SD_EMMC_A_DIV]		= &a5_sd_emmc_a_div.hw,
> +	[CLKID_SD_EMMC_A]		= &a5_sd_emmc_a.hw,
> +	[CLKID_SD_EMMC_C_SEL]		= &a5_sd_emmc_c_sel.hw,
> +	[CLKID_SD_EMMC_C_DIV]		= &a5_sd_emmc_c_div.hw,
> +	[CLKID_SD_EMMC_C]		= &a5_sd_emmc_c.hw,
> +	[CLKID_TS_DIV]			= &a5_ts_div.hw,
> +	[CLKID_TS]			= &a5_ts.hw,
> +	[CLKID_ETH_125M_DIV]		= &a5_eth_125m_div.hw,
> +	[CLKID_ETH_125M]		= &a5_eth_125m.hw,
> +	[CLKID_ETH_RMII_DIV]		= &a5_eth_rmii_div.hw,
> +	[CLKID_ETH_RMII]		= &a5_eth_rmii.hw,
> +	[CLKID_DSPA_0_SEL]		= &a5_dspa_0_sel.hw,
> +	[CLKID_DSPA_0_DIV]		= &a5_dspa_0_div.hw,
> +	[CLKID_DSPA_0]			= &a5_dspa_0.hw,
> +	[CLKID_DSPA_1_SEL]		= &a5_dspa_1_sel.hw,
> +	[CLKID_DSPA_1_DIV]		= &a5_dspa_1_div.hw,
> +	[CLKID_DSPA_1]			= &a5_dspa_1.hw,
> +	[CLKID_DSPA]			= &a5_dspa.hw,
> +	[CLKID_NNA_CORE_SEL]		= &a5_nna_core_sel.hw,
> +	[CLKID_NNA_CORE_DIV]		= &a5_nna_core_div.hw,
> +	[CLKID_NNA_CORE]		= &a5_nna_core.hw,
> +	[CLKID_NNA_AXI_SEL]		= &a5_nna_axi_sel.hw,
> +	[CLKID_NNA_AXI_DIV]		= &a5_nna_axi_div.hw,
> +	[CLKID_NNA_AXI]			= &a5_nna_axi.hw,
> +};
> +
> +static const struct meson_clkc_data a5_peripherals_clkc_data = {
> +	.hw_clks = {
> +		.hws = a5_peripherals_hw_clks,
> +		.num = ARRAY_SIZE(a5_peripherals_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id a5_peripherals_clkc_match_table[] = {
> +	{
> +		.compatible = "amlogic,a5-peripherals-clkc",
> +		.data = &a5_peripherals_clkc_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, a5_peripherals_clkc_match_table);
> +
> +static struct platform_driver a5_peripherals_clkc_driver = {
> +	.probe = meson_clkc_mmio_probe,
> +	.driver = {
> +		.name = "a5-peripherals-clkc",
> +		.of_match_table = a5_peripherals_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a5_peripherals_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A5 Peripherals Clock Controller driver");
> +MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");

-- 
Jerome

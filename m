Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA0C30C36D
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 18:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437955; cv=none; b=lqC+7TRY2Dj40azxSrHcjovysuQ1RtEcN83UouDZYlZj3cij8wo0ZNudtWAGejmIdXc22Zd/CD2FuPJX7cJky1LI6JNxnqzD2mAWHWanQruvq9dJ+NL1h5fWjeSQ+Q7vdISTzgveLl+MxHCyJQBIaE16Do2e0pIL/ElqhzYrQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437955; c=relaxed/simple;
	bh=vVN3eI0cG3eJzDGQMowePioEB5QD5fgAY4jEmwKs8Cs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GGBteqqJhWFfWP8QycG1LA2elZ2moT/ptDqySumbEt1cdU/Dk+/8bk4PyXIMTHbwgfaZ43fgfzR3Fo3XZ/do1aPBt4kkBKr502lOCfPKF17YNPZwgSiQNX7/rCoYibITXK57KYNUaVReeemvybh5A2JDN9fIQPq3OMbTZrBof/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IzbDdriN; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IzbDdriN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso1107785e9.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771437952; x=1772042752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXX5Ad6lE4eM3SpWZXXZtn5YXTRNU+kz7ZHFBHa7LgY=;
        b=IzbDdriNK3y5TBY4beWPuSk0MIgZqCk6dysdFWOE+r40Ukguxq1K+/CrvSXFI5VvYM
         Uepf8L0Ez0sh9HwtlUpBKvva+/Uu6Qz2lLj5qBN5SGIyVqv5wyQ+vvy3toGqZqc28Xl2
         Iwx104xOIgkxKJkhQYR6j9BvpRPt+kFqSMfaiXtg9/ehRDy2RLnSwav9bQFN5cqTnDIy
         O0jwSl5rvgi1AF7jeANSUXNebpjwGtClq6S9bsMjY+Nc8kvaOh4cuto+azGCBwM1CTIh
         56apnuR4V96p2+tSWPg8gK/+GJzkZNlsGs/xGPVK0G9cpusbyVyg7YA8ly27yqJ3n6V+
         b7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437952; x=1772042752;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXX5Ad6lE4eM3SpWZXXZtn5YXTRNU+kz7ZHFBHa7LgY=;
        b=WZpQ3X7qubCRbGs4byF0qwfWVaTY5vtarjlBK0aY+ydx3FT7tpCauML2RjY7W84xW9
         dPTW2h5OedkrYDX2UjqAWQ66+TswVgORvoU/vNQ/L+6qBiaOck+7rStbfaK6ooweQYb1
         DlHGc0ihK69ebbcHZOQNNaJrgd7E1/OB5+u5WoqHyEaNLrX5O3HHCgKSzcEFUW22egx1
         1hr7WIuEvkl6W0pg/eXQdE9yQKYzgxoo0TjrXOvrQKTsD/y0YngIMdtH7JvObcRCI8nE
         35usZ8HQi4KsEdX59Q2G9b0qDFaxUT0U9Mf19PziPcPqAPsV1P1PJhuw5APhUYY/Hfl6
         OWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYkdpioa3XpAP/yq0553ExkwNLHD+b81s3W42381AuvjCGexd42JXDSqlOkvy/4ll/4ym+QCbcAF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxlTP0B9DVKS+AtMM5mNG2IRLo1DAVUEfBgFcW+ZDaEExBwZw9
	oj/3J1bEGpHKDKrhmf64vsFieWmpKpjOPIa3C3X6j7BHS3FFQ/14v5L/mJn7eFM28HY=
X-Gm-Gg: AZuq6aJtTEiWtNYaty675H/H3I2VdC/wjBsGMzQDP0X+hY1Cg3ycpAWC51xGl9zwgu4
	M83K2QtFEbvh2scM++Sm2FejjTB5mAHFQFHlVEPr87l0M+YZs6Pk188WqCHYRvG2umtzYcPypKp
	3fnG6CjvN3IM2Zu39pFeIGDyNNMHQ1KoCgz48RmSZsbHXp8bVQjYHTRDOSy8hKO+Rucu7/xS+c5
	VTYx66t0lqOOEVWWFgM9jK4JM9D2W24OV1s+3OZFyyeEmMxtq8iCbZjLm/vEdcKcQSoskqcWIzJ
	BNLVx5K1/xPujXaI+/DC03I9Kt5RSkLHNmVZU8orrql9vWDmtRXAPHDJZfbI9SkZCuQ43bdEQWA
	cXFkIOnJmoGP573LX3OXP4KDcgat9ul+/Ogyz2Siiorh1w9xZh80QzVs/gaJx39RUP8TAlAQAtS
	gmRIMrxBF01YDsv2pS5OcpaQ==
X-Received: by 2002:a05:600c:3b15:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-48398cc6196mr51541025e9.18.1771437951849;
        Wed, 18 Feb 2026 10:05:51 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-483801ff9b3sm317029295e9.13.2026.02.18.10.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:05:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] drivers: clk: meson: Add Amlogic T7 fix pll support
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 11:17:06 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:05:49 +0100
Message-ID: <1j4ine6i6a.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 18 f=C3=A9vr. 2026 at 11:17, Ronald Claveau <linux-kernel-dev@aliel=
.fr> wrote:

> Add PLL for the clock controller of the Amlogic T7 SoC family.
>

As Krzysztof pointed out, a series like this needs a cover letter to explain
what you are trying to acheive overall, and proper threading.

The description above is too vague.

> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  drivers/clk/meson/t7-pll.c | 257 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 257 insertions(+)
>
> diff --git a/drivers/clk/meson/t7-pll.c b/drivers/clk/meson/t7-pll.c
> index 0a622f45fa36..3dd3aca50b7c 100644
> --- a/drivers/clk/meson/t7-pll.c
> +++ b/drivers/clk/meson/t7-pll.c
> @@ -71,6 +71,15 @@
>  #define MCLK_PLL_CNTL4		0x10
>  #define MCLK_PLL_STS		0x14
>=20=20
> +#define FPLL_CTRL0		0x00
> +#define FPLL_CTRL1		0x04
> +#define FPLL_CTRL2		0x08
> +#define FPLL_CTRL3		0x0c
> +#define FPLL_CTRL4		0x10
> +#define FPLL_CTRL5		0x14
> +#define FPLL_CTRL6		0x18
> +#define FPLL_STS		0x1c

The PLL you are adding is described in the datasheet as the MPLL. FPLL
is nowhere to be found. Prefer using names that relate to the
documentation.

If you must make a name up, you need to have a very good reason and to
explain it.

Still from the public documentation, this PLL belong in the same device as
MPLL0, MPLL1, etc ... BUT, I remember correctly the T7 initial
submission, the fixed PLL and fdivs are supposed to be provided through
SCMI clocks. Have you checked that ?

> +
>  static const struct pll_mult_range t7_media_pll_mult_range =3D {
>  	.min =3D 125,
>  	.max =3D 250,
> @@ -1047,6 +1056,253 @@ static const struct meson_clkc_data t7_mclk_data =
=3D {
>  	},
>  };
>=20=20
> +static struct clk_regmap t7_fpll_dco =3D {
> +	.data =3D &(struct meson_clk_pll_data){
> +		.en =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 28,
> +			.width   =3D 1,
> +		},
> +		.m =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 0,
> +			.width   =3D 8,
> +		},
> +		.n =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 10,
> +			.width   =3D 5,
> +		},
> +		.frac =3D {
> +			.reg_off =3D FPLL_CTRL1,
> +			.shift   =3D 0,
> +			.width   =3D 17,
> +		},
> +		.l =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 31,
> +			.width   =3D 1,
> +		},
> +		.rst =3D {
> +			.reg_off =3D FPLL_CTRL0,
> +			.shift   =3D 29,
> +			.width   =3D 1,
> +		},
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fpll_dco",
> +		.ops =3D &meson_clk_pll_ro_ops,
> +		.parent_data =3D &(const struct clk_parent_data) {
> +			.fw_name =3D "xtal",
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fpll =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +		.offset =3D FPLL_CTRL0,
> +		.shift =3D 16,
> +		.width =3D 2,
> +		.flags =3D CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fpll",
> +		.ops =3D &clk_regmap_divider_ro_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fpll_dco.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv2_div =3D {
> +	.mult =3D 1,
> +	.div =3D 2,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv2 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 24,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv2_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv2p5_div =3D {
> +	.mult =3D 2,
> +	.div =3D 5,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2p5_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fpll.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv2p5 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 25,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv2p5",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv2p5_div.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv3_div =3D {
> +	.mult =3D 1,
> +	.div =3D 3,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv3_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv3 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 20,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv3",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv3_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv4_div =3D {
> +	.mult =3D 1,
> +	.div =3D 4,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv4_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv4 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 21,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv4",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv4_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv5_div =3D {
> +	.mult =3D 1,
> +	.div =3D 5,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv5_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv5 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 22,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv5",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv5_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_fixed_factor t7_fdiv7_div =3D {
> +	.mult =3D 1,
> +	.div =3D 7,
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv7_div",
> +		.ops =3D &clk_fixed_factor_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) { &t7_fpll.hw },
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_fdiv7 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D FPLL_CTRL1,
> +		.bit_idx =3D 23,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "fdiv7",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_fdiv7_div.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_IS_CRITICAL,
> +	},
> +};
> +
> +static struct clk_hw *t7_fpll_hw_clks[] =3D {
> +	[CLKID_FPLL_DCO]	=3D &t7_fpll_dco.hw,
> +	[CLKID_FPLL]		=3D &t7_fpll.hw,
> +	[CLKID_FDIV2_DIV]	=3D &t7_fdiv2_div.hw,
> +	[CLKID_FDIV2]		=3D &t7_fdiv2.hw,
> +	[CLKID_FDIV2P5_DIV]	=3D &t7_fdiv2p5_div.hw,
> +	[CLKID_FDIV2P5]		=3D &t7_fdiv2p5.hw,
> +	[CLKID_FDIV3_DIV]	=3D &t7_fdiv3_div.hw,
> +	[CLKID_FDIV3]		=3D &t7_fdiv3.hw,
> +	[CLKID_FDIV4_DIV]	=3D &t7_fdiv4_div.hw,
> +	[CLKID_FDIV4]		=3D &t7_fdiv4.hw,
> +	[CLKID_FDIV5_DIV]	=3D &t7_fdiv5_div.hw,
> +	[CLKID_FDIV5]		=3D &t7_fdiv5.hw,
> +	[CLKID_FDIV7_DIV]	=3D &t7_fdiv7_div.hw,
> +	[CLKID_FDIV7]		=3D &t7_fdiv7.hw,
> +};
> +
> +static const struct meson_clkc_data t7_fpll_data =3D {
> +	.hw_clks =3D {
> +		.hws =3D t7_fpll_hw_clks,
> +		.num =3D ARRAY_SIZE(t7_fpll_hw_clks),
> +	},
> +};
> +
>  static const struct of_device_id t7_pll_clkc_match_table[] =3D {
>  	{ .compatible =3D "amlogic,t7-gp0-pll",	.data =3D &t7_gp0_data, },
>  	{ .compatible =3D "amlogic,t7-gp1-pll",	.data =3D &t7_gp1_data, },
> @@ -1055,6 +1311,7 @@ static const struct of_device_id t7_pll_clkc_match_=
table[] =3D {
>  	{ .compatible =3D "amlogic,t7-mpll",	.data =3D &t7_mpll_data, },
>  	{ .compatible =3D "amlogic,t7-hdmi-pll",	.data =3D &t7_hdmi_data, },
>  	{ .compatible =3D "amlogic,t7-mclk-pll",	.data =3D &t7_mclk_data, },
> +	{ .compatible =3D "amlogic,t7-fpll",	.data =3D &t7_fpll_data, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, t7_pll_clkc_match_table);

--=20
Jerome

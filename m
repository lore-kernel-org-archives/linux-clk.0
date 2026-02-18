Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93561DF271
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 18:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439423; cv=none; b=R52M6wmdaQAeV5IsBNozQ6V/7fZNCr22cTIJ4Y70eNqMDP+l+MljR88JnujwlFpQHIwWwQpmVRZdcMf24nNI3kUjMSefJTFovRLFi5A+FmUA4BFnbZZ0GIbsXappeEVpZ53p58BFo600I6lJc/wvSLrhSomEAaiws0zGMao7CcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439423; c=relaxed/simple;
	bh=v3n3g/kDncMeWOyhBafttmbI18yQeDLoSTXjKZQMWXg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tdfs9cVf7kBsQNC7jepCvk0fbSLf7SWWl2rP97qqOsFD7ceMkKkW6AS1cPB07tetyZdOB/2xNahdfXWxHb3dkE9bsFOC0hQfdXfzj2tVbZg/LicBGd+W43aKuCoL4nujZ0Mzp7VL29zs+U9Hu6kj7zjhfsQpCAnoX9x07ss6hYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nId2v/X9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nId2v/X9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4362507f0bcso136556f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 10:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771439419; x=1772044219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljQ1E1/F1vX5ElaoR98ZDeHZ74Gy13PXjEW6i38QL6o=;
        b=nId2v/X9aRxL2lEBSQnmSV6vmFF7LVl5/zEq/kb6tGIHhrCgBKrgQhLmPUOW3J1Wjh
         tzhvRYJP9EH9PIApMchtKveKYjgxR3VOjMxjFP/xKH0CcGIcHUGno+YoOCMeElePgj4F
         dmbTZHS22GHK1T3A/3ID4FXKWmI0MSEf7xz7fVjl6O6M2prU2jtbin8O2O5k57TqQ93O
         hAuLiKu7v6IDw9p9HPvThe6n0LDP41rNWkZFujCXyyQvlvq0BHGecExE8oUiqOhZ0znl
         aGwVxBZjcAVExy21cyZkHPlyr0fzcWpuC8jVjztA4krSfMIh9ruu0J3E1rq+l8XTl9XP
         IZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439419; x=1772044219;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljQ1E1/F1vX5ElaoR98ZDeHZ74Gy13PXjEW6i38QL6o=;
        b=hu2Hhgx8Qo+epDYsawBL/3YbSiGDD5x9oXArPsWVOCImmyUJuuLxeBcgHbdgHWr5nN
         pAD25OaVB6qJrW0LwGU0eCdMwvwffOkeWLjjG76TbSRe1oQ0iApy6/w2e4BW/WfiK919
         f93HoGpfGTQh7+7d/koNEkF3mnRedf267mcnMwZ3YVl/YiW9u1SZ667+b0LNMh0PpIZY
         npZixAVs5Jni2r0o60IP1FpynbkbsQmEJQBm3y3rLvFfQSmaHBldJQd2eBTVpcVipmIb
         fULjceP+d1lKblkBaQ8wBsaPagt+2z8bj075AboxdyffInC13I71RW5CDe7abZt9guQ1
         wI2g==
X-Forwarded-Encrypted: i=1; AJvYcCVbNZRdvdRmOFsRyA3JPODlzAZQfUooQQNwn3+VzNfsi4ALF7qWfAGy4TLAObr01F335VyGKFdG1hU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57n+ym9lRbY2UjSUf4yqTcUOruPt4oFjZFd6ELt0VkZmYJGYI
	GaaCA54JvQYJtkGN9+Y70Ccm9w2UGCjhv2px9cTkN35wAwLCCRrzAKKeCU1HI1Byvek=
X-Gm-Gg: AZuq6aLhyTWH9HP/w6ThUjohZoXtCSjfqgtVyLflfbgwoytMLfSWYw3/AiVCw1HrvAR
	osa6CGqwWFtXP3PSPlTLSelh/MTgg53M7BQMDN/jmZ9/zgaXO8+pfLUsEf7PS1KmN420dLwzzjC
	l9gC0KcAKk9bjjjfNEE9GX7h6LKcH32Rut74dcEINT/o/nSqaZ9QplgbRDt7+eSw8WnT4gyI8ll
	F4ylVG22HEQBNyu138FeOHxUGqS+DG5uGfYwryP3zyC9ahXIqHqJfT20H1zsCgD+LxBlnVi0A6a
	GoAfJXRf+ppkkDm9tbK8DaGMHWACV2zvP96VPE614nO9vHDHLdY8xqt2HFJGbl38xfeiUW9XMWh
	vOvQtRDw/5eTUz7012Xmw58DhL/8BtkfgytwLQldkwK4CPJ7Fk8d+XxJ89Nt7/YkgFNYIP14xbJ
	akoQtlHsuKuumzDCrxggBpdw==
X-Received: by 2002:a05:6000:400d:b0:436:e875:7911 with SMTP id ffacd0b85a97d-43958be4a76mr5368651f8f.4.1771439419072;
        Wed, 18 Feb 2026 10:30:19 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43796a6b563sm43048552f8f.12.2026.02.18.10.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:30:18 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman <khilman@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] drivers: clk: meson: Add Amlogic T7 sys pll support
In-Reply-To: <20260218110018.36348-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 12:00:15 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218110018.36348-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:30:17 +0100
Message-ID: <1jjyw96h1i.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 18 f=C3=A9vr. 2026 at 12:00, Ronald Claveau <linux-kernel-dev@aliel=
.fr> wrote:

> Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Like the FDIVs, I think this is provided by SCMI.

Check include/dt-bindings/clock/amlogic,t7-scmi.h

>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  drivers/clk/meson/t7-peripherals.c | 134 ++++++++++++++++++++++++++++-
>  1 file changed, 131 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-pe=
ripherals.c
> index 214db7850d86..de206473f3a7 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -176,6 +176,127 @@ static struct clk_regmap t7_rtc =3D {
>  	},
>  };
>=20=20
> +static u32 t7_sys_parents_val_table[] =3D { 0, 1, 2, 3, 4, 5, 7 };
> +static const struct clk_parent_data t7_sys_parents[] =3D {
> +	{ .fw_name =3D "xtal", },
> +	{ .fw_name =3D "fdiv2", },
> +	{ .fw_name =3D "fdiv3", },
> +	{ .fw_name =3D "fdiv4", },
> +	{ .fw_name =3D "fdiv5", },
> +	{ .fw_name =3D "axi_clk_frcpu", },
> +	{ .hw =3D &t7_rtc.hw },
> +};
> +
> +static struct clk_regmap t7_sys_a_sel =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.mask =3D 0x7,
> +		.shift =3D 10,
> +		.table =3D t7_sys_parents_val_table,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_a_sel",
> +		.ops =3D &clk_regmap_mux_ops,
> +		.parent_data =3D t7_sys_parents,
> +		.num_parents =3D ARRAY_SIZE(t7_sys_parents),
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_a_div =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +	.offset =3D SYS_CLK_CTRL0,
> +		.shift =3D 0,
> +		.width =3D 10,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_a_div",
> +		.ops =3D &clk_regmap_divider_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_a_sel.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_a =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.bit_idx =3D 13,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_a",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_a_div.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_b_sel =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.mask =3D 0x7,
> +		.shift =3D 26,
> +		.table =3D t7_sys_parents_val_table,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_b_sel",
> +		.ops =3D &clk_regmap_mux_ops,
> +		.parent_data =3D t7_sys_parents,
> +		.num_parents =3D ARRAY_SIZE(t7_sys_parents),
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_b_div =3D {
> +	.data =3D &(struct clk_regmap_div_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.shift =3D 16,
> +		.width =3D 10,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_b_div",
> +		.ops =3D &clk_regmap_divider_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_b_sel.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys_b =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.bit_idx =3D 29,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_b",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_b_div.hw
> +		},
> +		.num_parents =3D 1,
> +	},
> +};
> +
> +static struct clk_regmap t7_sys =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D SYS_CLK_CTRL0,
> +		.mask =3D 0x1,
> +		.shift =3D 15,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "sys_clk",
> +		.ops =3D &clk_regmap_mux_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&t7_sys_a.hw,
> +			&t7_sys_b.hw,
> +		},
> +		.num_parents =3D 2,
> +	},
> +};
> +
>  static struct clk_regmap t7_ceca_dualdiv_in =3D {
>  	.data =3D &(struct clk_regmap_gate_data){
>  		.offset =3D CECA_CTRL0,
> @@ -824,7 +945,7 @@ static T7_COMP_GATE(sd_emmc_c, NAND_CLK_CTRL, 7, 0);
>=20=20
>  static const struct clk_parent_data t7_spicc_parents[] =3D {
>  	{ .fw_name =3D "xtal", },
> -	{ .fw_name =3D "sys", },
> +	{ .hw =3D &t7_sys.hw },
>  	{ .fw_name =3D "fdiv4", },
>  	{ .fw_name =3D "fdiv3", },
>  	{ .fw_name =3D "fdiv2", },
> @@ -859,7 +980,7 @@ static T7_COMP_GATE(spicc5, SPICC_CLK_CTRL2, 22, 0);
>=20=20
>  static const struct clk_parent_data t7_saradc_parents[] =3D {
>  	{ .fw_name =3D "xtal" },
> -	{ .fw_name =3D "sys" },
> +	{ .hw =3D &t7_sys.hw },
>  };
>=20=20
>  static T7_COMP_SEL(saradc, SAR_CLK_CTRL0, 9, 0x1, t7_saradc_parents);
> @@ -929,7 +1050,7 @@ static T7_COMP_SEL(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 25,=
 0x3, t7_pwm_parents);
>  static T7_COMP_DIV(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 16, 8);
>  static T7_COMP_GATE(pwm_ao_h, PWM_CLK_AO_GH_CTRL, 24, 0);
>=20=20
> -static const struct clk_parent_data t7_sys_pclk_parents =3D { .fw_name =
=3D "sys" };
> +static const struct clk_parent_data t7_sys_pclk_parents =3D { .hw =3D &t=
7_sys.hw };
>=20=20
>  #define T7_SYS_PCLK(_name, _reg, _bit, _flags) \
>  	MESON_PCLK(t7_##_name, _reg, _bit, &t7_sys_pclk_parents, _flags)
> @@ -1161,6 +1282,13 @@ static struct clk_hw *t7_peripherals_hw_clks[] =3D=
 {
>  	[CLKID_PWM_AO_H_SEL]		=3D &t7_pwm_ao_h_sel.hw,
>  	[CLKID_PWM_AO_H_DIV]		=3D &t7_pwm_ao_h_div.hw,
>  	[CLKID_PWM_AO_H]		=3D &t7_pwm_ao_h.hw,
> +	[CLKID_SYS_A_SEL]		=3D &t7_sys_a_sel.hw,
> +	[CLKID_SYS_A_DIV]		=3D &t7_sys_a_div.hw,
> +	[CLKID_SYS_A]			=3D &t7_sys_a.hw,
> +	[CLKID_SYS_B_SEL]		=3D &t7_sys_b_sel.hw,
> +	[CLKID_SYS_B_DIV]		=3D &t7_sys_b_div.hw,
> +	[CLKID_SYS_B]			=3D &t7_sys_b.hw,
> +	[CLKID_SYS]				=3D &t7_sys.hw,
>  	[CLKID_SYS_DDR]			=3D &t7_sys_ddr.hw,
>  	[CLKID_SYS_DOS]			=3D &t7_sys_dos.hw,
>  	[CLKID_SYS_MIPI_DSI_A]		=3D &t7_sys_mipi_dsi_a.hw,

--=20
Jerome

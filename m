Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2452561A2;
	Thu, 15 Oct 2026 05:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792042447; cv=none; b=fUansYZVAP+URlE3D2eQxE17XTklrYu/+6RCPH8xh9KnB5S2a5f/TaJr9TbLub3tg0TS9D5ypd2r1D1KWbSFvilVf6kS2fWVhP+vOPWh+AxpNAS6aRLQw+iOt0ZI9brGy96c3M9VVSmQJPxZAscW+RQzalVl9A+3TcusSAIEJBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792042447; c=relaxed/simple;
	bh=l657UIqQ8RE5G8Wd5V+W5rIzFW7/I5cS/jaPDlzyAmM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tcCk8VI19etY+RdYNrpikr5U2B8d/D6SmiRrrWgJW95eO9RthJ28mZHJYD77IdAxqFV9YFKB7NBWAJ9MdPRlijkq4SuyUjP5540pH14QMuAGt2veV9TCbbcBqFfUI1vMOjHSuJf3m6y5huvpxftyX9w5hfWlMA+ud0t+585VuA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXgZaxxo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXgZaxxo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B5A1F000C4;
	Thu, 15 Oct 2026 05:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792042445;
	bh=RN5YhrlLTFM19t1JkLjlkSxqfMqixPkUGFH2Wd7X5bI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HXgZaxxoUQkZ7qbszdhSlRgxX8lugc9QsrUtxvk9fpNdqbRdsrdD1H4iOHmkrk0+1
	 +O4mtqGaV5s4eUh6+E9d0jqYG0oLli3DXccC+SRpSxTRlNuReSlvJUJO0YAzowaFy4
	 EySl9ppXAMJ3CK6fWDUy1panrEIZCsdg03EVBJZs/FoPNvI7i9g/i0Avd81g5kr7qc
	 QvAogNg7kxcQmSUgIyPk34qElwiVI8KWjvis24L5uN89t4SvxoPIyQF0UGYxTX+Hcb
	 7UJHiUTyuoCX85Snktg8MVaX9/gjdOQ/Sfmf3EW6B1iYZSyLtcws62uR6Mi3gyVMkR
	 G9LAZZyzVCxaw==
Message-ID: <sashiko-outbox-172310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/6] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015051926.13752-3-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
 <20261015051926.13752-3-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 05:34:04 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] clk: qcom: rate configuration failure for gcc_cpuss_ahb_clk_src =
due to src mismatch
- [Low] kconfig: missing default ARCH_QCOM in SM_GCC_7250
--

commit d75ec50c6226017a3fb6c285ecf2e67ec2c78bb0
Author: Sreeshankar K <sreeshankar0910@gmail.com>
Subject: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250

Add support for the global clock controller found on SM7250 based devices.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1747,6 +1747,15 @@ config SM_GCC_7150
>  	  Say Y if you want to use peripheral devices such as UART,
>  	  SPI, I2C, USB, SD/UFS, PCIe etc.
> =20
> +config SM_GCC_7250
> +	tristate "SM7250 Global Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select QCOM_GDSC

[Severity: Low]
Is this Kconfig entry missing a default ARCH_QCOM clause? Peer configs
typically include it so the driver is built by default for Qualcomm targets.
Without it, this driver will be silently excluded from default builds.

> +	help
> +	  Support for the global clock controller on SM7250 devices.
> +	  Say Y if you want to use peripheral devices such as UART,
> +	  SPI, I2C, USB, SD/UFS etc.
> +
>  config SM_GCC_MILOS

[ ... ]

> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
> @@ -0,0 +1,2358 @@

[ ... ]

> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] =3D {
> +	F(19200000, DT_BI_TCXO_AO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 gcc_cpuss_ahb_clk_src =3D {
> +	.cmd_rcgr =3D 0x48010,
> +	.mnd_width =3D 0,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_cpuss_ahb_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data){
> +		.name =3D "gcc_cpuss_ahb_clk_src",
> +		.parent_data =3D gcc_parent_data_0_ao,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0_ao),

[Severity: Medium]
Does ftbl_gcc_cpuss_ahb_clk_src use the wrong enum for its src field? It
currently uses the device tree index DT_BI_TCXO_AO (1) instead of the
hardware parent P_BI_TCXO (0).

Since the clock binds this frequency table with gcc_parent_map_0, which maps
the first entry to P_BI_TCXO (0), and bounds the iteration with a num_paren=
ts
of 1, a src of 1 will not match map[0].src (which is 0).

Could this cause the parent lookup to fail with -ENOENT and break rate
configuration for the CPUSS AHB clock?

> +		.flags =3D CLK_SET_RATE_PARENT,
> +		.ops =3D &clk_rcg2_ops,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015051926.1375=
2-2-sreeshankar0910@gmail.com?part=3D2

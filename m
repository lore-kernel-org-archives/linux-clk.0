Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA343812C2;
	Thu, 27 Aug 2026 16:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849587; cv=none; b=Oy63JoAkZm07+3XlpeEgh0aZatG6iiCbEPJJnyGQBeS6Vj+RjeJhir62IDOj6c8HJoSljujAstgjTyKxC1XRGpDhBfi4+VfYO1voZbOzBjDVZl8+UPehx0Vxwu/H0aJlnUUTzSbqRiPsI1oOtMGKXhTStPOuP+J3HvDkfypnCW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849587; c=relaxed/simple;
	bh=ayLr9ZTQ9Ir57DUhUxclxJ95yYFos9ZRy1DTtfooskc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VYSh48E+B6X9T1pAuaOJsBwuNObvb0HZxZWubJFc3H/8wfR4DcazcAepOLms1Po6MpNXVQVVH1xDCWBPkIBM/sP0QdVtdl7Su1r6LS7qb7FRCMs8zte+1e7sKIEk9R1/Hp/s/wGadkVXSNZZZmPiCr1v+jY6+MezKUDffiZ8yY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bD5BnM1N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bD5BnM1N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23901F000E9;
	Thu, 27 Aug 2026 16:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787849586;
	bh=HOsDr9JqeKAfCsvXuPSqufqm5M4JQ7Kxh6lSFisFYtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bD5BnM1NbMMNEbqGDQGyZeHo138YFdLrUSKboPYR88cqfRiNAcn6Uf/5pFNcpvlG4
	 PHccw/HqRKqRvp1wpDuBEnGxHpQUAoBerTwD1DgWpYUmoaZN+ydtJCC+yvB3jJREmR
	 lTxL9aoFgo7Zf0XOTexcLCPdWnhe5riHW0uYM7xTwZ+6FYJUZ+RBVZmUYJpWr/NVUv
	 5NXDtJZjDMuD8ZXy1WP8K6PqscxTzVHCcGFzZ0DRHuav2X+lCzfakkZUjqnxEdh2zV
	 Gktp/ejXx61kEmEFitxG3e2NLrneirzBukC9sfqvBpZLsI6Mt8lsLTdGtXx3stF7Co
	 8jtD2x8U6MiiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hardeep Sharma" <hardeep.sharma@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260827-kuno-soc-support-v4-11-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
 <20260827-kuno-soc-support-v4-11-dd34f235fc1a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 16:53:05 +0000
Message-Id: <20260827165305.A23901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The CLK_KUNO_GCC Kconfig entry is missing `select QCOM_GDSC`, whic=
h leads to a silent runtime probe failure if QCOM_GDSC is not enabled.
- [High] The SDCC (Secure Digital) apps clock uses `clk_rcg2_ops` instead o=
f `clk_rcg2_floor_ops`, which can cause SD card overclocking and data corru=
ption.
--

commit e6e05944bec5f5d0474370120050ea04e9b3eb87
Author: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

clk: qcom: Add Global Clock Controller driver for Kuno
   =20
Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
providing the PLLs, root clock generators, gate/branch clocks and resets
used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
Ethernet.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e609a7819e072..1f31bf09de0cd 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig

[ ... ]

> @@ -212,6 +212,16 @@ config CLK_KAANAPALI_VIDEOCC
>  	  Say Y if you want to support video devices and functionality such as
>  	  video encode/decode.
> =20
> +config CLK_KUNO_GCC
> +	tristate "Kuno Global Clock Controller"
> +	depends on ARM || COMPILE_TEST
> +	default ARCH_QCOM

[Severity: High]
Should this config also select QCOM_GDSC?

If CONFIG_QCOM_GDSC is not enabled, the static inline stub for gdsc_registe=
r()
in gdsc.h unconditionally returns -ENOSYS. When qcom_cc_really_probe() calls
gdsc_register() for the GDSCs declared in gcc_kuno_desc, it receives -ENOSYS
and aborts the probe entirely. This can leave dependent peripherals without
clocks or resets at runtime.

> +	help
> +	  Support for the global clock controller (GCC) on Kuno devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  I2C, USB, SD, PCIe and Ethernet on the Kuno SoC. This clock
> +	  controller supplies the clocks and resets to those peripherals.
> +
>  config CLK_NORD_DISPCC
>  	tristate "Nord Display Clock Controller"
>  	depends on ARM64 || COMPILE_TEST

> diff --git a/drivers/clk/qcom/gcc-kuno.c b/drivers/clk/qcom/gcc-kuno.c
> new file mode 100644
> index 0000000000000..787111397df96
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-kuno.c

[ ... ]

> +static struct clk_rcg2 gcc_sdcc4_apps_clk_src =3D {
> +	.cmd_rcgr =3D 0x6a01c,
> +	.mnd_width =3D 8,
> +	.hid_width =3D 5,
> +	.parent_map =3D gcc_parent_map_0,
> +	.freq_tbl =3D ftbl_gcc_sdcc4_apps_clk_src,
> +	.clkr.hw.init =3D &(const struct clk_init_data) {
> +		.name =3D "gcc_sdcc4_apps_clk_src",
> +		.parent_data =3D gcc_parent_data_0,
> +		.num_parents =3D ARRAY_SIZE(gcc_parent_data_0),
> +		.ops =3D &clk_rcg2_ops,

[Severity: High]
Should gcc_sdcc4_apps_clk_src use clk_rcg2_floor_ops instead of clk_rcg2_op=
s?

When the MMC core requests a clock rate for the SD card, the standard
clk_rcg2_ops uses qcom_find_freq(), which rounds up to the nearest available
frequency greater than or equal to the requested rate. If the requested rate
isn't an exact match in the frequency table, it will exceed the maximum safe
frequency mandated by the SD specification, which can cause SD card
overclocking and potential data corruption.

> +	},
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-kuno-soc-s=
upport-v4-0-dd34f235fc1a@oss.qualcomm.com?part=3D11

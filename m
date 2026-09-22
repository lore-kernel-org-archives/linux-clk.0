Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5848F031;
	Tue, 22 Sep 2026 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103203; cv=none; b=Mf/fqymYXGV5ynVQ63H7aVUdhfuEq11kqnOx5VTFSMjfhjKNzKUnZRjzWgudH5NHTLx0cPxPy2oCf0U7U7LWrNX72HNyRsXyW3H/2EoXWInwUhhtE0loULn6Z5EzDBdFiJfVJr8spYeg12oY+4d+4A1LAF/M1csemhlS892sPiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103203; c=relaxed/simple;
	bh=ktJID8RfJpbLaRb4ycycwCY7Q4DNFp89C0+Wusq07rE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uc7K5IIMkOCDaOpzaXJ/RQcKNpQdAXVILH40mqnXZLuoBxDrjHQSSReRk/EbaAop+5hYI8axsfNXPyLoRtnC38252XJcI7JFxWuQ5kx3dnmpcedWsKmAsJL6VyB+BGF87JTk+NGqgsC2KXO333zNjm3w2otXXllJlefQCZkgOqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQoSyQ5B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQoSyQ5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7771F000FF;
	Tue, 22 Sep 2026 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790103198;
	bh=GsJFfCqa/QC0MILSdwaIAM6OGJwETtBYIsDe6dZzX3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jQoSyQ5Bv/TUOfPMpb9H80d7Ky0d2Ms4Qs7/aKhoR87aIo9q49ciP/6VaavhHWYF5
	 AVCcp3BOViycHSLe6vP6+TtWOZIdvw1c0w6rXqB5DKvO4OFi3550HZmZfeCiY+WXrj
	 5zXvuXLbG90nzBRkTUWJysmmkydW2Ouj/1hezkPb8+3T6lB2uKgboVyrOgTlZfmrQR
	 EaIuiVDLokEV34tpTcLsyXKKGTkCp0czsE6wASEaqCD2zh42yL9I2IlS0xwP+zfJ/E
	 PKWxNpR8b5EjoQA6/iSrlyh6tPedNzwel+ttwVSinM84gJ1zbwgn+sf1tNZ6Q1IYuz
	 8IWVymUPndCRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 18:53:17 +0000
Message-Id: <20260922185318.2D7771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: qcom: regmap max_register restricts access to WSA3/WSA4 resets
- [Medium] clk: qcom: SC_LPASSCC_GLYMUR missing select CLK_GLYMUR_GCC depen=
dency
- [Medium] clk: qcom: missing NULL check on of_device_get_match_data() resu=
lt
--

commit a3d72a1f7ec423f2250c7ae64750a7f38d02a929
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

clk: qcom: Add lpass audio clock controller driver for Glymur

This commit adds support for the lpass audio clock controller found on
Glymur based devices. It allows lpass peripheral loader drivers to control
the clocks and bring the subsystems out of reset.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index d1fc9bf87126b..8a6c15ab9da7a 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1177,6 +1177,17 @@ config SC_LPASSCC_8280XP
>  	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
>  	  controller to reset the LPASS subsystem.
> =20
> +config SC_LPASSCC_GLYMUR
> +	tristate "GLYMUR Low Power Audio Subsystem (LPASS) Clock Controller"
> +	depends on ARM64 || COMPILE_TEST

[Severity: Medium]
Does this Kconfig entry miss a dependency on the global clock controller?

If this driver is built without CLK_GLYMUR_GCC being enabled, can it lead
to unclocked register accesses and probe failures, since peripheral
controllers depend on GCC for AHB/AXI access?

Additionally, does the naming prefix SC_LPASSCC_GLYMUR diverge from the
standard CLK_GLYMUR_* prefix used by other Glymur clock controllers,
potentially violating cross-config consistency guidelines?

> +	default m if ARCH_QCOM
> +	help
> +	  Support for the LPASS clock controller on Glymur devices.
> +	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
> +	  controller to reset the LPASS subsystem.  Required for the LPASS
> +	  audio macros and the SoundWire compute-mode controller to leave
> +	  reset on Glymur.

[ ... ]

> diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc=
-glymur.c
> new file mode 100644
> index 0000000000000..97fc099983b62
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscc-glymur.c
> @@ -0,0 +1,70 @@

[ ... ]

> +static const struct qcom_reset_map lpass_audiocc_glymur_resets[] =3D {
> +	[LPASS_AUDIO_SWR_RX_CGCR] =3D { 0xA0, 1 },
> +	[LPASS_AUDIO_SWR_WSA1_CGCR] =3D { 0xB0, 1 },
> +	[LPASS_AUDIO_SWR_WSA2_CGCR] =3D { 0xD8, 1 },
> +	[LPASS_AUDIO_SWR_WSA3_CGCR] =3D { 0x300C, 1 },
> +	[LPASS_AUDIO_SWR_WSA4_CGCR] =3D { 0x301C, 1 },
> +};
> +
> +static const struct regmap_config lpass_audiocc_glymur_regmap_config =3D=
 {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.name =3D "lpass-audio-csr",
> +	.max_register =3D 0x1000,

[Severity: High]
Does this max_register boundary of 0x1000 prevent access to the WSA3 and
WSA4 resets at offsets 0x300C and 0x301C defined above?

Will the regmap core reject attempts to assert or deassert those resets,
silently failing with -EIO and leaving the dependent audio blocks broken in
an undefined reset state?

> +};

[ ... ]

> +static int lpasscc_glymur_probe(struct platform_device *pdev)
> +{
> +	const struct qcom_cc_desc *desc =3D of_device_get_match_data(&pdev->dev=
);
> +

[Severity: Medium]
If the driver is bound manually to a non-DT platform device via sysfs, could
of_device_get_match_data() return NULL here?

If so, when desc is passed to qcom_cc_probe_by_index(), will it cause a
NULL pointer dereference when accessing desc->config?

> +	return qcom_cc_probe_by_index(pdev, 0, desc);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922184425.5611=
4-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3

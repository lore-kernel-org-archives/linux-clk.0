Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBCF3D891F;
	Fri, 25 Sep 2026 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326498; cv=none; b=bv7MeVbExgJbS3RgTy3WtqTbUuU6pUK+9y/lHmhujv+nvnWl5em5PcFw1tioiAGSGAP/XaAM4UI1P37rqVwmDAMLyJO6gmvU624RAFgBYWfHBMj9vEGXzp426jXU3NjeYXIRTB65qJ1LU/FY9TJtvcIIHjiCvRcslYwkrMEvQX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326498; c=relaxed/simple;
	bh=whRTRytNFXJ6yv27AeunLIdqqAPwUHKHVDtFSzkAyPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n79UZHe2erHdOxQnAUVFpJPKb87eqz7uaOr1aNTR+uMdY1l/NYsPctg+QgmqgWp3q3tdfdUeeVKil51ROkUhXOh45eXimhXT9bi36Aj1NWGJvPSDCIi3RY/MnjTkhKAdDSiPUQGpMEq5SO6zK/b+DNFvaAjj6vri8MggXNsq2Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQksgQLl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQksgQLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6EF1F000FF;
	Fri, 25 Sep 2026 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790326497;
	bh=LZyEQV4yuKpnz9owINkSGiZR37QMXVmaN7Ow/tWvU2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eQksgQLlpfiL1+iNvItoUxs2tMzTXUdEp3dKJZzCL2FDH9xN2sTHcDP4NWOF9Hl4Q
	 hFZkGSub4ykBuhnoVrpGT2a7uQqva9B4zK9MoxcCIZEtomWSXNuokYdIBumUrtB7xL
	 1Nwu/oJ12y4RbHwj+5bqXiTBqsSnJ/vQuNqfKE/9t36D02oeBjqb7wKBT5EJDuzIps
	 0QJzvsw2TiWi2Q2TtMSINu+z8OwpU5ommLosiK5gVwNhAwe6Xd2y9lHh6g7lItyr6S
	 Nmhp7ZPaXJLghVjw7C/LWVQYD7hOusp6j8GCtJT6vk2Vsf+Oo0FeD+d1Botw9+3OBP
	 21VVeHsSlm0+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller
 driver for Glymur
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 08:54:56 +0000
Message-Id: <20260925085456.DC6EF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: regmap max_register too small for WSA3 and WSA4 resets
--

commit 6f75476fee92ffe314194d6764b5d4210219aa0a
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

clk: qcom: Add lpass audio clock controller driver for Glymur

This commit adds support for the LPASS audio clock controller on
Glymur devices. This allows LPASS peripheral loader drivers to control
the clocks and bring the subsystems out of reset.

> diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc=
-glymur.c
> new file mode 100644
> index 0000000000000..356625dce99e2
> --- /dev/null
> +++ b/drivers/clk/qcom/lpasscc-glymur.c

[ ... ]

> +static const struct qcom_reset_map lpass_audiocc_glymur_resets[] =3D {
> +	[LPASS_AUDIO_SWR_RX_CGCR] =3D { 0xa0, 1 },
> +	[LPASS_AUDIO_SWR_WSA1_CGCR] =3D { 0xb0, 1 },
> +	[LPASS_AUDIO_SWR_WSA2_CGCR] =3D { 0xd8, 1 },
> +	[LPASS_AUDIO_SWR_WSA3_CGCR] =3D { 0x300c, 1 },
> +	[LPASS_AUDIO_SWR_WSA4_CGCR] =3D { 0x301c, 1 },
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
Will the reset operations for WSA3 and WSA4 fail here?

The target register offsets for WSA3 (0x300c) and WSA4 (0x301c) far exceed
the configured max_register limit of 0x1000.

When the WSA3 or WSA4 client driver attempts to initialize and uses the
reset controller API, the QCOM reset controller driver forwards the request
to the regmap subsystem. Since the target offsets are outside the
configured bound, won't the regmap bounds check fail and return -EIO,
preventing the SoundWire WSA3 and WSA4 controllers from initializing
correctly?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925084635.1123=
99-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8C56B84D;
	Wed, 23 Sep 2026 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191960; cv=none; b=tKEtTEKTCd2499dGC4JPkHxIuBKb9uE13FLb6sf4jGiLo04pvbTG4OX3twh7tqhMXA7ECkASmI7Wk5R07DRGF6yc4c2TQfI14c5r3OhQRaBY47vchFO4yQCwhbU9YC3mizJ1E9u6E8XtkgxpQNRt255Ryxj2DXlbuwm1u0CZ1js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191960; c=relaxed/simple;
	bh=JhNdPL+X7uge7QS+c2mY0s/gB/3HfBG4bMzBzw4v9+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BAWMJ6TA5iInhs3dhh01wS0y9JEHYJ/vDcaJI25wQB7natb6SLxFmoJoOl91KUpqNAN5sQcKI0zGnTya4j7JKhfhyozP/MEU7NV+0D3LuBnuBj/TzlKQvZb7SY6au5TikpNKEMbyDKOjWZvb3nuvy/o3EPdNv7xJSYFh0yc+j/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kMsHD9LG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kMsHD9LG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03411F00893;
	Wed, 23 Sep 2026 19:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790191957;
	bh=wHt8mpVVuG/4jDTOL+pB/tE1+yNTlh9v3xlGah0CZtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kMsHD9LGhh2kVv9LdsdfWLbfonYy+B5jpAMlqNnHA+m5cGeeHvAPCOvSIo6bXuyJB
	 WPhz5JsQMVdwQRfsYh4BVTAL2gBI8Eh5ecsE6JCbJOKXtnrQ/KWAor46d76U8chKKf
	 ZwNNTmlJvGxZEGoSgPajZczA1FK0puCCJ6tCqXBG0Q+oeHSvW4Vwvhg3geEb40AjEl
	 qJ/ALBEFIuVcIcJlua9eFMMnARkF6zkmtMNUMHJsBY8yYJ4erU4OIIR2ZVgagZD+hQ
	 vsatBTIg3AbrCrjPFAW+wSrZT4i2cpwc/lS2e/5nFJezkdqzpVKbj9YhLd5HjMLPw8
	 NfA698FIjGLBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock
 controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 19:32:36 +0000
Message-Id: <20260923193236.E03411F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: missing runtime PM enablement in DPRX CC probe
--

commit 6de521e23dcd665ee6611adb907119066bae1783
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: dprxcc: Add Nord DPRX clock controller support

This commit adds support for the DisplayPort Receiver (DPRX) clock controll=
ers
on Nord devices. Two identical instances, DPRX0 and DPRX1, are introduced to
provide core, audio, AHB, and video memory clocks.

> diff --git a/drivers/clk/qcom/dprxcc0-nord.c b/drivers/clk/qcom/dprxcc0-n=
ord.c
> new file mode 100644
> index 0000000000000..d17b9338f33bf
> --- /dev/null
> +++ b/drivers/clk/qcom/dprxcc0-nord.c

[ ... ]

> +static void dprx_cc_0_nord_regs_configure(struct device *dev, struct reg=
map *regmap)
> +{
> +	/*
> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
> +	 */
> +	regmap_write(regmap, dprx_0_dprx_cc_core_aud_div_clk_src.reg, 0x13);
> +	regmap_write(regmap, dprx_0_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
> +}

[Severity: High]
Will this direct register access trigger a synchronous external abort?=20

Since the probe function unconditionally calls qcom_cc_probe() which then
directly invokes this configuration callback, the registers are accessed
before the power domain is asserted. Accessing physical registers of a
peripheral clock controller without its power domain being ON can hang the
system at boot.

[ ... ]

> +static const struct qcom_cc_desc dprx_cc_0_nord_desc =3D {
> +	.config =3D &dprx_cc_0_nord_regmap_config,
> +	.clks =3D dprx_cc_0_nord_clocks,
> +	.num_clks =3D ARRAY_SIZE(dprx_cc_0_nord_clocks),
> +	.resets =3D dprx_cc_0_nord_resets,
> +	.num_resets =3D ARRAY_SIZE(dprx_cc_0_nord_resets),
> +	.driver_data =3D &dprx_cc_0_nord_driver_data,
> +};

[Severity: High]
Should this descriptor include .use_rpm =3D true?

Without it, the QCOM CC core does not automatically call
devm_pm_runtime_enable() and pm_runtime_resume_and_get() before invoking
the clk_regs_configure callback, which leads to the unpowered register
access above.

> diff --git a/drivers/clk/qcom/dprxcc1-nord.c b/drivers/clk/qcom/dprxcc1-n=
ord.c
> new file mode 100644
> index 0000000000000..851a97c196c0a
> --- /dev/null
> +++ b/drivers/clk/qcom/dprxcc1-nord.c

[ ... ]

> +static const struct qcom_cc_desc dprx_cc_1_nord_desc =3D {
> +	.config =3D &dprx_cc_1_nord_regmap_config,
> +	.clks =3D dprx_cc_1_nord_clocks,
> +	.num_clks =3D ARRAY_SIZE(dprx_cc_1_nord_clocks),
> +	.resets =3D dprx_cc_1_nord_resets,
> +	.num_resets =3D ARRAY_SIZE(dprx_cc_1_nord_resets),
> +	.driver_data =3D &dprx_cc_1_nord_driver_data,
> +};

[Severity: High]
Does this second instance also need .use_rpm =3D true added here to prevent
the same unpowered register access issue during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-nords_dprx=
-v2-0-fa4364e087ef@oss.qualcomm.com?part=3D3

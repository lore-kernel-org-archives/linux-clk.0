Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B752E266C;
	Wed,  9 Sep 2026 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935569; cv=none; b=eZy+ms/0vvRnPSMteg6HX74tpnjUF6yRNtJIDFilZAHXwhy2kQk53z+4dqWLljn2X6oAtAr9GshnPBaByaJp8LmkIOmQv7j7zbrRk2i5CukTHEpG1GxcwO7qYBZc6W9zdQxD9AelmSbDL5AXEEEvugfSu476c1W0WPk/qPiZgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935569; c=relaxed/simple;
	bh=Y6bT39hm1gUwDqYL0+q4Q/27z2LSsGtj/KlTeZMQuTc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ulpgHzdzV+E0f12XLFehlgyX1K3xARU+f1ZIlIrG+zzRXMLEarIMAFa9bUfANN5LgZWQQrQ61mcfaJ2MFIlzuz3Q/d5TGAbcN+ghKNDtXReqvNe+rgUANxBlU24qCM3ahFwoEtGKxq0OCGrAV32VyM9JJu4BPZKT+BYuRpxKE2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGGjdTOO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGGjdTOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0341F00A3A;
	Wed,  9 Sep 2026 06:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788935567;
	bh=9+8YRt7Mq6Jg8jXGUgjGpxX67W7suPmOLm+JQtApCrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZGGjdTOO61wbdeoX46fhCnW63wes4jpbkJS/CYBqlh7XMli2IaneQTIkv7z/GCamc
	 XAn3HP6wg1BO6uQphBPKDqWmDEDYN6YPUKpXBTO+3ev9EjwfQYJasgk1bVwW5PnoSQ
	 hXYKK1jF2hSUG3RR6zwDl7/ayO5l91mi9s8AAma+eNm0P4p4PuqHyn4nfHlIEIju1U
	 icajQ2qU2S1ws3bGqtrCcwmfFAiidL4UOQxy2e+WjmNpwEgbYWcigpExcNbDe+G2J0
	 NQsxkzllAjUdqwfQMjkSfUuUei7bvDLor2Bw31e/YfSETWARozUNnTIGL9o23hb/Be
	 jwedvgGOLNgmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 06:32:46 +0000
Message-Id: <20260909063247.2C0341F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing post-divider definition and mismatched clock parent mapp=
ing for `cam_cc_pll7_out_even`.
- [Low] Redundant and identical parent map and parent data definitions.
--

commit 94962e26b9035957a94cf2180f7c86517eb17167
Author: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

This commit adds support for the camera clock controller (CAMCC) on the
Qualcomm Hawi SoC. It introduces the clock definitions and routing
for camera operations, reusing the MCLK driver from Kaanapali.

> diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
> new file mode 100644
> index 0000000000000..5b004a627fdde
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-hawi.c

[ ... ]

> +static const struct parent_map cam_cc_parent_map_1[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
> +	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
> +	{ P_CAM_CC_PLL6_OUT_ODD, 4 },
> +	{ P_CAM_CC_PLL6_OUT_EVEN, 5 },
> +	{ P_CAM_CC_PLL6_OUT_MAIN, 6 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_1[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &cam_cc_pll0.clkr.hw },
> +	{ .hw =3D &cam_cc_pll0_out_even.clkr.hw },
> +	{ .hw =3D &cam_cc_pll0_out_odd.clkr.hw },
> +	{ .hw =3D &cam_cc_pll6_out_odd.clkr.hw },
> +	{ .hw =3D &cam_cc_pll6_out_even.clkr.hw },
> +	{ .hw =3D &cam_cc_pll6.clkr.hw },
> +};

[Severity: Low]
Are cam_cc_parent_map_1 and cam_cc_parent_data_1 intended to be completely
identical to the _0 variants defined just above this block?

This isn't a functional issue, but could we reuse the _0 map and data
structures to reduce code duplication and simplify the driver?

[ ... ]

> +static const struct parent_map cam_cc_parent_map_2[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
> +	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
> +	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
> +	{ P_CAM_CC_PLL7_OUT_EVEN, 5 },
> +	{ P_CAM_CC_PLL7_OUT_MAIN, 6 },
> +};
> +
> +static const struct clk_parent_data cam_cc_parent_data_2[] =3D {
> +	{ .index =3D DT_BI_TCXO },
> +	{ .hw =3D &cam_cc_pll0.clkr.hw },
> +	{ .hw =3D &cam_cc_pll0_out_even.clkr.hw },
> +	{ .hw =3D &cam_cc_pll0_out_odd.clkr.hw },
> +	{ .hw =3D &cam_cc_pll7.clkr.hw },
> +	{ .hw =3D &cam_cc_pll7.clkr.hw },
> +};

[Severity: Medium]
Does this misconfigure the clock parent mapping for cam_cc_pll7_out_even?

The parent map array specifies P_CAM_CC_PLL7_OUT_EVEN at index 5, but the
corresponding parent data array maps it to the undivided main PLL
(&cam_cc_pll7.clkr.hw) instead of a post-divider hw struct.

If the bootloader leaves the hardware mux at index 5, could this cause the
framework to miscalculate the frequency as the undivided main PLL rate
instead of the divided rate, leading to incorrect downstream clock rates?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-camcc-hawi=
-v2-0-f892ba1d118e@oss.qualcomm.com?part=3D2

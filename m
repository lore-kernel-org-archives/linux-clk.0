Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AF33D4131;
	Thu, 20 Aug 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221554; cv=none; b=p2AgyHtySmN16K0n4eHiUvwGn3e4gL2xgGeGHlc9o/+cx9vUqSyRTImubhvdDWGcRqlv8vki6M/dznz96GnP32GhSpwFKpG28w0OTHa95FaWsfssnmA2QLWBWeATrgHB4gWzTHGHOzxnJVca1ZVcdaBrQAz6on8bgweVKTVGgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221554; c=relaxed/simple;
	bh=BzBij93r1s3bCVzqgB/zlOt5+oSpH9H/Q0AQJLHsxME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AsYT98XwYYAn/vaZXJIaNx08ztwO0k7Awgfqpw3TMdErXY9TK44QyvEyyfDP7NBZ/oR3SLVvA4Yhgs08plDxO9ZvP2St/LU024y2njuoD62wte3Dr+2TWNBsIxpTJ0NQn9DjQVGo2G07z6GLpp7QTa/nMcyViD3K8U4o/fhVeO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP0hAFRy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP0hAFRy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6D61F000E9;
	Thu, 20 Aug 2026 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221553;
	bh=64KYDHDh/2Zb6zqsFZhy184/HgL6QVQU/vqhv+UN45Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WP0hAFRyPpaZNht2O/W4ld9KMBTxpKnExMXChQhuvb4L7T6TuXs7fzlpXmD9I8PKV
	 OVCZbxscdw2kroM3B4GiPfkgHoDmpZA2wy0CGB3CQkjhtTmarK8RlNNQ7Ilibq4TVR
	 FX8iIwvDF/hYn5RnBSlk9itV+QYQTMXadekCyVC/X0Blp0giEGPh0TAY52YtHi6BOI
	 3xcV/xT/NMb6tu444j4Lho3xtMZIPHVmZdZQCQIt5cgNKy1hGWJpflJgLDjNt3+X0d
	 3PbnXaSyFG/gh/QpQV16POF5xAbcoBd0SSuzuWAxfdtjJEWhshaxxveNLZ78wTpRUN
	 P0GRvStfprbeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/16] clk: qcom: gcc-sm8750: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-6-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-6-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:25:52 +0000
Message-Id: <20260820102552.DB6D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The reset controller operations lack runtime PM protection, allowi=
ng unpowered register accesses and potential system crashes.
--

--- Patch [6]: [PATCH v2 06/16] clk: qcom: gcc-sm8750: Tie the CX power dom=
ain to controller ---
commit 9120e413d73e4cfcd0de420eacf417424a6d9257
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8750: Tie the CX power domain to controller

This commit enables runtime PM for the controller, allowing the CX power
domain to be powered down once all GCC consumers have released their clocks
and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
> index 6cfe90122268a..a4a3ece74f401 100644
> --- a/drivers/clk/qcom/gcc-sm8750.c
> +++ b/drivers/clk/qcom/gcc-sm8750.c
> @@ -3195,6 +3195,7 @@ static const struct qcom_cc_desc gcc_sm8750_desc =
=3D {
>  	.resets =3D gcc_sm8750_resets,
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8750_resets),
>  	.gdscs =3D gcc_sm8750_gdscs,
> +	.use_rpm =3D true,

[Severity: High]
Does enabling runtime PM here expose the reset controller operations to
unpowered register accesses?

If a consumer driver (such as a PHY driver) asserts or deasserts a reset
provided by the GCC controller before it enables a clock, the GCC device
might be suspended and the CX power domain turned off.=20

Looking at drivers/clk/qcom/reset.c, qcom_reset_set_assert() performs
register access via regmap_update_bits() without acquiring a runtime PM
reference on the GCC device:

drivers/clk/qcom/reset.c:qcom_reset_set_assert() {
    ...
    return regmap_update_bits(rst->regmap, map->reg, map->bit, map->bit);
}

Can this sequence cause a synchronous external abort or kernel crash when
the hardware registers are accessed while the power domain is suspended?

>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8750_gdscs),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-qcom-tie-c=
x-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com?part=3D6

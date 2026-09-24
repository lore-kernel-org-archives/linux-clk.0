Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1515846A610;
	Thu, 24 Sep 2026 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248289; cv=none; b=tX8+b4HghHplJqDXEbyyne12iUlO5l4wSMQua6Vh3O/u/ZihVkdRq7W6xV3PQ2yeaEbxoYYQF0AwRnj01/MEfofoRVlnA7Fx16XdF3VW3N0PBZSugxvd1w1mXWWaXottpankPa/ZXFmHHCXTg/ZWWrm4rcNVA8gNrnbUDKLdjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248289; c=relaxed/simple;
	bh=J/mAnCCYPL26xRL4gZTeCCfBk3fjLT8Kzuf3AEcjklQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pkxq7oze4swSTeBkNjRSfV2zotSPoKKH2V5paM/meIIoFg3zxJo33x6xbCdgnky9jhe26BE0TKpXdQyC5Pv0+nvpApX0qWOPXLOiVk8dIy3TpFK2lBD91vvyVWzSFqaHoP6H+yZM0CpqF/rbuJevzzRHihrx4yPLe5AFM9ZJsjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NJs+ecS2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NJs+ecS2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511671F000FF;
	Thu, 24 Sep 2026 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790248286;
	bh=AuzRyDdGhCHdoLWa6mx/LeIKpTLjN3sOfCSD4VbWP9c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJs+ecS2/xWaSH24LaMmBswT86yEeCTKjSP+vRJFmTch1+z9Lgle3amPj1QeQ0EAV
	 /oqNuAQ1/NoDm0CMMCI+0oEeQDSG1+hSv1z1E8xMxVcecBcK2PH6YcQgij+jpoWi6O
	 f36sggb7mwWpUHUu0ZU+kIF9mHWYuySLsQLOwbvmuytD2842SvxcnXpJdiOONonQvQ
	 YuG6Y9Wv9WLVH7TvDiMh7FxzWAq4WIWxhseOe7MScZ9QRnl2AFO3B49AFVEQYzj9Vk
	 IRSLrIXlR7cIhEWhlRoMRTSDHup1Au/2J8hJCvSjzsLERri4uOABtgTK5lFCTQKFj4
	 5fN1zCRX9fc6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 23/42] clk: qcom: gcc-sm8450: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-23-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-23-38732033e5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:11:25 +0000
Message-Id: <20260924111126.511671F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: gcc-sm8450: manual register states lost on CX power down
--

commit 99d5496af370ec324c5f350b6121718a0028abd7
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm8450: Tie the CX power domain to controller

This commit enables runtime PM for the GCC controller by setting use_rpm to
true. This allows the CX power domain to be powered down once all consumers
have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -3400,6 +3400,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sm8450_resets),
>  	.gdscs =3D gcc_sm8450_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm8450_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Will this cause manually configured register states to be lost during the
first runtime suspend?

Setting use_rpm to true allows the CX power domain to power down when all
consumers release their resources, which resets the GCC hardware registers.

However, gcc_sm8450_probe() manually configures multiple always-on clocks
and UFS PHY settings directly via regmap operations, bypassing the Common
Clock Framework:

drivers/clk/qcom/gcc-sm8450.c:gcc_sm8450_probe() {
        ...
        regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(1=
4), BIT(14));
        ...
        qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
        qcom_branch_set_clk_en(regmap, 0x36020); /* GCC_CAMERA_XO_CLK */
        ...
}

Since the driver does not configure regmap caching and provides no runtime
resume callback, does this mean these configurations are permanently lost
after the controller resumes? Could this lead to synchronous external aborts
when the affected subsystems try to access their hardware after waking up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom-tie-c=
x-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com?part=3D23

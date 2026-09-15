Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066354BB27F;
	Tue, 15 Sep 2026 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494199; cv=none; b=St+PF/8cXoNGPfEv+P/JgGCEtCx3qzyaqXRPeu+VxydccO6qCwOXMQZoncceiIJSpd4Hxb5SHorgtY1rvNCsAexhlvoGQqSXMt3G79xT9yhhErMXy63IgVhWnT5Elnc2XGTJglP944s6alspLFNyYhFuXlezJn4ZaFlDBv+ahKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494199; c=relaxed/simple;
	bh=zia9GECvpdLvZ3mzwobKiJeTBkTRlmJg4bKACw+Psq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qYQ/DzK2aj6WHVRwZaTM1yo+ghr4Ys7zX/xX65y4ut/EZ6ZCahgcQAf3Pl/FbxmbFN7QubjCEnlvx2vH859L8gEnFSIpw5jGhgVbr3d8zZrD5f87a3X+3QQULlIMLm4TMkOo/zhxj92Q8/Q+N3AmIceIC+agYzA+1DN+rqPyQQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkrkKIEn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkrkKIEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AED71F000FF;
	Tue, 15 Sep 2026 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789494186;
	bh=VsDokPV50ErT5Vheq4AJNECMoX7O1jT6Qqh3xetxeSE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hkrkKIEnTrRYOdhacksUKQZc5yaT7EoZL2vwdGwv9dxz+1vRcL0RE2VNaY9k0Fb6R
	 3ccI9q88v19KyAOadkdBgDiEjYYEOtefC6MvqlhgApR/f1zBLvrExA3CbfEvv6iYK+
	 j5r563FlGco3nqmVaNfVjeI3LCa3gtcyEXXdc5gW6AlcH3fhmaPA1kBBxlG96Woh39
	 O7TGJ3e7eAW1YdbGkItQ5oulqGtOBhofeiwcp7XpYjMjflWJBJIKqmSFriYwb5VzZw
	 RC/iYkZpK2qrUH48vkh2pGjQfvGCaw/p4KxRSkDskpx5984gGhMgoYLk7OwcleNXkf
	 qk/bWuMEK45Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260915-camcc-hawi-v3-2-5b57f45477f1@oss.qualcomm.com>
References: <20260915-camcc-hawi-v3-0-5b57f45477f1@oss.qualcomm.com>
 <20260915-camcc-hawi-v3-2-5b57f45477f1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 17:43:05 +0000
Message-Id: <20260915174306.5AED71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: qcom: Missing cam_cc_pll7_out_even post-divider and incorre=
ct parent mapping
--

commit 08ea08a7c3d2dac0bf07afc4df1ed6bcbe2314f8
Author: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>

clk: qcom: Add support for the camera clock controller (CAMCC) on Hawi

The CAMCC block on the Qualcomm Hawi SoC provides the primary camera clocks.
This patch introduces the driver for the controller, reusing components for
the Camera BIST MCLK and defining clock topologies and PLL configurations.

> diff --git a/drivers/clk/qcom/camcc-hawi.c b/drivers/clk/qcom/camcc-hawi.c
> index 0000000000000..aa52b99aec003 100644
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-hawi.c
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
Is the driver missing the cam_cc_pll7_out_even post-divider definition?

In cam_cc_parent_map_2, P_CAM_CC_PLL7_OUT_EVEN corresponds to the 5th eleme=
nt
of the arrays. However, cam_cc_parent_data_2 points this entry to the
undivided cam_cc_pll7.clkr.hw output instead of a divided clock, duplicating
the 6th element meant for P_CAM_CC_PLL7_OUT_MAIN.

If P_CAM_CC_PLL7_OUT_EVEN is selected by a downstream peripheral, this
topology will result in providing the full PLL frequency instead of a divid=
ed
clock, which could impact downstream hardware stability.

Would it be appropriate to add the missing clk_alpha_pll_postdiv structure
for cam_cc_pll7_out_even and update the parent data here to point to it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-camcc-hawi=
-v3-0-5b57f45477f1@oss.qualcomm.com?part=3D2

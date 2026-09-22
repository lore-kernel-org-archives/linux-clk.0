Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B92C5625E9;
	Tue, 22 Sep 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091660; cv=none; b=BeRFIXkiH94Mrtw8nP4v5O19Mx9asQOnTor88GG/HvufzmA0LUVve0/UxIzsGbWWwH+Bwv+tHHN6494lbGQbQi92UJF2zmvvFpPTSVd3kC3MHBu2B4tgdXAWYtgod+ib7zS9JHGTTTxyqpw0ZDdg2pLciw+B6sN5VN8Nz8XzL8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091660; c=relaxed/simple;
	bh=m0fbVCOxiugwrBckVAF/K6YNup4PUcJeKr2bEHvNw2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m5CkU/VRV1qAbXzZD6+n1n6ZcDloALkmM1eFZXEaoZz82ptQFfJ7uDfH9Jn8NmAUAth9YGvansioGahGjRMJbEyl04H9VOZ8efVDz5RxXgnq5dds8+QStoM5e8df3IZQ9L0Y4kmLVZ2VZ0HNZGM4G7Ctq+FxwE4YsdggHgcuTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpuxQNtf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpuxQNtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AAA1F000FF;
	Tue, 22 Sep 2026 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091658;
	bh=cYa3PcUtsXRtFr9iwKvmb8cgoBhT1/Wl6n1xwqGNEvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SpuxQNtf1V+2195bdS0wtJMWON9kZY0Jb4dZF9RMHeSUVtBDV2bxd6z/VRh1PIfFf
	 jGpzGe16upzwlv6rCYpjGaCO7hCBKuitB8lPmKP40lSUbvv5/85ws6LW5iiaTglUPz
	 ZccxX8HQC+1cJYnxPcGlVyFkeIb3f1ddG/EaMVgk69ZneUmAgHWHcxwx2ZA2mstHba
	 ITiG+/mz4NAaP57xYQ/qvbLppzK9JRAwQQA13Kcj+pc5VLMDY2NTbwpsl9kL8dH18u
	 5cbQDEY4NRaDl/XLZ5VUwxuYIUltdEzF0nyGqxeoScrkaAu+EGDOnkFJimAlWpeyE9
	 rZUCAd9oO26jQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/8] clk: sunxi-ng: a733: Add bus clocks support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260921-a733-clk-v4-5-9c184ebe9ac1@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>
 <20260921-a733-clk-v4-5-9c184ebe9ac1@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 15:40:58 +0000
Message-Id: <20260922154058.A8AAA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: sunxi-ng: undefined SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT macro
--

commit b8d151f394e2b1110ebeb209884fb27f38da1c29
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: sunxi-ng: a733: Add bus clocks support

This commit adds the essential bus clocks in the Allwinner A733 CCU,
including AHB, APB0, APB1, APB_UART, and MBUS. The MBUS clock is marked as
critical and sets an update bit requirement.

> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 430a535919c65..00c61806c29b3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
[ ... ]
> +static const struct clk_parent_data mbus_parents[] =3D {
> +	{ .hw =3D &sys_24M_clk.hw },
> +	{ .hw =3D &pll_periph1_600M_clk.hw },
> +	{ .hw =3D &pll_ddr_clk.common.hw },
> +	{ .hw =3D &pll_periph1_480M_clk.common.hw },
> +	{ .hw =3D &pll_periph1_400M_clk.hw },
> +	{ .hw =3D &pll_npu_clk.common.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parent=
s, 0x588,
> +					   0, 5,	/* M */
> +					   24, 3,	/* mux */
> +					   BIT(31),	/* gate */
> +					   CLK_IS_CRITICAL,
> +					   CCU_FEATURE_UPDATE_BIT);

[Severity: Low]
Does this cause a compilation failure?

The macro SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT appears to be undefined in the
codebase. Building the kernel with this configuration enabled may result in
a syntax error because the macro expanding the mbus_clk definition is missi=
ng.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-a733-clk-v=
4-0-9c184ebe9ac1@pigmoral.tech?part=3D5

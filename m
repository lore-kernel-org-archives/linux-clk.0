Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5F9475320;
	Mon, 14 Sep 2026 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400125; cv=none; b=fAjJdxms1C0BjSsieP0qqWR9fmUGQPt8y4H4o+IkfozIAmCeVd4zekkb0FZjnTuX29d2LwpKw0kuhUsGR4a0YDY2Mu0NB4ifKOWTBzF6uWf1S03p9lCwVksPsFOC9fpqscOzRYXONEKVkqCoOIvjKpCYMDwOJ/urMUwckPaTs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400125; c=relaxed/simple;
	bh=uBYevhsnp56QzpiBJct8kRucIOOZ8iSRmTTIWB1PSiA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DRqJ3XaJLh8ycKjsmRJKXWmyUY18paejGtvEQE2FqQ/WGFazyCSCawtoQ5DXUITidNlpQSnIKPyYQGpfrBqPK9a7UEUAZct+FjjNLj/zYH9gzeCWfgS6syoDfKdVCnXyV5/p2z7bmQlEXbe3eBEdX3Frc5cO2AyCa6hsWfhIFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl61OCgK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl61OCgK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B156A1F000FF;
	Mon, 14 Sep 2026 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789400124;
	bh=MrRD2wAdnj8FWBFj/lWoLOL12GenSLs7VnEimKi9s/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fl61OCgKKDZewRRwjIlh22hfTALOZ5X8bfH2NMbztk8u/N+xc/SW+6M/uKOlCm2tH
	 +ACjDJltntMlRodS7ZxG0SYPscBmLKwNSF7Xf84Z0iWWui5mlaLI/KHGaUyPGB+Ed6
	 lHnhelDsRqvE63fYDAVue+H7B7Sypr5i36pjCXhFk/QOkXgRZq8ChDxQNEY5rYOMLj
	 Gp0x62dLAc6bBV/+pzLaADp8+9gB73txddX77UM8E0A8ud3NbHFrD/O8BhzQxvctnG
	 j3APelesTk2kW7COTLrHbndJB8za0/Z4CvveuYoKTzvR5N+0VfI15L0qEFPyxm+pjr
	 XqXi0IpbudKJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 25/52] clk: qcom: gcc-sdm845: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-25-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-25-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:35:23 +0000
Message-Id: <20260914153523.B156A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The GCC controller will never runtime suspend (and thus never po=
wer down the CX domain) because CLK_IS_CRITICAL clocks hold a permanent run=
time PM reference.
--

commit 276e3a012e0f4a45e79abff9518b1f5b28d649cd
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sdm845: Tie the CX power domain to controller

This commit enables runtime PM for the controller, allowing the CX power
domain to be powered down once all GCC consumers have released their clocks
and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index 57d54b45fa527..cde863dcf1851 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -3959,6 +3959,7 @@ static const struct qcom_cc_desc gcc_sdm845_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sdm845_resets),
>  	.gdscs =3D gcc_sdm845_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sdm845_gdscs),
> +	.use_rpm =3D true,

[Severity: Medium]
Will the GCC controller ever actually runtime suspend to power down the CX
domain with this change?

The driver has 13 clocks marked as CLK_IS_CRITICAL, for example:

static struct clk_branch gcc_camera_ahb_clk =3D {
	...
	.clkr =3D {
		...
		.hw.init =3D &(struct clk_init_data){
			.name =3D "gcc_camera_ahb_clk",
			.flags =3D CLK_IS_CRITICAL,
			...
		},
	},
};

When qcom_cc_really_probe() registers clocks with use_rpm =3D true, the com=
mon
clock framework's clk_pm_runtime_init() sets rpm_enabled =3D true.

For critical clocks, __clk_core_init() automatically calls clk_core_prepare=
().
This triggers clk_pm_runtime_get(), which calls pm_runtime_resume_and_get()
and increments the GCC controller's runtime PM usage counter.

Since critical clocks are never unprepared, these references are never
released. Because of this, it appears the controller's usage count will nev=
er
drop to zero and the CX domain will permanently remain active, defeating the
purpose of enabling runtime PM.

>  };
> =20
>  static const struct of_device_id gcc_sdm845_match_table[] =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D25

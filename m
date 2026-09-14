Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C03406270;
	Mon, 14 Sep 2026 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401364; cv=none; b=fRmjYwPo58XylMiFUtOVor71Uq3ptZ0O39iUh6hTe3sIXnN3ya6TSKr+CdtALJ+uhMBC8acudk/x+n4jaK18CmCsjkUFD1GE3CiVKeJYLeo0vyQhkoC2ZX+K/6jP4V3il3v0NC+7+y+KuiUUlCXE2QulH7WyFZBovM2B1m70a6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401364; c=relaxed/simple;
	bh=Y4TNVhAYangP3549KTGuSo/6+FaqndCB2hU8kOtJ00Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rY5ulmBUrWRiy584bTxOGlIfx6uIFOSJzECty+3QkhnABSCiLlvKC03xCHwbBeK5Wy43H2sGMscXzdd7/do1iyKZjmA7XXRAcCGqLuvjLuKNNmMe/HWACIXgq0plhQ9Vj6zCRS+/WkSD4jOnXl2JZi51qKGCx94sk/mdz8nHlsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzSco9AD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzSco9AD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D421F000FF;
	Mon, 14 Sep 2026 15:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789401363;
	bh=MPmgrSbJzhIplwlW+I0ojVIuHZYC7x/bArssUfWHFgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jzSco9ADE11mI/cBH4ROoBLoep5gHX4eNJhtvR1JwBU5RzhqFEdC2aZLXfa0l0Y6A
	 b0VH27hFoCBtI5TZ5s3wTe/cHr+fHpkEquBMYq8PE5e17qFtQRZOvuQPcaTjMdnaBS
	 ClrATDtjpP0THnYO2rfVggQpTYFurCm2/Dm5IpFuyp8Pk78YKX1NXWU3D2tbAndbfH
	 GJsHZ0KOpqvqoMBWqJG9J1SakgJCdCabgICGPe3qCBBIfJFNA6xd3+2ChZqkgm6b1e
	 f/et1yZcrJOsGPcKJd0zyP2DGbKR/8cyGx91uz7KeCSqGgMeUiJEZOZfh22Fto5trN
	 fEQyFsbGBoc1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 28/52] clk: qcom: gcc-sm6350: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-28-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-28-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:56:02 +0000
Message-Id: <20260914155602.E0D421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding `.use_rpm =3D true` to enable runtime PM for the GCC cont=
roller fails to allow the CX power domain to power down because 11 clocks m=
arked as `CLK_IS_CRITICAL` take permanent runtime PM references.
--

commit b5546fa5b994139f1238355f81a78cb4633ec734
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sm6350: Tie the CX power domain to controller

This commit enables runtime PM for the SM6350 GCC controller. The goal
is to allow the CX power domain to be powered down when all GCC consumers
have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2545,6 +2545,7 @@ static const struct qcom_cc_desc gcc_sm6350_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sm6350_resets),
>  	.gdscs =3D gcc_sm6350_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sm6350_gdscs),
> +	.use_rpm =3D true,

[Severity: Medium]
Does enabling runtime PM here actually allow the controller to suspend,
given that there are 11 clocks marked as CLK_IS_CRITICAL in this driver
(such as gcc_camera_ahb_clk)?

During qcom_cc_really_probe(), the clock framework registers these critical
clocks. For each one, __clk_core_init() calls clk_core_prepare(), which in
turn calls pm_runtime_resume_and_get(core->dev).

Because critical clocks are never unprepared, won't the GCC device's
runtime PM usage counter stay permanently elevated? It seems this would
prevent the controller from ever entering runtime suspend, effectively
defeating the goal of powering down the CX domain.

Additionally, if an error occurs during clock registration and the driver
cleans up, does clk_unregister() unprepare critical clocks, or would this
also permanently leak the PM usage counter?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D28

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018836AB57;
	Mon, 24 Aug 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575013; cv=none; b=etOKTN87SRUSBZ2HS/t9uSoRacEofyYMt1ACzQbcCDNju0V8rkTq6gFBbT/Ax7n7VEOGpj85i4P4pCzprJa/YwS5pCDXaDQD87opErTMGFML95j9KdAQNnrQvl6VcnqXVlsB+bZtms4HpQHYVisDFB3ESticp9zGADb6XHgSOm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575013; c=relaxed/simple;
	bh=esi+oRW0yoIriH69tUcjrS0+Cpd2SUCW4LCz6sugxg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ti8Ag3LKBte6omE27VtNNwLzlIrV9jJwtpyiKKo2C9ngVdnti8nj+iLwx1/mrdJDH7dj+CTJ6lLGlj3YmTlwblC9Ft7w90hzU/E8L6DtAZ87KM+YXQljjU/RQe/1tk9sENM9JvT3qjpk7KLb0tZA9G/hkErSabS1dCvc+gKHmoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYu3fAFC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYu3fAFC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4641F00A3F;
	Mon, 24 Aug 2026 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787575005;
	bh=9OdY4jugg3+pE5AkbSuXAirr/eh+QQs5iFrY6b1AYLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYu3fAFCD+77xaYMKlm5nTVi5DvloZwFuhY3hyRIF7xd9Ls5RaoIgbzIQY6t7FAjG
	 Hn2MKSPBmpepPjrJOS5br/U7jBs1trcXJj7cxox7rHi7cZl//iXA5vG9ScrbNTjyUE
	 bHU+v5OI7iD6cm93Kg0nQrpIZjgjjHefrFaEjOkMJV3p159rJA0z+9EdPjkWXXkHCl
	 UaAXdE+Dtld4BawN1vfIUHTUFDgfgzVe2ryec3KnlXlxqaSR8LqvFwRyTKJ0DWKry/
	 1X8NLQyM/5UKfT2pCwK0JbbnBBvTOfuFPQ21jtyENwhvIqe3opGrpxzzBDsjU+0o3r
	 7c0sKD4wJuMLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/47] clk: qcom: gcc-sc7280: Tie the CX power domain
 to controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-18-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-18-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:36:44 +0000
Message-Id: <20260824123645.5E4641F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Enabling runtime PM on the GCC controller (`use_rpm =3D true`) int=
roduces a crash during reset operations because `qcom_reset_ops` perform ra=
w regmap accesses without taking a runtime PM reference. Asserting a reset =
when the GCC device is suspended will access unpowered registers.
--

--- Patch [18]: [PATCH v3 18/47] clk: qcom: gcc-sc7280: Tie the CX power do=
main to controller ---
commit 759cca681f45c71a5a8669a98523e27fad8124b8
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

clk: qcom: gcc-sc7280: Tie the CX power domain to controller

Enable runtime PM for the controller, allowing CX to be powered down once a=
ll
GCC consumers have released their clocks and GDSCs.

> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 4502926a2691a..bb8f6efb88b1c 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -3446,6 +3446,7 @@ static const struct qcom_cc_desc gcc_sc7280_desc =
=3D {
>  	.num_resets =3D ARRAY_SIZE(gcc_sc7280_resets),
>  	.gdscs =3D gcc_sc7280_gdscs,
>  	.num_gdscs =3D ARRAY_SIZE(gcc_sc7280_gdscs),
> +	.use_rpm =3D true,

[Severity: High]
Does enabling runtime PM here introduce a potential crash during reset
operations?

Looking at drivers/clk/qcom/reset.c, the reset operations perform raw regmap
accesses without taking a runtime PM reference:

drivers/clk/qcom/reset.c:qcom_reset_set_assert() {
	...
	regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
	...
}

If a consumer asserts a reset while the GCC controller is suspended, could
this access unpowered registers and cause a synchronous external abort?

Since the regmap configuration lacks .pm_runtime =3D true and the reset code
does not wrap the regmap accesses with pm_runtime_resume_and_get(), this
might allow accessing the hardware while the CX domain is powered off.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D18

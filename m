Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914746EF90;
	Thu, 24 Sep 2026 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247781; cv=none; b=lFujaVOUyJ2H/3tnK3dsIBKuPchG0/qGcf5RIWQ2TyIYVZxeZSCShm9YdTU0R6LBumJpTNQoDSwYj87tcBzqU+MsUXboK64Zthk3x3Hqxlq72rbraWYid2/yUtO65q9TUVEm/pIxUyRQi4b0tI+JZUpuLXl9zxWj4is5kGNmaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247781; c=relaxed/simple;
	bh=+YhCwhZ2VDMOrlNAWnu9PvrZZI7mR72CEM4k32wkeUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n6s9JC3SDRwQyb9V4Cq4Qu++YnhvwbIscfZ9DYXITDTm1u8Pw+brl0yl4zyncx0B6+Y4OdNwqtrzJBULY+e2SXf85WJX7K8w5U2ga3VUKRiusXW/nmUturYWs3tNfus7NnCNFyVJKQlgMFSeQdyuZl7TcMYhZW7Lc8ctoN+y/uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlMx9pOZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlMx9pOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BCA1F000FF;
	Thu, 24 Sep 2026 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790247779;
	bh=7nCrvKVCW2vbCRQhQ+g0OWTQmJsBMat5hkmwMhVjRCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KlMx9pOZXOdE1MMLstooqRZf/ym43DyabtuQI68hBo6i431pIRIG6L3PPic356LeD
	 VaOxe9Qrr5KHfoPf+O6XYQHKJcGhZqJ0oJ5pchK+ePyPx4SzmeFB9gRJm9t9ulYGAI
	 7E73SOSw4dcjoZjasaymy/3cPIvOHZChnwDU5z8kYUVX2RH3cussnrSz+gW4RuKUOb
	 pcIMA0JMsmrJixs5W+INNAeRXSMtwj3WwjAy5o0q2Pn2PnlJSDGuW/ocHfVJswribY
	 B1DIet+NovcDVNl1llhYGJIvQCjBRHGsY1lI6JIHNNGKtopNCoW80GysVD9qyTPeyF
	 Mxa9bWeMTIPdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 34/42] arm64: dts: qcom: sm6350: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-34-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-34-38732033e5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:02:58 +0000
Message-Id: <20260924110259.19BCA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] PM regression: GCC device pins CX power domain ON permanently
--

commit ee5fe8d5caad7b14e28c23c20f2b192fd4ae6ab2
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm6350: Add GCC CX power domain

This commit adds the RPMh CX power domain reference to the GCC node on
SM6350. This allows votes from GCC GDSC consumers to propagate to the
RPMh CX domain.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index 15d38b7e803c5..ded5c3a45891b 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -794,6 +794,7 @@ gcc: clock-controller@100000 {
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;
> +			power-domains =3D <&rpmhpd SM6350_CX>;

[Severity: High]
Does adding the PM domain to the DT node without the corresponding driver
supporting runtime PM cause a power management regression here?

The genpd framework attaches the GCC device and unconditionally powers ON t=
he
CX domain during probe via genpd_dev_pm_attach(). In order for genpd to
subsequently power off the parent domain, all attached devices must be
suspended, which is evaluated via pm_runtime_suspended().

However, pm_runtime_suspended() requires runtime PM to be enabled. If
pm_runtime_enable() has never been called, the device disable_depth is > 0,
causing pm_runtime_suspended() to unconditionally return false.

Looking at gcc_sm6350_desc in drivers/clk/qcom/gcc-sm6350.c, it does not set
the use_rpm flag to true:

static const struct qcom_cc_desc gcc_sm6350_desc =3D {
	.config =3D &gcc_sm6350_regmap_config,
	.clks =3D gcc_sm6350_clocks,
	.num_clks =3D ARRAY_SIZE(gcc_sm6350_clocks),
	.resets =3D gcc_sm6350_resets,
	.num_resets =3D ARRAY_SIZE(gcc_sm6350_resets),
	.gdscs =3D gcc_sm6350_gdscs,
	.num_gdscs =3D ARRAY_SIZE(gcc_sm6350_gdscs),
};

Without use_rpm =3D true, devm_pm_runtime_enable() is never invoked for the
device. Does this leave the GCC device permanently considered active and the
CX domain irrevocably pinned ON?

>  			clock-names =3D "bi_tcxo",
>  				      "bi_tcxo_ao",
>  				      "sleep_clk";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom-tie-c=
x-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com?part=3D34

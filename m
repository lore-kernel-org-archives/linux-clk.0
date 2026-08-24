Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757E341A922;
	Mon, 24 Aug 2026 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574251; cv=none; b=EI4jkTXeUcvs8Jhk4Xd2A0roqpeO5DzjLjibpuRj1WHZ83K/7tHSB1M9r/lEEV1I7iu4sSKLQyuDVBArU+qssryAFW1GYwxrwrgdCBHsAYezjmIawSO1/BDU6uz3n328WKZf0bVeNs91C09UaDLMynCOaUpTI25GS2BD28i90Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574251; c=relaxed/simple;
	bh=CdrI6hJ0Giy4GOXQ+u7cXwal8JcLOTnhnCkGJYL9C5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mHH0CiIepGEQjv/IPQ0wm8Y+ZfkoJ09tG/rah7A0KwTm0Gyu55I6z/NqNJClRbxw6nN5GmoewoQfmIId4XZQcplwp3Eg1URWpMGruWCPVoZXETRfLXw8TH+bymdj0ap6kP15/qo2T2uF8PK2gV0YUqgK5BBwmeN+iMc0i4OsP7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLre/JKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLre/JKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36B11F000E9;
	Mon, 24 Aug 2026 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574250;
	bh=kYGPO7WjDYIl7l7YjeqtnprfwxpoNsZHgbfpoa81fdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NLre/JKYtFsiZtKTc8JUYGiPZsSvmWT3Sta6H4Xu+cwEeUtR/sX1OUG4m6hOpQw/D
	 Hxnl5Oo28NTs+rC3tyN9dLaQoQktHJm9W2OB8L0yto3MDy7QtAKO62qFGrwcTlNO3Y
	 LLhmLSOR3+Ka9+YanYAruLUDqYjY66OdAE4iL/1/PspDowV1+X06NUozvXlW0+SwIJ
	 3UDO4ESS+MRuBDHQIMHKd235mxggpHqsSzxvV4ItnpLTLc0nSFBPUTIpqW4Nyc/bjH
	 fPX8QKfTPUFHnyUoizKdp8Otm/LClUZlfjaCBA4xymy7o8HGaCOIi5Pm4/adTfOA27
	 WR6LhtXUFyy9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 33/47] arm64: dts: qcom: monaco: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-33-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-33-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:24:09 +0000
Message-Id: <20260824122409.C36B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `power-domains` property is added to the `gcc` node in `monaco.=
dtsi`, but the corresponding Device Tree binding schema (`Documentation/dev=
icetree/bindings/clock/qcom,qcs8300-gcc.yaml`) was not updated to permit th=
is property.
--

--- Patch [33]: [PATCH v3 33/47] arm64: dts: qcom: monaco: Add GCC CX power=
 domain ---
commit c01d37fc2cc8cfc1732e168d2e3f85648e0aed4c
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: arm64: dts: qcom: monaco: Add GCC CX power domain

This commit adds the CX power-domain reference to the GCC node in
qcom/monaco.dtsi. This ensures that votes from GCC GDSC consumers can
propagate to RPMh CX.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index cfe39f923224f..0786ab4c5f0dc 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -898,6 +898,7 @@ gcc: clock-controller@100000 {
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Is the power-domains property allowed by the Device Tree binding schema
for this node?

It appears Documentation/devicetree/bindings/clock/qcom,qcs8300-gcc.yaml
was not updated to permit this property, which could cause validation errors
during make dtbs_check.

Follow-up patches in this series updated bindings for other SoCs (like SM85=
50
and QCS615) to explicitly include power-domains, but it looks like QCS8300
was omitted.

>  			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>  				 <&sleep_clk>,
>  				 <&pcie0_phy>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D33

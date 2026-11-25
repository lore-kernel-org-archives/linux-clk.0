Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610714;
	b=zRMDzgsyg7rSz+yFNIxmpi8bCwgnZr8GwXSW7bRp12KL+O4bNytEzmItBgddF78GpDSi
	 977jfWoeoZt9y2kbUGNQSuKnUY0M8rxhkg5OB2u3Afw5bG35au60zUbvFUy92H7KlI3Dl
	 zodJRsnAtuhwrpSzzFgUFipgtK2+GO1iEnP4eJ+m48kFdDJ6q1uCJhcPbbXxFJxjTWve4
	 7dptURGVXhz/5Y8mYy1qQOj2cUWh+MvRi/Hf7uv95eJXQYRSAhSd+xyDUx/SjFme+e2eS
	 FJ3k7e0ODTjgNqehTX3A4AyxvHj1ojIpfBhmh2BXMAFFC2evtTIhxkNaC24TzVbMQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610714;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3ga8A8bCAaG0fEkyR9LlC1kT5MXqeDKnjMTUxEdwucc=;
	b=m+7amjshrOHr8G+dQohWI/9KE40ofpKqRvze12t+RcqdOa1Ed8Ts7QeTGMwwh0/HNdH+
	 +1zu9Iaqw5awzPkU6Yp8mLmkoyNM07Mar3RPK9aeyoEyygrsRfyYd9OSY/chHbu535kfA
	 RbKvNdrAjOJEbBNVGeIqbi073moa9YDYVy1dmW14nriI6x4C+SaOufvoU1DN77PMJ8Oj/
	 5GJc6kZgUVwaniCwPit3Tx9Lbnfa2UPH27GsNB5i4eCJK9VRDu+cRqOZAPzjk9IRYhgeA
	 +IDYqamQy/duq3Z0YQkhjM/WHfCyEEdNcRP/iVZlJGqvmYj9ANn2luMgu4lbqN4j/wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBVyd6UN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AD9606A321;
	Wed, 25 Nov 2026 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RBVyd6UN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324061F000C4;
	Wed, 25 Nov 2026 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610714;
	bh=3ga8A8bCAaG0fEkyR9LlC1kT5MXqeDKnjMTUxEdwucc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RBVyd6UNX3CVXvg15PcO1dElyEC/Pma1ri+jqwbZbsyICXeOyNpn7ZaNkPdoO5Qm7
	 +EmceohLEsIqOdEU+Kn10avZnBue9pgwwnMiUKm8rp0/gWN+bCmZSRgT6izH08QfRl
	 90emI/moGVq1ZqSjZsMxxz8MkhjDDf5oYT7lWLYxr2VWsZSr90MQatkFqRAIB+kyjt
	 naF0DFoyssEi+ft/Xn3WYNLX6rjzCNCqC3Li2wOG0mUmLRI4uzs+AieWADIAUxug4w
	 s7HL+NdW+pyPSeZ+061KzsEPmfQjxlg9/LZQEfZ+nt2fJVTwaeRybWdwmccCKIJVrJ
	 L+gVlvWilvh8A==
Message-ID: <sashiko-outbox-233390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable
 front and rear cameras
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261125123146.379057-8-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
 <20261125123146.379057-8-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:45:13 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: vdd_l23-supply misplaced under rpm_requests
  node
--

commit 9c828a33819e4a6ac5765fc16f77ad7ad2d08a5c
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

This commit enables CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision
OV12A10 rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> index fccb9c4360cae..87db6b18d1914 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts

[ ... ]

> @@ -154,6 +256,7 @@ &pmi8950_wled {
>  };
> =20
>  &rpm_requests {
> +	vdd_l23-supply =3D <&pm8953_s3>;
>  	regulators {
>  		compatible =3D "qcom,rpm-pm8953-regulators";
> =20

[Severity: Medium]
Should vdd_l23-supply be placed inside the regulators child node rather
than directly under &rpm_requests?

rpm_regulator_init_vreg() registers each regulator under the
qcom,rpm-pm8953-regulators device, and of_get_regulator() only looks up
parent supply properties on the regulator node and its parent device node
(regulators).  With vdd_l23-supply on the grandparent &rpm_requests node,
pm8953_l23 (used as dvdd-supply by camera@2d) falls back to the dummy
regulator instead of propagating enable votes to pm8953_s3, and the
property also violates the qcom,smd-rpm.yaml binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125123146.3790=
57-1-hikmahgumelar@gmail.com?part=3D7

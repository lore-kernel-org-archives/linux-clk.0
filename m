Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDF6414A34;
	Mon, 24 Aug 2026 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574660; cv=none; b=VPi3tCQMQTv08q/vx6eoyr2LTQW1W6+sX0dE5cVkn2m6LJ8svh5u/XOBq6r88Ry/Kd6FKRpl54yIox4whPSuy2DGfb8FF9/domM7V4HC+Pb1Oix0A02FbiVCT9mwYktE/CvaqK6WFnsQOsYQBzCaJUK0UUpv/ICFHyeM3sqL6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574660; c=relaxed/simple;
	bh=/t956YREvi6l1+EC5J83mdIBd+VKFZIUveimwxilras=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nHV+ft4bRsDqZnRl8Nn8+Sh9rsazUTfeqKKF0tdvRkAXSVMhNHQjBLclmKRRPF/t92a6XzC0P1txR/444Zmxix05TybJNscrWnSWaRsSYOihW1K/g1bHbYiVLjAJK7QfAAvdXcVRLaYxnZK+OLmmvGROt/Vkfr7F8fn72g0rVnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezJGhFiF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezJGhFiF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71081F000E9;
	Mon, 24 Aug 2026 12:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574657;
	bh=fDoJWeTCQqctnvHI1vokd1HHPUUSVKq57c+kCOeQsVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezJGhFiF25T5BvbEO8czWY8e/xQpIfbL6jrvL/RlPb90lsdSav5CF2fO5nRefcpkn
	 DBb8beKsgeGHN9i9oj1Z37LVkl2d8Sv0FSAZS1cZtfqVoYd8zz6/xLqSTC1A9efYhI
	 vurjfizgXP2fZyNXtQ48JQjahd/AQGuCHEROjJ20oeZKE8wZjJoLrukXIXOw8vESYV
	 1MJ/yksOIpPD8z1ktF4c32xAK4FLCG1no5sQ9mR19dtT3a93zGDQyBMFCTS9C9Sy1d
	 ZTMOs0Bx6hKYFGTJRamubcDo/I+y+DJ0rUr0d+KsZQpCQRPR7lqFjOai7e7PQ9K8OR
	 bbtsaX+49FklA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 39/47] arm64: dts: qcom: sm6350: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-39-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-39-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:30:56 +0000
Message-Id: <20260824123056.B71081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Adding the `power-domains` property to the `gcc` node without updat=
ing its DT binding schema will trigger a dtbs_check warning.
--

--- Patch [39]: [PATCH v3 39/47] arm64: dts: qcom: sm6350: Add GCC CX power=
 domain ---
commit e7cbb98ab7c0a2a7495045fc51188886857246b1
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm6350: Add GCC CX power domain

The GCC GDSCs on SM6350 are backed by the RPMh CX power domain. This commit
adds the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

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

[Severity: Low]
Will adding this property without updating the device tree binding schema
trigger a dtbs_check warning?

The schema in Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
uses unevaluatedProperties: false but lacks the definition for power-domain=
s,
which typically causes dtbs_check to flag newly added properties as an erro=
r.

>  			clock-names =3D "bi_tcxo",
>  				      "bi_tcxo_ao",
>  				      "sleep_clk";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D39

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F271F8723;
	Thu, 20 Aug 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221312; cv=none; b=fQ2ZMO1614Aibp+sel+RWn7DHHCE1EmjNdVamGAAX7y+CiVjS1HN94ojZ8HMvLSkkuJND+WLao5zPj0YmbjdlwcUvjoMyfZWkjuHaAUmtei0ff3xVTrJV7ECJ0DIvg5Jo3RBIrCmTzpqnSab4EjW+1PC9Uf/vKXbt+KeiO9KiGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221312; c=relaxed/simple;
	bh=MUlacH3dHQic7oo82M/frPISnBQNdDt4LjGQNExlsCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pmnyyi331K6cMr0+03Rala50PQu9EiT6ui4mQm48lV507SQn7FBs9f5cR5u7Ce7JLFkGn331tjTX4c5G2K3hFk+DEpFHZKE1/SrNba+faXd9ev4bU4NnA02t1GgEz0cQU5wEcuNbHM0G1vnO5VfC+oIymQ0y+vrgzH061V7/xYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCqotWfc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCqotWfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFF71F000E9;
	Thu, 20 Aug 2026 10:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221311;
	bh=mIcJAM9H3iwUAJTaEcXp+DhLmsrLAgTz9wdVOSdozaQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PCqotWfckWTShzh1/rGCJCwrxou6tIdevAwLen1/MT9/+reU11fFssVUpT86/9G+e
	 7tt1oh2nXPmIY8P15PrFWVrc4Yz3y9+zo1YfxJfqBYuwzz6k7k0WFv8DBJBaXQOXv4
	 oqKmQl4y++xHS4kgrVuRY2X1jnM7n7MYa6YClcNtL2kRWf+GdG3lOpHDK9tKKbkvzV
	 OypDHi7A5/k4YQmw6zIgNKHuAh4fJPlSOITB2UoBkgd06JeEU1wGrmstgIbH6A1/eL
	 1CYqj1A/F2WTrGxnpwB71m04iuqMUso1qvNzo7nszIQwAjgKM2qL2bynQgrcdOMtla
	 pnXs0HersOqVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/16] arm64: dts: qcom: sm8650: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-13-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-13-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:21:50 +0000
Message-Id: <20260820102150.EFFF71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `power-domains` property is added to the SM8650 GCC device tree=
 node without updating the corresponding binding schema, which will cause v=
alidation failures.
--

--- Patch [13]: [PATCH v2 13/16] arm64: dts: qcom: sm8650: Add GCC CX power=
 domain ---
commit 2cea18fb279f0e36930dd295a87712e624b1a701
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Add GCC CX power domain

This commit adds the RPMh CX power domain reference to the GCC node on
SM8650. This ensures that the required CX vote is held when consumers
enable their local GCC-provided GDSCs.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index b679fd8afb7d5..962797c15abf5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy 2>,
>  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Will this new property cause dtbs_check validation failures?

Looking at Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml, the
schema enforces unevaluatedProperties: false. Does the binding schema also
need to be updated alongside this change to explicitly define and permit
the power-domains property for this node?

> +
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-qcom-tie-c=
x-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com?part=3D13

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B6048D86E;
	Mon, 14 Sep 2026 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407592; cv=none; b=Elj56+YLsfxccPGg1uRP/9BljUWG8UztQXOLYTZyjLf2AogAa7WbCmMjXFCjm5OSWh48ONCVUnIusnoRvPUdLN8WOlkoFyKUlsvInv7DHtEUemfK+mEVOr3cMeh07sM0ZZLOBuQSnv/luhHVcyClJ79Vu5J8U87rsumg/5uOMDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407592; c=relaxed/simple;
	bh=tNg17BOxVpkoJpR31ohmaZ8j5/6sfIseLFklZ3x4dBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VST0pmlGJ563ePXjwAodqweMM05Tq262by687/WWsftjzt2h7Vc3rEgKZTJGX8XW4/XDmeqvRGUGZPNlDuxciNgTVaA+Vi4qZfqJIAGzwVE3r2o99MrwBA36sVULCaV3ygzHXZKkYUhdSyT5x/F9zXtM3rKoP0tFalz3sYykBl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLVGxYil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLVGxYil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CD11F00893;
	Mon, 14 Sep 2026 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789407590;
	bh=iYiTXJK7wNWUpf2GSyFq/G/BUgh/HLCN2HZwoDzn3iQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BLVGxYilCNCdLtkstGctvqH/RV/mkzTgSNPdvP+4L4gXVXkmOCxqJR6P+fCx64Ax9
	 hBwW2ap3r2OiT79yltPc0BjaSsU/O9g+CBQuBT9AuAWYm6Wb2xjHrCFQC2qUoTpdkL
	 SzVxZGS57OKzrQ6FIjlcWfRPOHZ0/M3LaaT1pB05Bu2iLRJR+RIZS5sPQW9UeRmE9v
	 EGynjEnFiiDjpMV8lmUeYXLdS/VRUi+MOwp30Zd04mRm5zfMOilTQSExxomBe3iNXq
	 aH1UtssiWteGL2aKrZNcjWOJj+quPUbuPxQSMPEhmSf5TF/SOh0sC05RPeZVdTltow
	 bdh5aQEByBQwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 45/52] arm64: dts: qcom: sm8150: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-45-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
 <20260914-qcom-tie-cx-to-gcc-v4-45-9d5a606ada33@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 17:39:49 +0000
Message-Id: <20260914173949.E6CD11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect Power Domain Mapping for SDHC controller in sm8150.dtsi
--

commit 1237bb3ae1765094917da1bf7fa592fe294eff27
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Add GCC CX power domain

This commit adds the CX power-domain reference to the GCC node for the
SM8150 platform. This ensures that GCC GDSC consumers properly propagate
their performance state votes to the RPMh CX domain.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 94a3b02cb2897..397c0142ea579 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
[ ... ]
> @@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
>  				      "sleep_clk";
>  			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>  				 <&sleep_clk>;
> +			power-domains =3D <&rpmhpd SM8150_CX>;
>  		};

While reviewing power domain mappings in this file, I noticed a potential
issue further down in the sdhc_2 node:

arch/arm64/boot/dts/qcom/sm8150.dtsi:sdhc_2 {
    ...
			power-domains =3D <&rpmhpd 0>;
    ...
}

[Severity: High]
This is a pre-existing issue, but does this incorrectly map the SDHC
controller to power domain index 0?

Index 0 corresponds to SM8150_MSS (Modem Subsystem) instead of SM8150_CX. W=
hen
the mmc driver is initialized or accessed, it requests higher clock
frequencies and scales up the attached power domain via dev_pm_opp_set_rate=
().
If mapped to index 0, it will request voltage changes on the Modem Subsystem
rather than the CX domain.

Could this leave the CX domain undervolted for the SDHC controller's clock
frequencies, potentially leading to hardware instability or data corruption
during SD card access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-qcom-tie-c=
x-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com?part=3D45

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C08830D41F;
	Thu, 24 Sep 2026 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247683; cv=none; b=J9SGKWeD2JIM0wgKeIQXIR1BACSGhebD1PK47Aq2s+7rhHkXmuDGEjhYXoCtPY/rE3rMkw4P71zgfC8FUXh+OnIsFW1GT5S7CgSgXWuvcrwKdZkHQzxcqc0Hr7XZ8xQKLxk0aZCY5SKLP/5CC/rlywHVhaPFVeuhQSr7TrVgDAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247683; c=relaxed/simple;
	bh=5ZIYCG1bsF9s5uSqF2JOB8U0aXIxTkU1iWjD7fQsu3c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vl4pASEawbd/fpfxIQBrGsedJkKBuiYaTK91vI2NKaLQVUNqzNhHnTLX3WWWb62rc9zBkoq6AkpdJMdn5rlYSyL6Z5D/Z3t++C46Y6OL6y9KkrT4ReKwgRV97TJ5qhfynqUoMyA1gGYKN5pNCtfKIS6r/iVOSln5b9cEuB0MgvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM8PxYh0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM8PxYh0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66B21F000FF;
	Thu, 24 Sep 2026 11:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790247682;
	bh=k0Oj9iyQ1YLZpkwAErjENfvKwVM3Wg1ZzbIMtwR2SWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nM8PxYh0PMZ4VNL5LEbE7PV6QvoQbmSjQ9+vuTCSXSl0xN4YcdSsSYJEVIGjhMCZN
	 GFZsJtvI3tXjNADaQ2ct9cIhuGzJ6paqerENcl2A+++uEyuxw1k3ZL2kK+zImM8ylv
	 XwAp1wo2DaEfE3dwR3hd2Luwkied45mLnXLOmmIcjy72+EoeZgbib7AP35VctySah1
	 xT+yVVCX5LK4yDfDhw00iFhL7QMyRBCCsXSLq70Ju/2HQYif9FiuTnCF5G4E1QFWhK
	 xF1fcg6Q7SCMA6r4KGW/NehqzQgym5ZxjpnNs22kz1d5kwQ7eVgeM+u+UIXzkgIqoE
	 OX8aZueqAX1iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 35/42] arm64: dts: qcom: sm8150: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-35-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
 <20260924-qcom-tie-cx-to-gcc-v5-35-38732033e5b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:01:21 +0000
Message-Id: <20260924110121.C66B21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: qcom: sm8150: missing runtime PM support pins CX power domain=
 ON
--

commit acb1efde8c25f0a90d262048322b01fb3721956e
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8150: Add GCC CX power domain

This commit adds the CX power domain reference to the GCC node in the sm8150
device tree. This allows GCC GDSC consumers to propagate their votes to the
RPMh CX domain.

> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 94a3b02cb2897..397c0142ea579 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -913,6 +913,7 @@ gcc: clock-controller@100000 {
>  				      "sleep_clk";
>  			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>  				 <&sleep_clk>;
> +			power-domains =3D <&rpmhpd SM8150_CX>;

[Severity: High]
Does adding this property pin the CX power domain ON indefinitely?

Looking at the gcc-sm8150.c driver, it seems .use_rpm is not set to true in
gcc_sm8150_desc. Because of this, qcom_cc_really_probe() skips calling
devm_pm_runtime_enable() for this device.

When platform_probe() attaches the GCC device to the CX domain, it uses
PD_FLAG_ATTACH_POWER_ON, which powers the domain ON. However, since runtime
PM is never enabled on the GCC device, its disable_depth remains 1, causing
pm_runtime_suspended() to always return false.

Since the genpd core evaluates if all attached devices are suspended before
powering off the domain, it seems genpd_power_off() will never power off the
CX domain here. This regression could prevent the SoC from entering deep
sleep states (power collapse) and cause battery drain.

Does gcc-sm8150.c need .use_rpm =3D true added to gcc_sm8150_desc so the
device can suspend and the domain can be powered off?=20

(Note: this same behavior appears to affect sm8250 as its driver also lacks
.use_rpm =3D true).

>  		};
> =20
>  		gpi_dma0: dma-controller@800000 {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-qcom-tie-c=
x-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com?part=3D35

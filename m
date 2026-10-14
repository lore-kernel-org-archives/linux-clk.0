Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D322EA173;
	Wed, 14 Oct 2026 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981594; cv=none; b=u/VQhhoZGh61cIMuInHG8ejN1z53PmNfHUdEk7DzW/kqgYVF8LPl1p2vAiUkDbuBYIAyrFLpcUZ8VgwEIpio347I2hwc6Js0v28qESOjoWYK3C4oXUNCBmWxcp1JxhzpCwvFBvYje1Yv4C3XHzSSjEOYFoP7d/o0BO/nXeY9fh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981594; c=relaxed/simple;
	bh=khwcg+LEKwCIgVdyD9WMwz76mcfqOK1JGQZm8D6zOlc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VhIkqkb4Ri6JimcoPZVHBr9b1oNFibEljzh21BKX2tQtR6BgStr+jWcL+RO1OT6jnhRgLrJBzU/pM8bkCfpjLy37UM6hsQQ0TC8PjMamqCrcRGp38PEQghZ7Yxnj+V44sPrFw6NdBXJSSsV87+ESzCNF0j7K9ijLKGSROBsE+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZblyUAJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZblyUAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEF31F00893;
	Wed, 14 Oct 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981593;
	bh=HOuzxEZXnFhqIBuqUsE73TnGGMxG8dgqcUGSA5oa9YE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jZblyUAJWIkWIJMqRH4o50vCza3jLR8wosVSphhhIta4EpGvAhjDIgEjqzzQuHJTX
	 6pwYZ6mCFlunYOhTO+L8LQNGdAOJx/mKIC4yXiYs7B670bdrY4jzurqqoDW+e0Iq8J
	 47ZRzUFVEjwj1TN10AwQnSfKjYeBgxjyQVvT3J8FK19eOdj2cMHYoqQd+CymoZQdw5
	 aGlNXqtwT2TP8tTQgk8d2AthmasSWrOS5ZogeUXdaOWxw+6xr7p17cR4nKXVA3cnyX
	 GSJci2Dib6Dt68XzO2gzrCxC3i0OJgQ8+3vvnzTbIFUNMp/xjYTvyh1THHyBO5nSYN
	 iDbc364CBVvAQ==
Message-ID: <sashiko-outbox-171293@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:39:52 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: pcie: power domain starvation for Gen3/Gen4
--

commit 467d81619c5b5922cc360aaaf647dd4b6a900f09
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Drop required-opps

This commit drops the required-opps properties from various OPP tables in
the SM8650 device tree. It assumes that clock controllers now take care of
their power requirements.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 0847cfb35954e..47d7be98128e2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
[ ... ]
> @@ -3749,7 +3745,6 @@ opp-10000000-2 {
>  				/* 8 GT/s x1 */
>  				opp-8000000-3 {
>  					opp-hz =3D /bits/ 64 <8000000>;
> -					required-opps =3D <&rpmhpd_opp_nom>;

[Severity: High]
Does dropping this required-opps break the static PM domain vote for PCIe
Gen3 and Gen4?

The qcom,pcie driver uses pseudo-frequencies (like 8000000 for Gen3) in the
OPP table to represent link speeds rather than actual clock frequencies. Wh=
en
the OPP framework processes this, it attempts to set the rate of the first
clock listed for the device (GCC_PCIE_0_AUX_CLK or GCC_PCIE_1_AUX_CLK).

However, in drivers/clk/qcom/gcc-sm8650.c, gcc_pcie_0_aux_clk_src_dvfs is
fixed at 19.2MHz and only maps to LOW_SVS:

drivers/clk/qcom/gcc-sm8650.c:
static const struct qcom_clk_dvfs_data gcc_pcie_0_aux_clk_src_dvfs =3D {
	.pd_indices =3D (const unsigned int[]) { DT_PMDOMAIN_CX, DT_PMDOMAIN_MX },
	.num_pd_indices =3D 2,
	.rates =3D (const struct qcom_clk_dvfs_rate[]) {
		{ 19200000, RPMH_REGULATOR_LEVEL_LOW_SVS },
	},
	.num_rates =3D 1,
};

Without the direct power domain vote, the PCIe controller will run at LOW_S=
VS
voltage instead of the NOM voltage required by Gen3 and higher. Could this
lead to power domain starvation, causing link training failures or bus hangs
when accessing an under-powered PHY on boards booting with a PCIe Gen3 or
Gen4 device?

>  					opp-peak-kBps =3D <984500 1>;
>  					opp-level =3D <3>;
>  				};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D15

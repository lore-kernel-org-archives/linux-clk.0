Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2841B4E73A1;
	Wed, 14 Oct 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981697; cv=none; b=EHA3r2IJM1ua83PlkYOSk0dmWAL1kYsTzO03ydSW6jWxbT7YyaGkmF1SmaJCuhgm2zIQAO0+y7zGblSS9DTtBfwLrPFY5xC4CMfrYZ7ZV+qZV1SFjtJWuOKoU11SOc+a++9PWAhnUJr0xmWcPxRV2CibI9CCCo43GeF/kRxpoNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981697; c=relaxed/simple;
	bh=wFxFgT9BqsxPCRIxIYgrEnnUq53CRiwcp4kQFVeZ8mI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NaJCQIKcx7LZZ6PomSGNs6ebat39K3ZCwuWVX5flMcWTaD4CrEm19hpFCKAdl52CPRNWkEAzwX3aYoEMLN1+z9HlvV5Y0JB91G9Si7E7qU1rX+LqNg5L70KRLYIPn872c9QehfKmYF17ElIqiX1KejoXUftPzlKGl9LswCGZ3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZAQf79p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZAQf79p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CE61F00893;
	Wed, 14 Oct 2026 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791981695;
	bh=x0RtK65SDbl+6SlXf4YuuIu8/Gpdjsf90zRxo5iJLus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OZAQf79pIPaHgYwAYFrumHBfvm4eo0HqnM/woBpOHXhWMoH7K15eUO2fRiy6mbaV+
	 BUnmFNbaWdV95wlYTRvsKotYTU607RlcxTpMg7eZn7YXuPwIHhOaIK91g/nS9k8UTI
	 7jlReTE5ePfv7DVC5orHqFxkVSpOJKkEIW5tnSuExkO0q9JjN9AC4dzF34s7ckLyt2
	 sHvSIrG12fNNYuvpAjtihwlK4iqKCzX50nIpI4R34DJC74h2zONWB7CG3eo3xxndVC
	 TBRJ3BQIxMJ7wIuLAQ+uY66rj1Wm1XhJF4v7+T6j/4kr5jBhvUv2jePgqMIhZzkYIh
	 95o5wvKvhVxlQ==
Message-ID: <sashiko-outbox-171295@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:41:34 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: clock: qcom: multiple power-domains exceed schema limi=
ts
--

commit 0272a7914d28ecdc80c317abd5c3a4cf467f9ae8
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Describe clock controller power rails

The SM8650 clock-controller nodes omit rails needed by their clocks and
PLLs. This commit describes the required power rails for these controllers
to prevent probe failures.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 86fbb0fd6472d..0847cfb35954e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2017,8 +2017,9 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy 1>,
>  				 <&ufs_mem_phy 2>,
>  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> -
> -			power-domains =3D <&rpmhpd RPMHPD_CX>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_CX_AO>,
> +					<&rpmhpd RPMHPD_MX>;

[Severity: Low]
Does this exceed the dt-binding limits? For instance, qcom,sm8650-gcc.yaml
restricts power-domains to 1 item, but this provides 3. This will cause
make dtbs_check to fail unless the yaml binding is updated.

> @@ -4364,6 +4365,10 @@ gpucc: clock-controller@3d90000 {
>  			clocks =3D <&bi_tcxo_div2>,
>  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +			power-domains =3D <&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_CX>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_GFX>;

[Severity: Low]
Will this trigger a validation failure for gpucc? The qcom,sm8450-gpucc.yaml
binding limits power-domains to exactly 2 items, but 4 are being provided
here.

[ ... ]

> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
>  				 <0>, /* dp3 */
>  				 <0>;
> =20
> -			power-domains =3D <&rpmhpd RPMHPD_MMCX>;
> -			required-opps =3D <&rpmhpd_opp_low_svs>;
> +			power-domains =3D <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MX>;

[Severity: Low]
Is this compatible with the qcom,sm8550-dispcc.yaml schema? The schema
has a maxItems constraint of 1 for power-domains, but 2 are provided here,
which will result in a dtbs_check error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-topic-qc_c=
lk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com?part=3D13

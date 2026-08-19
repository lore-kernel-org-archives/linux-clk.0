Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E89846A;
	Wed, 19 Aug 2026 13:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144889; cv=none; b=TdAIu4nBSqt31rcLbLkDIH7XQzWS4U7sl5Yl2+b9uu8FdHTRw5FPestuYcoyAx8Uu5yGQ7rcOHg0Zuw+Q+BTQXCCv3lsGdzsfLybLHr7k3+4fLkBREXrpRYenbtneOOQ4Z41NDINHO3iLHBKzIfNpg1QUsV4d1TzVoZnCCAQCig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144889; c=relaxed/simple;
	bh=PyNfvHFn/M9ajG6DQJ8ZxaY6SQnZDNb2RBsy351zY3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a0PoPxHukQTKYu8DzFOzv08ONHs2tP7v8TAYBx7GNTDLOhmPlAuDo4UXHSvIE2z9NjjFCy8oW1VnrVHcU64QcBY1x85fQEjmub/KJeN3I4VzQuMTunDd9SvYJRMjk2nYk90j8DaumA9hTlfXcCIy28ePFDYgNpL6BahPMV5wDNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EshJmarH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EshJmarH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574041F000E9;
	Wed, 19 Aug 2026 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787144888;
	bh=jtenPZ0EOzJ5858bCkiS5ys07+2TxLed/Bo4YQhsgZ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EshJmarH/npzVrn7YwR3FHqBC9nYECPloP/5gSzDz5VJh5Bv10F5KhaTl3caHiTrr
	 mEadvZps/JN2aRP0DBmXg4fAOHXiOwRyhGgiwee+VcKWaySPpuhdyQyViHiAq+UYg1
	 oylGN6T88NrJK9RLbPD0tmbyDPVKaN2N3kayIojJ1LAv+Ov/IECvE8xlPTOLBvxZEn
	 mhE+NsBWrCIyBjnMiEPDqV4AxrieFURY8W7Mmg1a+xGqkL/1wIHkTSgufylb36fRb6
	 vKjFQF67iHeI4QkwozeCEYxJW76MSyVHptWvvdzp5M7vjgcHGgdvrAlvrheDZrQKT/
	 mWda1UlIPpm1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/16] arm64: dts: qcom: sm8250: Add GCC CX power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-9-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-9-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:08:08 +0000
Message-Id: <20260819130808.574041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing DT binding update for `power-domains` property.
--

--- Patch [9]: [PATCH 09/16] arm64: dts: qcom: sm8250: Add GCC CX power dom=
ain ---
commit 8ff2c27fe501198384b866811eea4d47f3a33812
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Add GCC CX power domain

This commit adds a reference to the RPMh CX power domain for the GCC clock
controller on SM8250. This ensures that GCC GDSC consumers correctly hold
the required CX vote when enabling their local domain.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/q=
com/sm8250.dtsi
> index 90f8b091634e9..50790cf1c3ca1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -971,6 +971,7 @@ gcc: clock-controller@100000 {
>  			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Does adding this property to the device tree without also updating the
dt-binding schema for qcom,gcc-sm8250 cause a validation warning during
make dtbs_check?

If the schema restricts additional properties, the tools typically flag
this new power-domains property as an unevaluated property.

>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-qcom-tie-c=
x-to-gcc-v1-0-840034124e73@oss.qualcomm.com?part=3D9

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CB938D014;
	Thu, 20 Aug 2026 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221353; cv=none; b=kO2G2YbFIkH9Fv5ObHgBbHCRXvm6oPyQ+595yPjZhPOooGUTXjh3jEIF1fG1lYL+cfK6MGWKIqaJB8PmDIpLfwIAjvTyAx7MmQp4WtYcqX+4/vTyV+wo7JkDXYynAokWafWXYkjf/F9GWa6hMvlO6M6UX009JWTyJSQAtY3g4A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221353; c=relaxed/simple;
	bh=EW1HBp/LifBUIWKds7tdQD4TfyydejnRHBa0fEoOp60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mr7IxM2eX9N72TXuVQ4qVfuf/jjbdrz5Ud30QhXRGJ/4C2LMkZAjX81GZqVm9b/qsaHKp5V44ix68realTknQy3Q926UPveNol/GuIhhTqtkGATXuGNcXqjwJJMdiOwUPq1GqIWoh0ij4zlIk1WbqTZkzWpwenkZYAMacVH4pJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2bT1Ac7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2bT1Ac7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F711F000E9;
	Thu, 20 Aug 2026 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221352;
	bh=i9zTmSulhBtFrt/HYLF8Jx702Gu5vbntwXO230n1onY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X2bT1Ac72wt5s60i0pDv6ePDVNJIlwwDyQYqj2qAsqeC+24QR0X5HiAv3vNNyJzlb
	 wgO863V4yUCax3e+daZw7QVPDieAKPAdQH5ECwVtj2MATb1yleVjBt5UocNFcbLWXn
	 k0ynAUoaFEBIsvDoh039Rbp9iBR/NjJRm8tkn4ndaqiVMlv8leP7d033YJKQB77Hio
	 B8I683GZUEd80lPkynYuPqYBXgj8PO+Y67FwyGmrWpqnBofW+cqNuDEZO/HBpZgqSa
	 WBHq3x3io+uAKHCk+7HNXpO4mqeCMgxRD5zKOYst5ldpoXYKiwazlBhJ5A1imvX1zt
	 cWRISS3bpdMIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: talos: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-16-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-16-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:22:31 +0000
Message-Id: <20260820102231.C7F711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `power-domains` property is added to the QCS615 GCC device tree=
 node, but the corresponding YAML dt-binding schema was not updated to allo=
w it.
--

--- Patch [16]: [PATCH v2 16/16] arm64: dts: qcom: talos: Add GCC CX power =
domain ---
commit 43d59202f59a2d72d12953fe62914471fdc7347f
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: talos: Add GCC CX power domain

This commit adds the RPMh CX power domain reference to the GCC node in
talos.dtsi. This ensures that GCC GDSC consumer votes can propagate
correctly to the required CX power domain.

> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qc=
om/talos.dtsi
> index eedfdce3c479e..06ca54acf565f 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
[ ... ]
> @@ -706,6 +706,8 @@ gcc: clock-controller@100000 {
>  				      "bi_tcxo_ao",
>  				      "sleep_clk";
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Will this new property cause device tree schema validation (make dtbs_check)
to fail?

It looks like the power-domains property is being added here, but the
corresponding dt-binding schema (qcom,qcs615-gcc.yaml) might not have been
updated to allow it. Since the schema typically specifies
unevaluatedProperties: false, adding this property to the dtsi file
without a companion dt-binding update usually introduces a schema violation.

Should there be a companion patch updating the dt-binding YAML?

> +
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-qcom-tie-c=
x-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com?part=3D16

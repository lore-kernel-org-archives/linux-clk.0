Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB840D58B;
	Thu, 20 Aug 2026 10:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221254; cv=none; b=lz4I7BW4H9yorBLtDgWJ9QXXc8L6/ACgzQzX4R0uymHWfcfpmCPcotM3CMvAKALEMePGd2LgmbxRVYdDI/a2fBFJ5s71tzwf4LzMyybS32olGjwYaKZWDheJYHpgzrHRNzY/mqsBhjPfB1BWi5HfHDYa1rZB9YmYzrm2YNjP8r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221254; c=relaxed/simple;
	bh=0Ho1nMw4ZA9hjbEzrd368+mw8vI4/PxX7zTzgLgISPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kvrMvRXNrykF/1RcdK3z+S6cSy5r8aDb5zFQ9pXCO3NYFKHkYzEyMBjSifDHRPAbas8Lw3v/j6MuX6svQvZhMFHo5u/u7morAk2f5yprZ7TWrZGbpsn8k1NrcyDrNoHnmgQpquMsbKQJPrRwZfjA5cacTWMYm+ab/zRd9eF45oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBtdA8tr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBtdA8tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08011F000E9;
	Thu, 20 Aug 2026 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787221250;
	bh=GsdbA6Fb1S+dQxhqefcUq2Yp7nWP04SEO+NCahXIFbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBtdA8trrlmyIb184IaCOCRMVMIxTeDZvlg37rQOkKy0flIcQ6k6icnyMANfgf58u
	 RPesunGV0mFakkwLGBkyPL2dkR9yyLzRoVLxOha0a43IIETBW+de1lkxULaOPi9J5/
	 X4bsEEB1/cK26d1EFILc9wpM6qcVKi8OPG4dgBwMQh+ETKzHIWJn9vKhrSqcHpUlyL
	 0NYNwhw6ApVTOMKo+ZkvAkzF7dYOIzV5QzBv2tGzOzN8/tMVyOB4sG/9h1RCmQM1HQ
	 FASWhfnZfvbu3vU2BaqMq1EbIa8TXOtm3kTtmD9SWhupDuXi7jV+KzvY47HfrzjVHO
	 zZiXu9XqUzb/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/16] arm64: dts: qcom: sm8250: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-9-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-9-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 10:20:49 +0000
Message-Id: <20260820102049.D08011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] DT Binding Violation: The `power-domains` property is added to the =
`gcc` node but is not documented in the corresponding `qcom,gcc-sm8250.yaml=
` DT binding schema.
--

--- Patch [9]: [PATCH v2 09/16] arm64: dts: qcom: sm8250: Add GCC CX power =
domain ---
commit 734b5cf106da5d46876e8b4bb05d32739432959a
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8250: Add GCC CX power domain

This commit adds the RPMh CX power domain reference to the GCC node in the
SM8250 device tree. This ensures that votes from GCC GDSC consumers properly
propagate to the RPMh CX domain.

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
Will running make dtbs_check produce a validation warning for this new
property?

Looking at Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml, the
binding enforces unevaluatedProperties: false but does not explicitly decla=
re
power-domains.

Should the binding schema be updated alongside this change to allow
power-domains so we avoid build validation failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-qcom-tie-c=
x-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com?part=3D9

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6A2346A15;
	Wed, 19 Aug 2026 13:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144718; cv=none; b=K4nEGEdrVHvNp5trZmMhrv3nGL/xQvhrPDRI6pDjUWJ0fCw9Kg/t3XYwybBVNtSz68354QLBIYplc80Ozekxmkgf0yAmQvK8jUy0U6BpT3CQMooZbABKPDVNM4bLB0AfcJ7Jz0JzJD/YWNzM9dVeTeraggoT1yrv+IkxQeKZlQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144718; c=relaxed/simple;
	bh=D0fyqewI4wuBqUmCo3IfCJWSirUatsMIeqm4KGZEQ98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uls74E2rCQngt+PLRdgg5nfh9UM2qC6y6uECCImZgdgJ4rZRdgRIVbW+DJl+jCRYqeA2RRviB25cDEST7xkIlfpx/H5Zb1ufdJqCcItFzaXEMvMV4up1gWWtHHY8MzQVlwGt1DHAVZQUYkjdvLxmRS+1WJxx/8jKXTSqnNEKyEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpa6BhHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpa6BhHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4841F000E9;
	Wed, 19 Aug 2026 13:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787144717;
	bh=u+4ckv/0i0mqjCui4VZ/PAc4UKlKHp7UmJRXwGk9V6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpa6BhHBDZa1+YBbqJNAYfqPhTzIbYZNZLthw/pTso8CYSlZ7LO6xoW73N7PViMPa
	 ksueMrX5lYGOJxYJ0cNVwpT+ifk5cwtkJLcdwpc6Sx2W+mWHbH8fU/rjt8OSaLzd+I
	 cT6SBX91CgG8ibN6a1VEctXlXUboV5tzabIcYSUIUjQcjmmWCuvYAbyKY/1ZGCm3KI
	 8HapmlpeiFDe6eSszACxT8MF6Yl1D/h7c8PgGXFjhqIosyGkPSL2Kve0YybR/0TWQB
	 TTOPzST8etJbBi7QjGFrpOhCYYjuSzGB6XxJYuJGgpTAhCwjHdLjFBHTW6i/Z/pviz
	 nz9aY9OOtn0HA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:05:16 +0000
Message-Id: <20260819130517.0E4841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `power-domains` property is added to the SM8350 GCC device tree=
 node, but it is not declared in the corresponding device tree binding sche=
ma (`qcom,gcc-sm8350.yaml`).
--

--- Patch [10]: [PATCH 10/16] arm64: dts: qcom: sm8350: Add GCC CX power do=
main ---
commit 114b5cd0dea1a6813cd14b2f585ff85d4973d4c9
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8350: Add GCC CX power domain

This commit adds the RPMh CX power domain as a reference in the SM8350
GCC node. This ensures that consumer votes for GCC-provided GDSCs properly
propagate to the RPMh CX power domain.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy 2>,
>  				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
>  				 <0>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Does this property addition also need a corresponding update to the device
tree binding schema in qcom,gcc-sm8350.yaml? Since power-domains is not
currently declared in that schema, will this cause a validation error when
running make dtbs_check?

>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-qcom-tie-c=
x-to-gcc-v1-0-840034124e73@oss.qualcomm.com?part=3D10

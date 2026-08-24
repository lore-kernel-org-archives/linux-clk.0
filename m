Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4563940912B;
	Mon, 24 Aug 2026 12:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573619; cv=none; b=oxZW8H0fI8p/zllI4388+Sz6oF5tmX6ctBFQfrrE5sFFsvQ86AJmJk3RwLF3Is6aQKo2NqrPMJBEHrhykeUZCdorZ7mJ4WJVc/ePdCKsKYjjlZCzt50WBasSYZbR2VZC39ZmRq2D//x9ls/RAfY9+e+QpVl285LUOVqS4jeXUNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573619; c=relaxed/simple;
	bh=+nQY2fdAx3LowGFWewNWtEMTpNl+ebN0edFUelEYllg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/n8m56ViyfBMynlZGuIZ8RC6gm3OzIeBorJxUarmkBg5FNejI3EyCh+8lCXB9+TjU6UJOCEdIP5VpfVQyNx973qHavncKsNHOwA0vJPo81R308j8BCQsMXpRkWEERoe6/oYj061Dy9pFRl9+UpJ9g9rwYvLZzCFKTL6/Sg1DIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sq4X/EF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sq4X/EF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D001F000E9;
	Mon, 24 Aug 2026 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787573618;
	bh=6bAUMSOLPKgVTdMtxAkd2tJ+BViQFZZcFxbT/fYDkeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sq4X/EF8myagEjRQV7SHrKfaDlSQQ1Z1ZsT33t5pYi0h3jv8CR2OWeI5+CIPMtFMd
	 LfkIOu6uxC3e8WldP3zHb/WagTqRXy7SMTGRhfI9cIsATjsjRueY5zUyz+HGuWF0sH
	 mxSU7PFOcLYpIjEJG1J4JQtAl3D3EZ4bOkI3f7V2H16ZRh/LMkl93ztNAEtfe2Gmo/
	 mNA2mg1DsBMsn1nADOMxJKma9sWppV+tF55m+Z3rH6Nrhyhz4jpfS3R8QjamePOfKf
	 q9b3fZlZcX9V+zvBQQujbt5hC5wBIZCyQ/ISSuB+VCuUDPV3eWoxsXRtXgPWJQmf4W
	 7usUrD9RJk+UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/47] dt-bindings: clock: qcom: gcc-sm8450: Add CX
 power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-5-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-5-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:13:37 +0000
Message-Id: <20260824121337.A7D001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect header inclusion in the device tree binding example.
--

--- Patch [5]: [PATCH v3 05/47] dt-bindings: clock: qcom: gcc-sm8450: Add C=
X power domain ---
commit c1e862ec1e73b4d84d9b6b88d3c32be76ca192d0
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: clock: qcom: gcc-sm8450: Add CX power domain

This patch updates the SM8450 GCC device tree binding to model the=20
dependency on the RPMh CX power domain. It adds the required power-domain
property and updates the example to demonstrate its use.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
> index 3169ac05e1d8a..f6f73db268965 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
[ ... ]
> @@ -61,11 +67,13 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>

[Severity: Low]
Should this example include <dt-bindings/power/qcom,rpmhpd.h> instead?

Since SM8450 is a modern SoC using RPMh, it might be more appropriate to
directly include the correct RPMh power domain header rather than relying on
the legacy qcom-rpmpd.h header to transitively resolve the RPMHPD_CX macro.

>      clock-controller@100000 {
>        compatible =3D "qcom,gcc-sm8450";
>        reg =3D <0x00100000 0x001f4200>;
>        clocks =3D <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
>        clock-names =3D "bi_tcxo", "sleep_clk";
> +      power-domains =3D <&rpmhpd RPMHPD_CX>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D5

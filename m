Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F221CC5A;
	Wed, 19 Aug 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144991; cv=none; b=T76F2KWn3wGTTHH8hBcHcB1pSky+KtF17pLWm64epf68pidvZfhOO92cXDYLB3sbzrz77oXf3yIJXn4RyepWLlPgVh+onSLBCtGf0lDRBjJCJlmX/Fl2wgXtOqqg3YBbHal/tdgsQ5t/Rbtb3i8LHGCmyWsgltcthys/HrJhnOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144991; c=relaxed/simple;
	bh=CCQ9dWTzF1AlLDCozQokjAEYbztArHMgALLpYJNRbcY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=knjooP2c2SqsKUVCZfplSw7Bs3DrRhRkCn5XcmDDMHcmeUdesXFsqDON7mEe/CEKKCz77aQPY1XxN8M+2pgXWWHDFAYPcteBjntBxjonop6oWq2mwJsEEx7A4aYktwZ0u11ccvKxXItnv+RevAHnwFFb4DxUlBTFwFZlYcvSFcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVyMFUNE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVyMFUNE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C80D1F000E9;
	Wed, 19 Aug 2026 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787144989;
	bh=Ep5ki+Lq4Glgx0EBhhDSwPV4IXq+D01t9IQOigvX1dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VVyMFUNEBWpr1RkIV30sLSX+7GtLKA6zv6DAZOZ8TfxnDxy/JRRxWccoMKtXLvojx
	 XcmJCNoUG10v6BOhx85TK3/9FxHkuRtgTMucDkbPOrwoWMpmfxzkwE5BI7DILUMz9v
	 jtryYy5J7TvLQDTEHdHOqSbeylA6z7MtbLfiPrEC8/VlCE/FyiTnChGaPjhrJdf2gP
	 wDrRqOgZNINHRS/ZgNOeL8QCFJybyVpFKbQkB2T87LaoaI2/4EY7XEzhh9MeVukVxC
	 QRPt/WxDNCBZhpDreV0gg1gNokYSMoL8Ls/e0gJOLwYutXIxeE47ef2TGYnET9QT4U
	 TAwViKifUNi4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:09:48 +0000
Message-Id: <20260819130949.5C80D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The DT schema for SM8650 GCC does not define the 'power-domains' pr=
operty, resulting in a dtbs_check validation failure.
--

--- Patch [13]: [PATCH 13/16] arm64: dts: qcom: sm8650: Add GCC CX power do=
main ---
commit 9a61032f8e0b737e1a6fc6895f1ca5a328c9b7d3
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sm8650: Add GCC CX power domain

This commit adds the RPMh CX power-domain reference to the SM8650 GCC
clock-controller node. This ensures consumers of GCC-provided GDSCs correct=
ly
trigger the required CX vote when enabling their local domains.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index b679fd8afb7d5..962797c15abf5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2019,6 +2019,8 @@ gcc: clock-controller@100000 {
[ ... ]
>  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
> =20
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Does this new property require a corresponding update to the DT schema?

Looking at Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml,
it uses unevaluatedProperties: false but does not define the power-domains
property. Will adding this property to the device tree without updating the
bindings schema cause a validation failure during make dtbs_check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-qcom-tie-c=
x-to-gcc-v1-0-840034124e73@oss.qualcomm.com?part=3D13

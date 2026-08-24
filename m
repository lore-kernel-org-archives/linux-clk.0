Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726F40F75A;
	Mon, 24 Aug 2026 12:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574502; cv=none; b=MbwZOIwVv9iH8njb8F/ZKA6xXcFODJ12J1mrbCbAutpsX+ngWmvtdCoUO4YMEElSt+6CCTZvdd77GLDyGJPg1x8ZmvbvU9MqqUPp+eUqzdMdPkLXMZbaStD4z9Fzk0JyDQnI9huQM5aeCPsCo6EEtiVm6CK5lmNxfxn5b4eT2Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574502; c=relaxed/simple;
	bh=DpkbJzqYN6+Oi0Qsu2Kc0QgbGV+0QbcF7yzdcS7rOQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pjMLPyXgni4HC3PhuCDlseWBTkYNZKDc4lnkY1G+B7q0/LLnPiGE0ywdWyCuHZ8dhZYBusro2+GYvRLBvXBZV5uZ5HKwdsHedlb7WJ+jqBbrDRdSo6L8xrWfkOVF7KXu3tHDKwim6YpHMSVoAVDAhBADgXdicmMQxB3LSYuVgWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQOloJmz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQOloJmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390441F00A3D;
	Mon, 24 Aug 2026 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787574499;
	bh=oCnuFgwXGSX4rpuyTRQq3RbtZSs0QOHke/H0Jf1nxR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fQOloJmz3fkaImU3iHyGY5ALOeHikfV2TpiqirYtD4JSfUvNk9XMQD/6EBfBf/MJR
	 KvdjY2mPIHWbzI13JRKmSyH1VgTBZRJOtynOLAFcOKu0DI6GEKk2naUNhIy4Ji+WnP
	 IedZO0MI1GXQKz0Cq7qcuK8n8gX5xgsQxC1Ne5KZaoTALIl8OrJWQtoGBF0X8PYjk0
	 7xLzjtwfKJ6ycYhHeviJnTIkNapNhunxgQ9QcL+nVBesp05tU2gf0wFvUBjDZVZBE2
	 ugSEZZGNgi2fD3QttH3QKUUDbWnVEhWMBPQ5IfW3bT2VXwMYmp/Nr+D1eJ3d61buL/
	 UOcPwIvBuGIVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 37/47] arm64: dts: qcom: sdx75: Add GCC CX power
 domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-37-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-37-f1205a92682b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 12:28:18 +0000
Message-Id: <20260824122819.390441F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `power-domains` property is added to the GCC device tree node, =
but it is not documented in the corresponding `qcom,sdx75-gcc.yaml` device =
tree binding schema.
--

--- Patch [37]: [PATCH v3 37/47] arm64: dts: qcom: sdx75: Add GCC CX power =
domain ---
commit 31a230bc14fd1ed4b8fc915db1a0015701f6c99b
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

arm64: dts: qcom: sdx75: Add GCC CX power domain

This commit adds a reference to the RPMh CX power domain in the SDX75 GCC
node. This allows consumers of GCC-provided GDSCs to propagate their local
domain votes to the required CX state.

> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qc=
om/sdx75.dtsi
> index 85cc9c6e6f83f..d4ef90c4a8db2 100644
> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
> @@ -487,6 +487,7 @@ gcc: clock-controller@80000 {
>  			#clock-cells =3D <1>;
>  			#reset-cells =3D <1>;
>  			#power-domain-cells =3D <1>;
> +			power-domains =3D <&rpmhpd RPMHPD_CX>;

[Severity: Low]
Will adding this property cause a dtbs_check validation regression?

The Documentation/devicetree/bindings/clock/qcom,sdx75-gcc.yaml schema
does not appear to document the power-domains property, and it enforces
unevaluatedProperties: false.

Does the schema need to be updated alongside this change to prevent
validation errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-qcom-tie-c=
x-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com?part=3D37

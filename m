Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2484537B02A;
	Fri, 18 Sep 2026 17:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789751941; cv=none; b=lVmnsJNFjDmPUctwR0UZh4pqACIrHw8vADMrB/nwDt+dfRPwRv6gM/bksLzmpiXRWgCzIDkNbFHo+DjCPGFjuswB5e+sGMR9NFa1OoVkZLSUodVzmE2AKk9xY0hJDnjhxQdIhOnydi+vvb0nYyWvbzpnfBoPABZsZXUagaJS+Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789751941; c=relaxed/simple;
	bh=OqHAN/euy0HW+GX0HjuBS+Shrj4C/5ABXtcqvJzx0OE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kfr3iDw/M7bMIshmUlTSLHkPKmqiTq7m98H0pRLXmb4a5fErp/0GCeZSUftDOaYLLcBVhqe6uVZspJhPrmGY4yQo4i50iW+EZ9CNCINUH0E27NonB8rDl2e6O9MMIVJM6MCYYECHkrRbWqFLAav24DjHia2hVw7OofLTl+lYff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USA1zlmR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USA1zlmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D651F000FF;
	Fri, 18 Sep 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789751939;
	bh=CxrmaOUAgSj63JLjqx7FxLyxC1oz+2oJOdqwL5YSEfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=USA1zlmRnFYDDg7UqtHUAkvyxcFYEgRkIlk+GgNXEJu6f90LTD7ZfFQxOjQfA6TwB
	 eBSkT9ZAazHaO3baV9v9dZgo60sWgG5/vmguFGlfOKr2aZaieDfhEdEXbMyTBhalF2
	 rL13nwj4AsBj5ZQUr1IsGvEbJo9M1CvHZiQ9/spHMcQa11TmFncXY0Nav8DzDBXKeT
	 YIvK8IJtb695pAHCJpSMPTAipkgh/lEeCrXhxhvj2a02yQv44UoRDh/QuFMh3MCOuB
	 AsopV4BEFmw4vZIMoHXeOPVSCuZ+5EtxEPeZpWt1qxx/e9ZjtneOwwl4MzXLfq9qGO
	 YwV/1ue3y3+IA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] arm64: renesas: r8a78000: Add FCPV[BI] nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Elder" <paul.elder+renesas@ideasonboard.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-4-dbe9236bfd22@ideasonboard.com>
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
 <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-4-dbe9236bfd22@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 17:18:58 +0000
Message-Id: <20260918171859.59D651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: FCP nodes use out-of-bounds MDLC module indices
- [Low] dts: FCP nodes use unrelated DisplayPort TX clock to bypass validat=
ion
--

commit aebdc4ecfb076110896cfa98b567ebc34c287a87
Author: Paul Elder <paul.elder+renesas@ideasonboard.com>

arm64: renesas: r8a78000: Add FCPV[BI] nodes

Add DT nodes for the FCPVB and FCPVI IP cores in the R-Car X5H SoC.

> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/=
dts/renesas/r8a78000.dtsi
> index 9a07753b22154..2f8886f8b6545 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1000,6 +1000,78 @@ mdlc_aon: system-controller@c1338000 {
>  			bootph-all;
>  		};
> =20
> +		fcpvi0: fcp@c5030000 {
> +			compatible =3D "renesas,fcpv";
> +			reg =3D <0 0xc5030000 0 0x1000>;
> +			clocks =3D <&cpg R8A78000_CPG_SGD4_VIO_DP_TX>;

[Severity: Low]
Is it expected to assign the unrelated DisplayPort TX clock here, and in the
other added FCP nodes?

The rcar-fcp driver ignores this property at runtime because the actual clo=
ck is
implicitly acquired via SCMI through the MDLC power domain.

Should the generic renesas,fcp.yaml binding be amended to make the clock
property optional for SoCs where the PM domain handles it implicitly,
instead of providing an unrelated clock to bypass validation?

> +			power-domains =3D <&mdlc_vio 0x07 0x107>;
> +			resets =3D <&mdlc_vio 0x107>;

[Severity: Low]
Do these power-domains and resets use out-of-bounds MDLC module indices?

The dt binding documentation in renesas,r8a78000-mdlc.yaml explicitly speci=
fies
a range of 0x00-0xff for module standby and reset indices. However, the new=
ly
added fcpvi0 node uses 0x107.

Does the binding documentation need to be updated to account for the extend=
ed
hardware register space?

> +		};
> +
[ ... ]
> +		fcpvb0: fcp@c5038000 {
> +			compatible =3D "renesas,fcpv";
> +			reg =3D <0 0xc5038000 0 0x1000>;
> +			clocks =3D <&cpg R8A78000_CPG_SGD4_VIO_DP_TX>;
> +			power-domains =3D <&mdlc_vio 0x07 0x102>;
> +			resets =3D <&mdlc_vio 0x102>;

[Severity: Low]
Similarly, does the fcpvb0 node use an out-of-bounds index with 0x102?

> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919-epaul-v7-3=
-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com?part=3D4

Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674EA21FF24;
	Sun, 31 Aug 2025 15:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756652695; cv=none; b=FmhqApO8cruL7lvhWh4tMa4g9XzSRtDFGl2wxssJoZEnezXu9YnztAgEHtzgtkID63uI6XhOFqDME+YzSXNaRFM0yknbZ3LK/i1LcBACQGgXYHk+MTiBuc5iqeT/PkQX5vpblJJ+la2lK+PMgnHqxFptUVAG7RwvPcZIH853/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756652695; c=relaxed/simple;
	bh=cnb9U8xfm+56fk+ZQhAzNFmK0EKzA2LS/LC+HJznkrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZcdUCcE2fTVURSQu20WTH7XZ/sb2aB1EKUHcMKv1m+vg2q1sd8bPdRt+D3CjqmTatH19Ej9TV990R4/MWzRATgY4olOhFh27uwNQB5qPqz1k2Jx/UAy7YLxJRnBNdz2DzdNIQPTlKyRGuR9OUNvcfZ+h+HD1VZol6v3jeBx9KZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cPpv6qlP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cPpv6qlP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FibP0s8DsDRdRncEUYqsAz/ECZHtws1JsEgePtJvE8Y=; b=cPpv6qlPTEnbNultnuF78/ObsZ
	AIKnE4RuwUdabNTi4jRz45mFbmRfArz4IW6ike0/r3Xu/W9X/375j7UZmiBWXZJEHEamxRpNynWxL
	Cu0TYqtV0mhrm9mlUo7vTTisqt1lSxfqkLnJTkQ4PnVlcAe8ypN9kPwjKkzlP7jsT0p1FVlu1Bqnd
	hCK/lGaOHH4G2Nr8TPya/dsBLmavC9S5wIc6z2Gp3FbEGMSPgL84l+Xmp0xs8gKWU2aqb8vHsRvrZ
	cs+bHCI/QbaLu0B5B0rzb76oUTyJ7+RfIOxSpDRWUq5RICFnN5wAbwQgffL/tvEZikO6JnGtfRstr
	6IsWn1Qw==;
Received: from i53875b56.versanet.de ([83.135.91.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usjbr-0006Xs-Pd; Sun, 31 Aug 2025 17:04:47 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject:
 Re: [PATCH v1 5/7] ARM: dts: rockchip: Add display subsystem for RK3368
Date: Sun, 31 Aug 2025 17:04:47 +0200
Message-ID: <3368190.aeNJFYEL58@diego>
In-Reply-To: <20250831104855.45883-6-cn.liweihao@gmail.com>
References:
 <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-6-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Sonntag, 31. August 2025, 12:48:53 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> Add vop and display-subsystem nodes to RK3368's device tree.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>

please use the appropriate patch prefix. For arm64 this should be
arm64: dts: rockchip:

The one you're using is from the arm32 side.

Also please sort things appropriately both node-position and order of
properties inside nodes, see
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/dts-coding-style.rst


Heiko

> ---
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3368.dtsi
> index 73618df7a..0e47bf59a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -858,6 +858,32 @@ vop_mmu: iommu@ff930300 {
>  		status =3D "disabled";
>  	};
> =20
> +	vop: vop@ff930000 {
> +		compatible =3D "rockchip,rk3368-vop";
> +		reg =3D <0x0 0xff930000 0x0 0x2fc>, <0x0 0xff931000 0x0 0x400>;
> +		reg-names =3D "regs", "gamma_lut";
> +		interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
> +		clock-names =3D "aclk_vop", "dclk_vop", "hclk_vop";
> +		assigned-clocks =3D <&cru ACLK_VOP>, <&cru HCLK_VOP>;
> +		assigned-clock-rates =3D <400000000>, <200000000>;
> +		resets =3D <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, <&cru SRST_LC=
DC0_DCLK>;
> +		reset-names =3D "axi", "ahb", "dclk";
> +		iommus =3D <&vop_mmu>;
> +		status =3D "disabled";
> +
> +		vop_out: port {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +		};
> +	};
> +
> +	display_subsystem: display-subsystem {
> +		compatible =3D "rockchip,display-subsystem";
> +		ports =3D <&vop_out>;
> +		status =3D "disabled";
> +	};
> +
>  	hevc_mmu: iommu@ff9a0440 {
>  		compatible =3D "rockchip,iommu";
>  		reg =3D <0x0 0xff9a0440 0x0 0x40>,
>=20





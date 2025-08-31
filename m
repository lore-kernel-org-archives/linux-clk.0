Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C09635;
	Sun, 31 Aug 2025 15:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756652792; cv=none; b=cgUVFAzgG8LKMosM636o3N3XeLQtYJ1oyPAwKQ8ijAh2DFkjfYoG9MlGo8Rb4oi1KXVPr80h7hcGyIkejQOuDOF3oYCw73E49hzEGqjrfHbVawFBuNEyct/V0fhyHad1nPOpeNCkRu+8EiMrWJwg2tY75M8Fj7EhB2wCI0lk2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756652792; c=relaxed/simple;
	bh=6JgrtRTdOcirKARN+FD85gf2QoAmEtdpacJfKjiVeLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1UwxA98b46L4mNY/KTiCRM4ko/lwTBRp8rMItxJ5mG92pVK8NA1vmEg5YiqP7kuN+Hvf+0E63lLxmj7RsCuZbl1zGL1koXmgtarA3ao9kq8ThmY3X70R84gLHGdvgRF77UqAvU+cYJGTcIK8PuthfXiOf8tI5lwd03Th8zm+jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zr7VUttr; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zr7VUttr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NZfUhY1EZQv1OuZe5tH097MUEDvYB4HeowDcrbjOqWg=; b=zr7VUttrCYLdhVOAGJ/Lr9oKmN
	G17tELZOSR5+6G4+83RfqgDQD/koYmtt9ulOu5Kclyt9jtnUg9Joo7kLYQ7y26JP3s70oJS1k8V1q
	VBlejvPkHAhDchJt1rPJPxDpVCHRVAqd+6aLiQ91iKqw8BprlR4WkqqgkRLxnyDZCJd9MG+ioCEtF
	D/R9aJP05KKdNhuapyq/iqDdbKSFoCxNqaLk7T0iI8tjtlohdhLRWMkHhsYgAKiR6wO0rWTMXEppn
	8BzRFiAA0xvrcP6jVybEF+pSEvWrkFGNwF29EOGMMAbhnyCfKJ6zlA/KPxEuWm6pUldy8GrqB9luh
	NU/pUbRg==;
Received: from i53875b56.versanet.de ([83.135.91.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usjdR-0001Dx-BJ; Sun, 31 Aug 2025 17:06:25 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 6/7] ARM: dts: rockchip: Add D-PHY for RK3368
Date: Sun, 31 Aug 2025 17:06:24 +0200
Message-ID: <8571992.T7Z3S40VBb@diego>
In-Reply-To: <20250831104855.45883-7-cn.liweihao@gmail.com>
References:
 <20250831104855.45883-1-cn.liweihao@gmail.com>
 <20250831104855.45883-7-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 31. August 2025, 12:48:54 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> RK3368 has a InnoSilicon D-PHY which supports DSI/LVDS/TTL with maximum
> trasnfer rate of 1 Gbps per lane.
>=20
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3368.dtsi
> index 0e47bf59a..674a3676d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -884,6 +884,20 @@ display_subsystem: display-subsystem {
>  		status =3D "disabled";
>  	};
> =20
> +	video_phy: video-phy@ff968000 {

I think the node should be something like
dsi_dphy: phy@ff968000


> +		compatible =3D "rockchip,rk3368-dsi-dphy";
> +		reg =3D <0x0 0xff968000 0x0 0x4000>,
> +		      <0x0 0xff960000 0x0 0x4000>;
> +		clocks =3D <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_DPHYTX0>,
> +			 <&cru PCLK_MIPI_DSI0>;
> +		clock-names =3D "ref", "pclk", "pclk_host";
> +		#clock-cells =3D <0>;
> +		resets =3D <&cru SRST_MIPIDPHYTX>;
> +		reset-names =3D "apb";
> +		#phy-cells =3D <0>;
> +		status =3D "disabled";
> +	};
> +
>  	hevc_mmu: iommu@ff9a0440 {
>  		compatible =3D "rockchip,iommu";
>  		reg =3D <0x0 0xff9a0440 0x0 0x40>,
>=20





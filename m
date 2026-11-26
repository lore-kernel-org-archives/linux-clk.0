Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705319;
	b=KvFmM+ONMtmF4QzNIUISuI9EunZxYukVs5SO+S19o37/ylwhL4w4dWH8zJ+11wO43/Je
	 MdETmpUISAjsNKWnJsaKP0++F/4FTPHsicCYK4SCqIljlXyrwsemYV8qxXzH6Ftp1yJV/
	 MJGY1i/hrOtKvliv/IRLCdG0pixqF3171l/eeFBb+wG7F9nqh2KIsmRv8N0I9UKS3tFrE
	 Izt/fDALV/EwU63HfGv89nCy6vNzc9KrMn9OFCwqF93mipYkmT75oT17Caqtuqo/RmSkN
	 7tZMth83fj/Wp30jVg+i2lBkTQUsJARoAmkM+lEiCZ0edtITm1HgWlZugJDqVEPCZlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705319;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/GdoMrkDemZi7hdG7Ndh6lA8LyYqjKAkpaSZxrs+xR4=;
	b=hwDqF/uUCHfWyKojzxJzdBPBJx8eOV3Wrs2eOtegr1XiO94FaiHJJpiTmOinJhuRJDaA
	 nxd/bv6chDPOaodyCbK21uo2ptmh5oQvbyQr0WZs0N2cktRjgpuaVUkc/t88XXf9f0Kag
	 1pZkdH6UOSyxmg65KdUHPhI+EhyVGL/ceiaPoMfc+FD441RJYIkGn69tNbM5d0X3dgJL3
	 vJY1IP4RR/iS+s6y345AgGhv44a/D7WLZPMINCTGdm4dOkxYnrZqjGYlL/BHNlchazqmY
	 atMJHIxVGs0Vgfn3TCrs8PoeOaXCXlTvdR3XBZ1jJ0GiXgQa+xK9ZICYivDjwUcIEFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqVWgEhf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B748606A32C;
	Thu, 26 Nov 2026 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RqVWgEhf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0001F008B2;
	Thu, 26 Nov 2026 15:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705319;
	bh=/GdoMrkDemZi7hdG7Ndh6lA8LyYqjKAkpaSZxrs+xR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RqVWgEhfRNRMfIfl5KFVhVTqO+1o0zzqaIlK8kn+vmA7DHf82J48qYyhbYYbLk7e+
	 OtG+EvGwlRr6ETBl8G1SAdXFZbEXZaJWfuKZt6zaJayS/tbAGfZ4TUnDLDF89l0r9f
	 XFqtcAZGwwad7iFmky28N/0D+0QG+cdSxWYDDx/I+9AAfMVXXcXvquys85xy8RHAk+
	 M5OHP5kbMGWITuIEeq2Lrcpk2v5He680b4zrxLZTBaNfrG110A4WEmY4Mw2Chhxlv7
	 /eMfNr2EFixx+oZsmJleaLFDOn9dGF1oPJFIA6ZRYsj53Y/h0tZOZdk+edqZa+YKDf
	 53a6v8ugObcUQ==
Message-ID: <sashiko-outbox-235767@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: add dfi clocks on RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-5-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
 <20261126-dfi-clocks-and-rk3576-support-v3-5-0f33c1b8df48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 15:01:57 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: rockchip: rk3588 dfi clocks violate
  rockchip,dfi.yaml binding
--

commit 01f5bc0587cdc7770b7d81ff68f46ba8e1c4c5c1
Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

arm64: dts: rockchip: add dfi clocks on RK3588

This commit adds four per-channel DFI monitor clocks to the dfi@fe060000
node in rk3588-base.dtsi.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3588-base.dtsi
> index d0f364547ae55..ef0ff6555fba3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -2190,6 +2190,10 @@ qos_vop_m1: qos@fdf82200 {
>  	dfi: dfi@fe060000 {
>  		reg =3D <0x00 0xfe060000 0x00 0x10000>;
>  		compatible =3D "rockchip,rk3588-dfi";
> +		clocks =3D <&cru PCLK_DDR_MON_CH0>, <&cru PCLK_DDR_MON_CH1>,
> +			 <&cru PCLK_DDR_MON_CH2>, <&cru PCLK_DDR_MON_CH3>;
> +		clock-names =3D "pclk_ddr_mon_ch0", "pclk_ddr_mon_ch1",
> +			      "pclk_ddr_mon_ch2", "pclk_ddr_mon_ch3";

[Severity: Medium]
Does this violate Documentation/devicetree/bindings/devfreq/event/rockchip,=
dfi.yaml?

The schema currently allows only a single clock named pclk_ddr_mon:

Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml {
    ...
  clocks:
    maxItems: 1

  clock-names:
    items:
      - const: pclk_ddr_mon
    ...
}

Without the corresponding binding update, dtbs_check fails for all RK3588
device trees that include rk3588-base.dtsi.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-dfi-clocks=
-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com?part=3D5

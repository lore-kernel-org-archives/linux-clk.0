Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25F1A294;
	Sun, 31 Aug 2025 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756653004; cv=none; b=s+CyWiTTUrjrJsq/w9wkhUE4H7d2JlCmJmHgmJ/4ZN/6+DnJrbqayHmv2vTflqA0OWZMm/6kXMaldHdQGh1wWBb5FaJrSVKZs6ilcVCSm0Pen/WU+tdS2LepWLur7AHfaZScdGtN+ET6rNgyI46XMfSYz7P6R0SZzLRxZ+qKSyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756653004; c=relaxed/simple;
	bh=dydiB1QadEQsX9Esijue2U2rTK83/ss0kWTnNBBbiSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MCMaRZEUEevn9U9C4rLBZVDTOyNfba49xz4KWrzZ9rp15u841L5evbw/Ohc6FpDW8x4ugu+cRujQHxl7yfdg4T1ZoOVSMKIovyELIoEajOk5WjtK44qnOIrihGdH00+mPvXIBGv4wztLJL/Bzxh1VFC3wJr8No+aL2j5RB/R14Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=otdUEdVX; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="otdUEdVX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=m2D31ldRCNyyz8A8vsgNbC3FnyuJad7s6giy8XoOyqU=; b=otdUEdVXVjmS2dJIdEkiGfJrSh
	DhqOUY5/k7q+TlolUG+CZKhggYQI+oniHZhoHXGdIVHffkOQwEGLBdL0T81ZNJykOHCOTgrAZJqDO
	9GfkMhJbie4xTpjbrEhi50d59yqqnJig5P/E6HKR7hvMGdwiHQ16Ia7wYaW9L0w9ctkseGD5VuvKk
	PL3/NPl75XlvYLwdD7K5/D1bHU0ZSLg1ToJwOPXgTsp7FiyYOTsYbt6GuNYg0iChF2Gu1y6XGBExL
	Pp9rvxKLkrDLIJK6R0GPeHKL4aXvyuMdecTRnrBo6Mu/rzCKX3Dub015T1zit4r+n5mSgfL5PKyBi
	96MtlX+Q==;
Received: from i53875b56.versanet.de ([83.135.91.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usjgq-0007PW-SX; Sun, 31 Aug 2025 17:09:56 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: robh@kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, WeiHao Li <cn.liweihao@gmail.com>
Subject: Re: [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368
Date: Sun, 31 Aug 2025 17:09:55 +0200
Message-ID: <22816630.EfDdHjke4D@diego>
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Sonntag, 31. August 2025, 12:48:48 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb WeiHao Li:
> This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> native display connectivity through the MIPI DSI host controller and
> PHY. The changes span multiple subsystems, including clock control,
> DRM/VOP integration, DSI controller binding, and PHY driver updates.
>=20
> Key changes:
>   - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
>     phy initialization.

which patch is doing this, because I don't see any phy-related change

>   - Add missing lut_size of vop_data for RK3368.
>   - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
>     which is required for enabling the 24MHz reference clock.
>   - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
>     and register mappings.
>=20
> These changes were tested on a RK3368-based board with a MIPI DSI
> panel [1]. The display boots successfully with console output.
>=20
> [1] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368

Do you plan on submitting this board to mainline?
Because having an actual user of the code you're adding would
be really really nice.

Thanks
Heiko

>=20
> Tested-by: WeiHao Li <cn.liweihao@gmail.com>
> Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
>=20
> WeiHao Li (7):
>   drm/rockchip: dsi: Add support for RK3368
>   drm/rockchip: vop: add lut_size for RK3368 vop_data
>   dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
>   clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
>   ARM: dts: rockchip: Add display subsystem for RK3368
>   ARM: dts: rockchip: Add D-PHY for RK3368
>   ARM: dts: rockchip: Add DSI for RK3368
>=20
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi      | 79 +++++++++++++++++++
>  drivers/clk/rockchip/clk-rk3368.c             |  2 +-
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 20 +++++
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  1 +
>  include/dt-bindings/clock/rk3368-cru.h        |  1 +
>  5 files changed, 102 insertions(+), 1 deletion(-)
>=20
>=20





Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB4B371CF4;
	Fri, 17 Apr 2026 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776464731; cv=pass; b=VFKrU7iZor5DAao1zvn/e6YIgp93oe2Cp3pNcB7qtiHzzrsO2NksoIqYnjeGAZmY27O3k0YQnnghTEnNx8GcZH//Bl7muKnsJa92eGy2K0dKNgFJ5bIqZZ7/ggahjp01dSDNBHAq/6GOFeEbv86gG6ls0YFHzqeYian6fh7WeHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776464731; c=relaxed/simple;
	bh=Gi0cAwXpdaGihMD8LjJU59zbs9HHr2y0ik9MgH/742c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4/lH7liQ5N095crm7AnbQEmHHo8hKLAQRJfDXj0PR29wBrweFgFMJLzIWA/jNXLBSKGT/oyav3LMRds50jRziz9IwM9lfbvKzMF4oFlPlVtPnyFhXm2Is2Vj2/dW88UnRss453H+20QMiri7ZlXsvMYhKibSOPjPonuRbR0Rjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=jGM36SBP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="jGM36SBP"
ARC-Seal: i=1; a=rsa-sha256; t=1776464704; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EMtDlA47WytILsQiJHXFMfsGWLQe3mkc8kqd3YUaHC+h8lzn9p63CR/XWc4vxIUCXUZ1gPgISPRmbJzTY+xoJaSwymJ6D8OKKhjtnjDDUxvByfypxj38Fgw0qKhZDvhnqQZfgDnHbOrCPEpDk9Pv85pSjwhhT1x/0BA1Fjz2xps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776464704; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+zBBLCkgMkRnprkfPkN/u+UeorTqdWoVN2pXiolVZQc=; 
	b=oL1R4vBq3IoWkluq2slvzZEt0lPPdtkCDgoVWEgGhftPZJYg5grfcMqM0vmeQ2FiQv/G3p5RzyMpqzHKbqL0p4kpvZyVnkNTHGFhh663Q1EFyT1M1IdfDuBcY2+2X6XpCwdwvmcc1txb7VVcwnsk4FE0ggIqbZzfjl09s9C0xSs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776464704;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=+zBBLCkgMkRnprkfPkN/u+UeorTqdWoVN2pXiolVZQc=;
	b=jGM36SBPyQyrj76EO6boBdfflIRp+muoNNJhnM+itHMXeRtFhsw9iVQRePlUXd/w
	3o/2GhadrZiI7yGUymFfMPRG72fyFvc9BZayLjgFitcPOgMDAa9nZ2K5NUPQx8ESpvm
	g6x7e004R1f5zmL+On8jyykLbF0JJL05bbsAtCGU=
Received: by mx.zohomail.com with SMTPS id 1776464702393585.2516640397748;
	Fri, 17 Apr 2026 15:25:02 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 03312182620; Sat, 18 Apr 2026 00:24:58 +0200 (CEST)
Date: Sat, 18 Apr 2026 00:24:57 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Pavel Zhovner <pavel@flipper.net>, 
	Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
Message-ID: <aeKtNf8CCAWduI-f@venus>
References: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oavuqxz2xzcieowj"
Content-Disposition: inline
In-Reply-To: <20260417-rk3576-dclk-v1-0-26a9d0dcb2de@flipper.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.2.1.5.2/276.440.67
X-ZohoMailClient: External


--oavuqxz2xzcieowj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/4] arm64: rockchip: The hunt for exact pixel clocks
 on RK3576
MIME-Version: 1.0

Hello Alexey,

On Fri, Apr 17, 2026 at 07:11:43PM +0400, Alexey Charkov wrote:
> Dear all,
>=20
> Need the help of the collective wisdom of the community.
>=20
> The problem I'm trying to solve is reliably obtaining the exact pixel
> clock for arbitrary display modes supported by the RK3576 SoC.
>=20
> Rockchip RK3576 has three display output processors VP0~VP2, each
> supporting different ranges of display modes, roughly as follows:
> - VP0: 4K 120Hz
> - VP1: 2.5k 60Hz
> - VP2: 1080p 60Hz
>=20
> Each one obviously needs a pixel clock. The required frequencies for the
> pixel clocks vary greatly depending on the display mode, and need to be
> matched within a tight tolerance, or else many displays will refuse to
> work. E.g. the preferred (maximum) display mode out of VP1 is particularly
> awkward, because it requires a pixel clock of 248.88 MHz, which cannot
> be obtained using integer dividers from its default clock source (GPLL
> at 1188 MHz), and the nearest approximation is 237.6 MHz, which is well
> outside the tolerance of e.g. DP specification, resulting in a blank
> screen on most displays by default.
>=20
> The clock sources are of course configurable, in particular there are mux=
es
> connected to each VP for selecting the source of the pixel clock:
> - Each VP can take the clock either from the (single!) HDMI PHY or from
>   its dedicated dclk_vpX_src mux
> - The dclk_vpX_src mux can select the clock from a number of system PLLs
>   (GPLL, CPLL, VPLL, BPLL, LPLL)
>=20
> While the system PLLs can be configured to output a wide range of
> frequencies, they are shared between many system components. E.g. on the
> current mainline kernel on one of my RK3576 boards I've got the following:
> GPLL: 1188 MHz, enable count 20
> CPLL: 1000 MHz, enable count 17
> VPLL: 594 MHz, enable count 0 (yaay!)
> BPLL, LPLL: 816 MHz, enable count 0 (but these last ones don't have
>             predividers, so are less flexible)
>=20
> So ultimately there is exactly one free fractional PLL (VPLL) which can be
> used to generate arbitrary pixel clocks, but we have up to three consumers
> trying to drive different display modes from it (e.g. HDMI on VP0, DP on
> VP1 and MIPI DSI on VP2). We also want to be able to adjust the PLL output
> frequency on the fly to satisfy the requirements of the selected display
> mode.
>=20
> And this is where I'm stuck. Trying to satisfy the requirements of up to
> three consumers while changing the PLL frequency on the fly sounds like
> a poorly tractable mathematical problem (is it 3-SAT?). We can take the
> HDMI output out of the equation, because it can be driven from the HDMI
> PHY (which is capable of arbitrary rates) instead of the mux, but that
> makes the decision of which dclk source to use for a VP block dependent on
> which downstream consumer is connected to it (HDMI vs. something else).

It becomes more messy: The HDMI PHY cannot be used as clock source
for modes exceeding 4K@60Hz.

> Even then we somehow need two devices to cooperate in picking a PLL
> frequency that satisfies the requirements of both of them, and change to =
it
> without display corruption. I'm not even sure if the CCF has mechanisms
> for that?..
>=20
> What follows is a brief set of patches which illustrate a partial solution
> for the case of "I just need 2.5k60Hz on VP1 via DP and don't care about
> the rest". It switches the VP1 unconditionally to use VPLL as the source
> for its dclk mux, allows changing the VPLL frequency on the fly, and also
> changes the frequency calculation logic to allow for nearest-match
> frequencies which are not necessarily rounded down. These are not meant
> to be merged as-is, as I see the following issues:
> - The flag allowing the PLL to change rate is in the clock driver, while
>   the reparenting to an unused PLL is in the device tree. If these go out
>   of sync, we might end up trying to change the frequency of a PLL which
>   is used by other consumers (I presume that could be dangerous)

It is a problem, see e.g. this patch from Heiko removing the flag
for an RK3588 VOP source clock:

https://lore.kernel.org/linux-rockchip/20251008133135.3745785-1-heiko@sntec=
h.de/

Also note, that there is some more general ongoing work regarding
this:

See: https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c=
5f@redhat.com/

> - If VP0 happens to be driving DP output, it won't be able to produce the
>   2560x1440@60Hz mode for the same reasons as VP1 - then it must also be
>   reparented to VPLL and allowed to change its frequency on the fly

There is also the problem that nearest match might be sensible for the
display, but is not generally safe. For other clocks you might
effectively overclock, which shouldn't be done by default.

> It does bring me from a state of "always blank screen on DP output until
> the mode is switched to something magically working" to a state of
> "most monitors work at the default preferred mode" though.
>=20
> It is tempting to just reparent both VP0 and VP1 to VPLL and allow both of
> them to change its frequency, while leaving VP2 on the default (fixed)
> GPLL and relying on the fact that 148.5 MHz (the required frequency for
> its maximum supported mode of 1920x1080@60Hz) is conveniently 1188/8 MHz -
> just what GPLL can provide. Then also force whichever VP is driving HDMI
> output to use the HDMI PHY as its clock source. But we still have the
> problem of DT vs. driver coordination, and I'm not sure how to define
> the policy for "if you've got HDMI connected, you must use the HDMI PHY
> clock for the respective VP, whichever VP that is".

Sorry, I don't have any complete solutions - except that I can tell
you that the VOP2 driver already automatically switches the clock
source to the HDMI PHY for HDMI outputs if the pixel rates allows it:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/rockchip/rockchip_drm_vop2.c#n1757

Greetings,

-- Sebastian

> I would very much appreciate any thoughts on how to approach this.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Alexey Charkov (4):
>       arm64: dts: rockchip: rk3576: assign dclk_vp1_src to VPLL
>       clk: rockchip: pll: use round-nearest in determine_rate
>       clk: rockchip: rk3576: allow dclk_vp1_src to propagate rate to pare=
nt PLL
>       clk: rockchip: rk3576: add ROUND_CLOSEST to dclk_vp1_src divider
>=20
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi |  2 ++
>  drivers/clk/rockchip/clk-pll.c           | 16 ++++++++--------
>  drivers/clk/rockchip/clk-rk3576.c        |  4 ++--
>  3 files changed, 12 insertions(+), 10 deletions(-)
> ---
> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
> change-id: 20260417-rk3576-dclk-4c95bbb67581
>=20
> Best regards,
> --=20
> Alexey Charkov <alchark@flipper.net>
>=20

--oavuqxz2xzcieowj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmniszUACgkQ2O7X88g7
+pqLmQ//bIF1BfX8fP/unwatE/Nz4LyMh7NRPqn4bmRvdo7GivZPWcmoM4/4VRgk
P4UFajrspzeLuLd0ve7vaJOjsp7rz7Dax+/GQVdBYODO52cXkIFmRfiRFxqgnfGd
ZAmgvW47Ib5bbi4rUETncsx3JBKJEyBuoPOlhLwW9q8rQffPPx2R/x8J5wWjWSEA
cxl6jOnxtHAIoEO3WiHW2YI7bCbvhzEQ3SYwjw01R7/bVMGAJT1VmpDIh/+UZsN7
SLYqgCKrPMhBgGXG+8GWP9cx4mk4PekA3tFfcLS2ypxYmfaqPJyE+VCTd/1jPK04
HrijXux1cSNXy2Ut7azCJ04bqCmCGUoYrzvUVZjHT4M88jE+45KLbATrb9htMnnz
QQngIWTlUPYT6z6IItTYDz/Y28yOezmGe9NeVgzhYtd+mYL9WqEEHy7jzIjEqho7
IZT5F8mk0I0URqWPAftcnlFljlIAk0TeHaxB2erPhGFOgQfvVdocRpQhrPzS+q9m
1cZoVntJX/NB1kqkfnnA6b0ufKRXhwwLavigHfGnzunKhgFDvGMEAn08IUw0q9rA
d/zVeWLu0D5+U94iR5VHkp9nPSlKi4K+l97OCT2UKZvWktjklZaCPvu3jks2h6rJ
J8EpXrdem/c8gJ/eYIsjxx0NMK0/JTzRVaZXoCWkEjH0NJFsi7Q=
=8+Q/
-----END PGP SIGNATURE-----

--oavuqxz2xzcieowj--

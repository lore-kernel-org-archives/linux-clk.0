Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96944AD4A9;
	Fri,  2 Oct 2026 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973006; cv=none; b=fxgEP1a3nU/nuUsXK9V1Gj+K11HTZNZJ92FKvuUOtUMZ6JxAHEkJv7EB0p7pS54qnfWYnIiIYBNpJobfvmTrq/kB8Y/WujYTeQHgtmT+WHTUMVo9I3VH5PI6wopUGRa2lR/eexvFwLgcUmEl7tQ6BWWlPJApGhrs0Ice81J0JZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973006; c=relaxed/simple;
	bh=A57fix4TjPTef9DberGTKzGGVIoj6xLxc1T8ES85t+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ub3Q0WSJke37cNxmhaMz2I8PHTH2PMRD7hHBDtUxFd/FZPQYH7aGLs9SaWn6HBuwkPJvaPXcWO6tqLhwyv4CcSiMXPK8l6GlnE0YOIZUMQM/XZ7UpqKjxWGsfPd9iY50qHiyEVmQm0keCHtX1OoxnOwf8EQ1BEmychW2jpw4SvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRYgbpfN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRYgbpfN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E801F00899;
	Fri,  2 Oct 2026 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790973001;
	bh=PPe8XfiBwwc3VDb6mDFBIKcS4IWCrZUJLVhKKA8dMoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kRYgbpfN3Zr8PhX0aoVstFOHkG4ZIeid0meglthEXwDFLVd90amgIuPcMBIzne1rC
	 /1S/wriOyhe968niXRc0AzTYNSTiNXzIlDPO7ejp06HBS2hazRVQosS/alNt/JPuWH
	 CNQG9PsE1iFjXAQK7r94nDpO1TOaHqXxHhOp7BEWL7jnCh3hpod7aAlKt1zQfltCgV
	 waKUDwpqRoJj6FPEU3B1OGlkJHc3OI3CsXjrpn13Bic2uwVxYX6pKRnfhKTRO/cF/6
	 sYKSiSVyhYTIyKopNgInQWIiqe5kOo+83tiUHGw+cjiIwFwFRguGHYgVVJ29V67ddK
	 mmkZ4SnLzwY1g==
Date: Fri, 2 Oct 2026 21:29:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 0/8] Add StarFive JHB100 syscon modules
Message-ID: <20261002-causal-handbrake-d5e1331fcfde@spud>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ued5DHNw/Ko0FYQ"
Content-Disposition: inline
In-Reply-To: <20260828095608.19955-1-changhuang.liang@starfivetech.com>

--4ued5DHNw/Ko0FYQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 02:56:00AM -0700, Changhuang Liang wrote:
> StarFive JHB100 has many syscon modules, as listed below:
> - pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
> - pcieep1_ecsr_syscon
> - host0_syscon		(Host0 syscon)
> - host1_syscon
> - husb0_syscon		(Host USB 0 syscon)
> - husb1_syscon
> - husbd0_syscon		(Host USB device 0 syscon)
> - husbd1_syscon
> - husbcmn_syscon	(Host USB common syscon)
> - gpu0_syscon		(GPU0 syscon)
> - gpu1_syscon
> - b2h_syscon		(BMC to Host syscon)
> - h2b_syscon		(Host to BMC syscon)
> - vout_syscon		(Video output syscon)
> - pcierp_ecsr_syscon	(PCIe root port externel syscon)
> - pcierp_syscon		(PCIe root port syscon)
> - usb_syscon
> - npu_syscon
> - per0_syscon		(Peripheral 0 syscon)
> - per1_syscon
> - per2_syscon
> - per3_syscon
> - sys0_syscon		(System 0 syscon)
> - sys1_syscon
> - sys2_syscon
> - strap_syscon
> - sfc0_filter_syscon	(SFC0 filter syscon)
> - sfc1_filter_syscon
> - sfc2_filter_syscon
>=20
> Some syscon modules contain PLL, reset, and socinfo nodes
>=20
> This series depends on the series:
> https://lore.kernel.org/all/20260807112923.191627-1-changhuang.liang@star=
fivetech.com/
>=20
> changes since v4:
> PATCH 2:
> - Constify name pointer
> - flag =3D=3D> flags
> - Use FIELD_GET() and FIELD_PREP()
> - Use DEFINE_SHOW_ATTRIBUTE()
> - Replace of_device_get_match_data() with device_get_match_data().
> - Make the driver compatible with both MFD cell instantiation and
>   direct device tree node probing.
> - select STARFIVE_JHB100_SOCINFO and select MFD_SYSCON
>=20
> PATCH 3:
> - The changes in PATCH 2 introduced a conflict with PATCH 3, requiring
>   modifications.
>=20
> PATCH 7:
> - Binds directly to the "starfive,jhb100-sys0-syscon" node.
> - Instantiates the sys0 PLL clock driver as an MFD child cell,
>   since the syscon region contains both the revision register
>   and PLL controls.
> - Uses devm_* APIs for automatic resource cleanup.
>=20
> v4: https://lore.kernel.org/all/20260809015054.210577-1-changhuang.liang@=
starfivetech.com/
> v3: https://lore.kernel.org/all/20260521012932.24163-1-changhuang.liang@s=
tarfivetech.com/
> v2: https://lore.kernel.org/all/20260512083521.3448-1-changhuang.liang@st=
arfivetech.com/
> V1: https://lore.kernel.org/all/20260403054945.467700-1-changhuang.liang@=
starfivetech.com/
>=20
> Changhuang Liang (8):
>   dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
>   clk: starfive: Add system-0 domain PLL clock driver
>   clk: starfive: Add peripheral-0 domain PLL clock driver
>   clk: starfive: Add Peripheral-1 domain PLL clock driver
>   reset: starfive: Introduce active_low
>   reset: starfive: Add syscon reset driver support
>   soc: starfive: Add socinfo driver for JHB100 SoC
>   riscv: dts: starfive: jhb100: Add syscon nodes

I've applied patches 1 & 7 of this, and included the former in a PR sent
to Brian a few minutes ago. I'll queue patch 8 in my pending content
branch for the jhb100, when you resubmit to resolve the recent driver
feedback, please drop those three patches.

Thanks,
Conor.

--4ued5DHNw/Ko0FYQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasAUQgAKCRB4tDGHoIJi
0txxAP9J81APJ2rNfPL6LzA6KaEGcDyNoMIX+tZLI1ChqhRl9AD/SJm4crHJUNCr
qFd0XtDfj18Jmac4RW1KplFxlCRYQA8=
=zVOA
-----END PGP SIGNATURE-----

--4ued5DHNw/Ko0FYQ--

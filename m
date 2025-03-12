Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F981F12F8
	for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 23:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821422; cv=none; b=G/4TsH8zmKujvgWa5GtalUNTan4IXwmfYwxAmA3M8uBy7QDOKdMfdZujtjffbC1iSbuNIO2Lie7STYxek2oGKhP0uDqIAQ9KLFou8/ZnaBGrOw1TSb2LdUBEUs6h+uDGdTaa0jU4X8RZb2NEyiXJkHqOjHv65XV24bo7E3hTcL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821422; c=relaxed/simple;
	bh=wqg9zUtWmVpF6JzOb+JkHva2UgAbpiTGxmzAbHTOhuk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=l7SZnkbl50IiIIlbX9CiB9lPPOs3iNA1CO5vNwrxgkAPJpCuVdwZXoQlNZeLgnIhYDEkMTXFfQuU24eKY2bTkM6xG+eU3wz5N+MIlgHpJ7sO5FRvrBE1+cAh8xTQNcaAHKWhty06OK180Ig+NF94VIehtUEBbVasBE+TAK6Gelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLB8YGlD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLB8YGlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDBFC4CEDD;
	Wed, 12 Mar 2025 23:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741821421;
	bh=wqg9zUtWmVpF6JzOb+JkHva2UgAbpiTGxmzAbHTOhuk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qLB8YGlDoAxC9HiQ57QktFZPg3r7oWUMovsr6+YkytP5AyMV05LkV0+3FQ70vLC+6
	 fyViw6+XuaIZgXeNBoePnB8YddiUVeEOK5eoTynIre7kP9rlPE7QEQn/HtvauAU7yo
	 AX1mCioV8c6R4s6ZeKOKdsFqHaN3kvaQeVrAqwyG6qdbzePQ9aaKoLANzyA8AQIh6F
	 FEZ/pj0AxRb/Zrs06996kmp7BlcS+bDHRdAjuQMHfX7im4Ep7C/uBbQnON+A46IU0j
	 1yZPBFWDdiHzAkIWkmLC0M2Kqt7Eb0o7mOg9Ab6qMqTfNGWjD12/wO5giT65WhWcsy
	 KLN3TGslQp3VA==
Message-ID: <166bb0476a377d8159ce669007e49689.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2216284.irdbgypaU6@phil>
References: <8574162.T7Z3S40VBb@phil> <33a5e73e9c3919dd0554f9dcbee8b733.sboyd@kernel.org> <2216284.irdbgypaU6@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.15 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, kever.yang@rock-chips.com, mturquette@baylibre.com
Date: Wed, 12 Mar 2025 16:16:59 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Heiko Stuebner (2025-03-11 23:03:00)
> Am Dienstag, 11. M=C3=A4rz 2025, 19:05:50 MEZ schrieb Stephen Boyd:
> >=20
> > Did you see this warning?
> >=20
> > drivers/clk/rockchip/rst-rk3562.c:21:57: error: initialized field overw=
ritten [-Werror=3Doverride-init]
> >    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x20=
000*4 + reg * 16 + bit)
> >       |                                                         ^
> > drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'R=
K3562_DDRCRU_RESET_OFFSET'
> >   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/clk/rockchip/rst-rk3562.c:21:57: note: (near initialization for=
 'rk3562_register_offset[173]')
> >    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x20=
000*4 + reg * 16 + bit)
> >       |                                                         ^
> > drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'R=
K3562_DDRCRU_RESET_OFFSET'
> >   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
>=20
>=20
> interestingly, this did not turn up in my build test.
> But that splat is really helpful too, because it made it easy to see
> that one of the ids is doubled in the dt-binding header.
>=20
> include/dt-bindings/reset/rockchip,rk3562-cru.h:
>=20
> #define SRST_P_DDR_HWLP         173
> #define SRST_P_DDR_PHY                  173
>=20
>=20
> I'll fix up the double id.

Thanks.

>=20
>=20
> Out of curiosity, what toolchain was that?
>=20

$ ~/compilers/gcc-12.2.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc --versi=
on
aarch64-linux-gcc (GCC) 12.2.0
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2182F43
	for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 06:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741759401; cv=none; b=jhZTQSH6maRMZR/Ygz90XBLKFneJkC+AZ/V+Ceg7Y4oqW3kLMe+OUwbcC2RLumA1ssmsmxh+WnNaAM+djCnyzS+/zd9Ojp/xYaYTVYKnKwZCDLemi9Ykmvu4zUEQRAeG26uiMaAV41twbYibk1D8RZaYgy+OoTGaIAch5BDGmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741759401; c=relaxed/simple;
	bh=CWWMymw37EHoOBTovRFmk98dnnKJnjT+YGur2EsZ9bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oEFnCJK3GOuuYpJ5djrjX7n7P6by6uP+Ss7NoFrgaYb7OuItMIFiFFblzGta3ISaqUGW3NdIadm0AByQ3CRemWgEfk9Q2lwDOP75ocWXqBnrlXJpSfpWaWm8sVfkFsiItd2JKIgzOrADpT6QNpeOVz20RnSr2syF+ZPWvbMkR3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=T0+U2t3i; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="T0+U2t3i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1TX2UkdheGKH/mIHBh+0F8cDwKmjcarJeonTvtYCnbk=; b=T0+U2t3iZwWsl0jzzugcrIRWJV
	q0Z++Vigx0eRo/joU6S5nFyqXF6ZdgEMWqPiEuxEk/efNcxGgUaCRHdzNNstqrMyKEAijN0EYwwT/
	53LXVvVGfxdi3qvpdTvX8EZPn85rM/8ivlY89vNlw9GHLG1p6dNvGNofT2Z5/2JE7UqR8uBG7366t
	PznC3bVqT2a3JxHBO1bcfMUmc+Dj3AwQUUXYfJcJRoFu2R5mJust9p4OUcNMe/fQBVOBcT7+qbPqd
	PWHnSTx/AE7fi+lh8lJElYtlQXV+AGWamtXCrTjVpvKFJWTUmOSSAXqsQwigXQ27SXPCcbgE2T3AB
	SQW6KZeg==;
Received: from ip-185-104-138-51.ptr.icomera.net ([185.104.138.51] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsFBG-0005Jt-SD; Wed, 12 Mar 2025 07:03:02 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>,
 kever.yang@rock-chips.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip clock changes for 6.15 #1
Date: Wed, 12 Mar 2025 07:03:00 +0100
Message-ID: <2216284.irdbgypaU6@phil>
In-Reply-To: <33a5e73e9c3919dd0554f9dcbee8b733.sboyd@kernel.org>
References:
 <8574162.T7Z3S40VBb@phil> <33a5e73e9c3919dd0554f9dcbee8b733.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Stephen,

Am Dienstag, 11. M=C3=A4rz 2025, 19:05:50 MEZ schrieb Stephen Boyd:
> Quoting Heiko Stuebner (2025-03-08 10:23:39)
> > Hi Mike, Stephen,
> >=20
> > please find below a pull-request with Rockchip clock change for 6.15
> > The new year started with a flurry of activity it seems :-) .
> >=20
> >=20
> > Please pull.
> >=20
> > Thanks
> > Heiko
> >=20
> >=20
> > The following changes since commit 2014c95afecee3e76ca4a56956a936e23283=
f05b:
> >=20
> >   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v6.15-rockchip-clk1
> >=20
> > for you to fetch changes up to f863d4cc79a7e2f8c734d1fac84dc275805f41c7:
> >=20
> >   clk: rockchip: Add clock controller for the RK3562 (2025-03-02 17:51:=
51 +0100)
> >=20
> > ----------------------------------------------------------------
>=20
> Thanks. Pulled into clk-next
>=20
> Did you see this warning?
>=20
> drivers/clk/rockchip/rst-rk3562.c:21:57: error: initialized field overwri=
tten [-Werror=3Doverride-init]
>    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x2000=
0*4 + reg * 16 + bit)
>       |                                                         ^
> drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3=
562_DDRCRU_RESET_OFFSET'
>   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/rockchip/rst-rk3562.c:21:57: note: (near initialization for '=
rk3562_register_offset[173]')
>    21 | #define RK3562_DDRCRU_RESET_OFFSET(id, reg, bit) [id] =3D (0x2000=
0*4 + reg * 16 + bit)
>       |                                                         ^
> drivers/clk/rockchip/rst-rk3562.c:266:9: note: in expansion of macro 'RK3=
562_DDRCRU_RESET_OFFSET'
>   266 |         RK3562_DDRCRU_RESET_OFFSET(SRST_P_DDR_PHY, 0, 8),
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors


interestingly, this did not turn up in my build test.
But that splat is really helpful too, because it made it easy to see
that one of the ids is doubled in the dt-binding header.

include/dt-bindings/reset/rockchip,rk3562-cru.h:

#define SRST_P_DDR_HWLP		173
#define SRST_P_DDR_PHY			173


I'll fix up the double id.


Out of curiosity, what toolchain was that?


Thanks
Heiko




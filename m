Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB97261571
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855447; cv=none; b=WH62rVkC4lf3oytBqCSNRBMft9fFngoLFXSXGayw6m6PIXqPfBSaOH4k3xEKM+xEXzBapcrlWuunMzmfFr9JN64jGi51EOFmpOhH+tTWC2KnUXvEC0GS17QTxjE3J/ugXsrv10YBRpa7Sqyp/xN8ADUEqSSXbnatQR2McuFSD5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855447; c=relaxed/simple;
	bh=B8xrWGXh47flZMBc4OynPt52HdDVE8wfQf9Ggqdg8nc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E5dDYu/dT+IQwLWiyIMSWo3fWjnhJAkiDxAhR9pH3Kz7Ukh/DUV+HX/KNBR6oMOWQB6psuafKoqDUjr2uVF9MSp23QdiZbXAHpacQU9lfHy2J+FsQfZVWrtf+bxsWQMwlq26xG8uWLRS8+AvabfAQEsw1Q1QL6hZf7EwkTP8OA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseAQ-0000KT-Qn; Thu, 13 Mar 2025 09:43:50 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseAP-005VQo-17;
	Thu, 13 Mar 2025 09:43:49 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseAP-0003az-0x;
	Thu, 13 Mar 2025 09:43:49 +0100
Message-ID: <5824eaa53054cfd9886c6ba745bd5cd8914c26c0.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: fix double id on rk3562-cru reset
 ids
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kever.yang@rock-chips.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, kernel test robot
	 <lkp@intel.com>
Date: Thu, 13 Mar 2025 09:43:49 +0100
In-Reply-To: <20250312215923.275625-1-heiko@sntech.de>
References: <20250312215923.275625-1-heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Mi, 2025-03-12 at 22:59 +0100, Heiko Stuebner wrote:
> Id 173 was accidentially used two times for SRST_P_DDR_HWLP and
> SRST_P_DDR_PHY. This makes both resets ambiguous and also causes build
> warnings like:
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
>=20
> To fix that issue give SRST_P_DDR_PHY a new and now unique id.
>=20
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202503121743.0zcDf6nE-lkp@i=
ntel.com/
> Fixes: dd113c4fefc8 ("dt-bindings: clock: Add RK3562 cru")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> The original patch did go with the reset of the clock controller code
> into the clock tree, so this patch should of course also go that way.

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

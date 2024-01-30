Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BECD6BB2B;
	Tue, 30 Jan 2024 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626056; cv=none; b=cS9zVlazTm5AdUS8IZqmDsox9FdnpSRlD68NWm6alep9Kp/WAUKMoL2jdMr/Ng1UNiVUpfHly6tRrWj5mNYkrJM4IpE3/L+Oz3j/xN+fUxbBm+d+qBZimcKhHECfq8S3EtWypSgzhJpbIRII/3wAC4PsuuNxzfUVta/L2DtIIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626056; c=relaxed/simple;
	bh=FI1o2shOT/ij4/zuD/4jiajye0Rvj5KQ1PCOiOvQ1qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fW279lv9R/+dHj8dzk+P0WV5xzvSqs/mBq7LfSii2I/m8kE+L6lccX+OzR6hQ39PUSKt4BoCZdH4lBO6nouSKlNjDGxD6t2Fh3+aMpR28eOUzcz7gBWUzqfTA032zcBso+c0VDNTZ06cnzdBsc98rjddY2Jw5FOZNybCsN48wLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZAq2ro36; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZAq2ro36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706626053;
	bh=FI1o2shOT/ij4/zuD/4jiajye0Rvj5KQ1PCOiOvQ1qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAq2ro36Muznt5+EuPTqB4/iT8QRQF9EO4FTRfFxsocopEluPGjTN2VZN0QcmUHQ3
	 T4iWq8vHQLUpAtCIB1HELSRImOnrehoM9ZxIUV58h+EPdc4idlh4VIV/NZzBZWO0Hk
	 B29F7TBTfaBiU5/7C+lsoungykWMJyIr4PQtwaw3Iq30TtUeghjOmrPyvDOKxNpIlA
	 LUHoKTYlCvA+jeqPGqjEqlgh0cNQpTUDbF496POSqM2T8Y/4+GRSSE2VL/H9TOTB9m
	 0r2sxPzVvD65SoWyIYTZItLpIy3vwhr9Ai35ZpeSO1AafypuOA6cumYcO5RDxY7nLP
	 cwUEuCdEwkY3A==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D94937811CF;
	Tue, 30 Jan 2024 14:47:33 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id C283E1063C86; Tue, 30 Jan 2024 15:47:32 +0100 (CET)
Date: Tue, 30 Jan 2024 15:47:32 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	Elaine Zhang <zhangqing@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, huangtao@rock-chips.com, 
	andy.yan@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	kernel@collabora.com
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Message-ID: <i5qagtdg73rhojifmublx2w2kxvjeisd6qwqbo5vnhrgyedx3i@pyckzpstlnvb>
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
 <20240126182919.48402-8-sebastian.reichel@collabora.com>
 <8b4214a5-6ba7-402d-b2f6-f2424783d455@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vkzhu7wafk4plwhd"
Content-Disposition: inline
In-Reply-To: <8b4214a5-6ba7-402d-b2f6-f2424783d455@collabora.com>


--vkzhu7wafk4plwhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Fri, Jan 26, 2024 at 10:36:13PM +0300, Dmitry Osipenko wrote:
> On 1/26/24 21:18, Sebastian Reichel wrote:
> > Recent Rockchip SoCs have a new hardware block called Native Interface
> > Unit (NIU), which gates clocks to devices behind them. These effectively
> > need two parent clocks.
> >=20
> > GATE_LINK type clocks handle the second parent via 'linkedclk' by using
> > runtime PM clocks. To make that possible a new platform device is creat=
ed
> > for every clock handled in this way.
> >=20
> > Note, that before this patch clk_rk3588_probe() has never been called,
> > because CLK_OF_DECLARE marks the DT node as processed. This patch repla=
ces
> > that with CLK_OF_DECLARE_DRIVER and thus the probe function is used now.
> > This is necessary to have 'struct device' available.
> >=20
> > Also instead of builtin_platform_driver_probe, the driver has been
> > switched to use core_initcall, since it should be fully probed before
> > the Rockchip PM domain driver (and that is using postcore_initcall).
>=20
> Why clk driver needs to be fully probed before PD? The PD driver
> shouldn't probe until all clk providers that it uses are registered, and
> then both clk and PD should be registered at the default level.

The error handling in the rockchip PD driver needs rework to
properly handle -EPROBE_DEFER, which I consider a separate series.

Note, that the driver currently has 'builtin_platform_driver_probe',
but does not actually probe anything. All clocks are registered via
CLK_OF_DECLARE, which happens even before core_initcall. So this
does not make things worse.

Also the OF node is marked as initialized by the early clocks
(CLK_OF_DECLARE_DRIVER) via the call to of_clk_add_provider(). This
is necessary, since otherwise the early clocks cannot be referenced
and we need the early clocks for the timer registration (so it's not
possible to move all the clocks to late init). This effectively
results in fw_devlink not working properly. It will tell PM domain
driver too early, that it may start probing (so a bunch of useless
-EPROBE_DEFER will happen).

Greetings,

-- Sebastian

--vkzhu7wafk4plwhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmW5C/0ACgkQ2O7X88g7
+ppdJw/8CHy0yXXXuEDrx70oy4owoZo5xIMHXN32hTvwFH9eVj8nYPtVQjOhGwJW
gVj28u1i87QbL246bl2ok/4PbStOC+OgniV1weSi8QWIoWJGsOK3UHy7FErWcXw8
khKb305Fc+aUwrdbgy0hbcoIH0oYnFQqnzNrG0yCnnCY6+Qshx1jxlHLBoWSOzo+
Cbm6FVZuwV4tVsoa7ORK06ZmNruyQ5q7uj1igUsPGhTuXO+QQSvZIv0jv14FN4ml
+mAVU2vn5C+4yU3AV4z2t9c/RxAS7O4OlQ22jNMgHnea2QiIMmzYCVL2mF5oe4pD
nn5KxT8qPTkBx5tOtCRVqc817ciG+ZCkYe0qxXvepxxtTV9y+tS9yEU6yPBzOeOO
CgacGJ5Z7Oe7msH30CjGiLX2wzdz3g2v7d+yt/DGHkUGgAniXI4Wz/ADiu0w+Mes
DwPsIUbVrWRfs0T6tilPCOul720EyNPUt2+gX4U+gU8Hts7NwSOYMNTyHx95aztm
XMHqOd+cDHdcZ4yL2BOuo7kkK76wz7/8N03WhV5i4psn4V7NADrF3fW3Xs9QMmaH
zYtPR6iUtnF30RNeNShgi3fOCKHJeg3Ot7nBQA8iNJLRnHYM5OPZ4CjFfqu9sUxx
bvctNp/h03OavnjOmRYh5DQO7vEIdQGvpJ8MF8hOEM288oxk1pM=
=NE/i
-----END PGP SIGNATURE-----

--vkzhu7wafk4plwhd--

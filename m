Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:34391 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbeIELpg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 5 Sep 2018 07:45:36 -0400
Date: Wed, 5 Sep 2018 09:16:45 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 02/11] clk: sunxi-ng: a64: Add max. rate constraint to
 video PLLs
Message-ID: <20180905071645.ibhcuq5coc6gl6k3@flea>
References: <20180904044053.15425-1-icenowy@aosc.io>
 <20180904044053.15425-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dces3elbc3qktb53"
In-Reply-To: <20180904044053.15425-3-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--dces3elbc3qktb53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 12:40:44PM +0800, Icenowy Zheng wrote:
> Video PLLs on A64 can be set to higher rate that it is actually
> supported by HW.
>=20
> Limit maximum rate to 1008 MHz. This is the maximum allowed rate by BSP
> clock driver. Interestengly, user manual specifies maximum frequency to
> be 600 MHz. Historically, this data was wrong in some user manuals for
> other SoCs, so more faith is put in BSP clock driver.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--dces3elbc3qktb53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAluPgtwACgkQ0rTAlCFN
r3RVrw//SRBv9iwkAWY2srlzma7Vg6gA74p/Sov6R2VLLRswuDAJ02FlMeoY9bLh
x2UdKCHEIvrf+257e+EzjSQiNgu1rnwLriQN/RfiyQJ1OcsTBqYE86/IF331GXDN
Yf0apxaCAJ3/5YE6ZYEjaeUujfJblUeC8QRdIwkMBIpE1BTw/LvIJsrtf/RJ0WY0
aIJN4naj/EOhiVj7YHFOi0NOVfO3uvTUT5Y888gOYHW+0emd9r6ZfRqCyGjuY/iB
TzH/huqFlzTzUVT57NuKbtQyzjiJ2JqDC9bbfrrIEXgqyh+xGuB/aaUPkf51PrZ/
mOW6kzrZUKgosRhJxf7XbH5dqG5EkTQMGOFzQLHrFBM1duHP+a57UwuIgzp1J9uw
En0aQ1dY3hrwF30wuM/Yc6ZK50s45jRY9C4wZ5HNmd+ZO5hWQ2J7PNJ5AWcEl2Ir
r7W9H1SIesFCDJmr83yYGkzG53m5akYu/H7aErqXQ39381PVDfAHI4ibIiIE7wOc
fWemQpkc5ytl4acgDiJFkrYNyQ6t2gW0Yd2VkoFBGIvVMhu38PKRaogzsdoUaBWf
qdtU87bfuGrzEQiqx+ZtnWrA+wK8cOcklZXsdaHb3cXJDM8pzmnnKCmKuVQaWqy2
fY5P6kpUyTKUxZgaJForBcXFWEKMzHWrVSl7bGhy+0x8bBH3Gjs=
=od8U
-----END PGP SIGNATURE-----

--dces3elbc3qktb53--

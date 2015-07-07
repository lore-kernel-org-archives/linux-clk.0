Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:37737 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750760AbbGGFKP (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 7 Jul 2015 01:10:15 -0400
Date: Tue, 7 Jul 2015 07:07:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: dinguyen@opensource.altera.com
Cc: sboyd@codeaurora.org, mturquette@linaro.org, dinh.linux@gmail.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>
Subject: Re: [PATCHv2 5/6] clk: sunxi: make use of of_clk_parent_fill helper
 function
Message-ID: <20150707050747.GB28632@lukather>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
 <1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
In-Reply-To: <1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dinh,

On Mon, Jul 06, 2015 at 10:59:05PM -0500, dinguyen@opensource.altera.com wr=
ote:
> From: Dinh Nguyen <dinguyen@opensource.altera.com>
>=20
> Use of_clk_parent_fill to fill in the parent clock names' array.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: "Emilio L=F3pez" <emilio@elopez.com.ar>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVm16jAAoJEBx+YmzsjxAgSqkQAJE/2/Kou1DG/Rpt6QgFPO5+
LPE5h6cJ5RcoACftRxBcz8JLQka1habWZdtSWqdmc3y78qWzW8QpsdqeEZq3g71S
miXmOnQy6GCBbw32AviTIiNF7rr+AaFM7j19kX2SalAbJBRmjvu7zaAhHY8HQhPx
uE1UeRlXoWbuOUR6VIs4QFQsgBL01u8POF3g4oqu8hW5Fae5b/+hhvdpbjo8MNpU
hlxCMv6rIQohQ2WRolsyzNnDqLD+npRmdUkXxIcUkwTCEIAZlUnYo60BhhtNM3bb
BXMySc79c4KhNDCJVo8bIHGPEAvpc+xuj8O3a4fv4MhYxs3zAqXBhf9F1b+TvLCp
B2hx9bKLTMdJOA8VDAtnYztREKcx9a8fi2s6wa33jCsU5Jt91yokNVJ5Ck+VUjBl
KceY6NfJNdJJNKlU/QE7OpOYwiG8LS/DihAvSLr/P1roWDVvg6guZ8N2hb1izFxg
3ALGm6TS61TcHYtCNbwFDTyxXuVh9rkJlmXE7FgBycC5gEUKcWtt8yzXR/aqsRDV
hPPu40cKX2zzzLMULHx2CYiRABV2qqBxU+hd4ToJaVmUnoxa7qSLAKxstVPPS06D
g8hm/MV4bMGv0VDnZLNx9mijiKqpvdAtpAFHVctiETUWDtOv8bzAHe2PtRQA5NGb
+C+4eZU28JUtDKOhIepR
=m2G1
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--

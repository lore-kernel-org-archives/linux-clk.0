Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:47773 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750745AbdDMJLM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Apr 2017 05:11:12 -0400
Date: Thu, 13 Apr 2017 11:11:10 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Tobias Regnery <tobias.regnery@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: fix build failure in ccu-sun9i-a80 driver
Message-ID: <20170413091110.wfbrzwyxpbdkwz74@lukather>
References: <20170410121544.13248-1-tobias.regnery@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fbk2vaxxeqq5ynig"
In-Reply-To: <20170410121544.13248-1-tobias.regnery@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--fbk2vaxxeqq5ynig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2017 at 02:15:44PM +0200, Tobias Regnery wrote:
> The ccu-sun9i-a80 driver uses the ccu_mult_ops struct, but unlike the oth=
er
> users it doesen't select the corresponding Kconfig symbol under which the
> struct is compiled in.
>=20
> This results in the following link error with CONFIG_SUN9I_A80_CCU=3Dy and
> CONFIG_SUNXI_CCU_MULT=3Dn:
>=20
> drivers/built-in.o:(.data+0x2d638): undefined reference to 'ccu_mult_ops'
>=20
> Fix this by explicitly selecting CONFIG_SUNXI_CCU_MULT like the other
> users of the struct.
>=20
> Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fbk2vaxxeqq5ynig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY70CqAAoJEBx+YmzsjxAgnskQAKCR1mgW/ykPnltlPp+6Ccz7
amtkFJFyG4MM7cLUZgAMAEIz8QkgayUdjykp5gqAapzROQstoweA89rkI1aMWs5u
xHe0buMxy2z9lY0nQjbehTCnWgFBRGBqmNOyu9DF6iMbbAeFFLLI66Uj4/nZ6oKw
FWZq4IoEsoslhv+VU5kZ8TPNYN8y6JvyBcrbVcKsh6E0C0W3Wgwgu6BeauIYmOvh
Cd9BBW3aEpwu7xN5kXSFSDktZDsoOej3eeUGLFuRDpUxlfkhmc+BRXn0i35bidZ3
XtmkrC98BlJt0olukzxu9AARbVtoyW2pkRE/Infs8p4SX0750pnRFg/SWzYrkbol
eO2j7eBF4oH14gSPqf5XufyiQWIZRXxP75zV4KEUEfQKOvN0W0vpmKWIMF/OIZNL
sMPsPPCT9r7CZtuQaePMXVWvZZLSMYzP1Xerw09LQLo8LBADhSPl8odb+8gXgMnh
XR0ITTtpVBsQxld4IbN8doLORXGNP7rAjy65y78eu/Y/5X8CebqqJtF1tctF+U8A
1y2+tMPuLwzop3v1eAUiBtF6FTIyB4Akm13UdtXKcvzfs1y6LqzqNRhqIR9Yccjd
eZB4RHrtpnR+Wj4EdYJ/yWvU9EDomVVCUEC7wFnfpeI9KJyAKYBvYtDNx+Hri4HL
PEbHRoZ/+p5FTr/almGN
=8G0a
-----END PGP SIGNATURE-----

--fbk2vaxxeqq5ynig--

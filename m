Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:32770 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753122AbdHBL5I (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Aug 2017 07:57:08 -0400
Date: Wed, 2 Aug 2017 13:57:06 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: Re: [PATCH 0/3] clk: renesas: rcar-gen3-cpg: updates to SD divider
 table
Message-ID: <20170802115706.ij3tqalr7etvl4gx@ninjato>
References: <20170801104603.10459-1-wsa+renesas@sang-engineering.com>
 <20170801162936.knvmsojiu7xibdxq@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6x7ck3ul4yetslym"
In-Reply-To: <20170801162936.knvmsojiu7xibdxq@ninjato>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--6x7ck3ul4yetslym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2017 at 06:29:36PM +0200, Wolfram Sang wrote:
>=20
> > Tested on a M3-W Salvator-X (r8a7796) with HS and SDR50/104 cards. clk_=
summary
> > shows the same frequency selections as before.
>=20
> Darn, not tested on H3 ES1.0 where it fails because everything is half
> speed there :( Need to rethink this.

Please discard this series. We need to respin it when we implement HS400
support.


--6x7ck3ul4yetslym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmBvg8ACgkQFA3kzBSg
KbYTmBAAtLBzKcEZLnGV+LZiS2ItpFvuiWVdsaDTQTV0/W+MVdp6byfIWngU9/EI
IphNCR/CBhGIQPY0c++Ioc3VTbC6Mqr+aJnya67WfXPQH9Nsut/US+Bu6qlVgy+i
P2wcFqysQKXoFUtLKKwmiGtz50m97pZOWKBwmDpIuTPjsCpFTErkE9PLgdIwlmSg
RTVb/CSQdtXDV6pljyzS0B7fFTYZ1S6z279OIlSLzsVEN0f9vHP1VhEASFYBv9/0
laDoK0J8atsWNnkjKY8bXUL6YrCB63u0YkXMiGY3uFqeJ5vCUjdBImFM4J1mmchK
jkWJPybS2JwiQUma/DUMCHzz1ZCIBDIUtr/MMhXMNidnhXwRZK9aLUwRdW01nO91
1RKXIjP0VFCOj7fW5uJMD9nAw59QN8M8DJzh3Ruap0aLMB1T4mvTQt5j7zt/vNeU
6g9TUjmm4qlSwRPQeKlIwAXAU+uC3AUt0jBiGHUUm/LC+4Zfo9YpT1k9yTDZjPh5
QU7LzxzOe2HCfJz4nBcpMW1PFHVqGHhLwEm6b3czf45i8Elyc/tH5nXVyOBKBtqE
hmAmMh+p9RZ8q9WsO4LZSivLhTSh14TCks+MT8cTzGBRc/VfD5h4VELjnN4kkmGZ
1lhbC/VRziK+JuRhA+5HyCxs07qVcTdTk6NE2XWzj7HkGP5/ZMo=
=SHR7
-----END PGP SIGNATURE-----

--6x7ck3ul4yetslym--

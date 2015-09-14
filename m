Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 14 Sep 2015 16:40:40 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: sun8i: Add the A33 AHB1 gates clock driver
Message-ID: <20150914144040.GD4684@lukather>
References: <1441977997-29041-1-git-send-email-maxime.ripard@free-electrons.com>
 <1441977997-29041-3-git-send-email-maxime.ripard@free-electrons.com>
 <87wpvu2vzr.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R6sEYoIZpp9JErk7"
In-Reply-To: <87wpvu2vzr.fsf@dell.be.48ers.dk>
List-ID: <linux-clk.vger.kernel.org>


--R6sEYoIZpp9JErk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Sun, Sep 13, 2015 at 05:13:12PM +0200, Peter Korsgaard wrote:
> >>>>> "Maxime" =3D=3D Maxime Ripard <maxime.ripard@free-electrons.com> wr=
ites:
>=20
>  > The A33 has different a different gates array than the A23, add the no=
de to
>  > the DT.
>=20
> NIT: 2x different.

Ah, good catch, thanks!

> Shouldn't the a23 one then move from sun8i-a23-a33.dtsi to
> sun8i-a23.dtsi?

It is, but in order to preserve bisectability, I declared the A33 node
first, that has precedence over the A23 still in the common DTSI, and
removed the A23 in the next patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--R6sEYoIZpp9JErk7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV9txoAAoJEBx+YmzsjxAgit4P/A+BLt/BPd5KfbOf23BV+u6K
Y7hkbu9FZL1EHnYSY3WI0woaEoyrjEAs21orU+GwgXKLHMfer5BL9lZhTFkd27OY
yFtGbHTglC89QbBCkm0+CjTK59GoBZLacCzyBoCg8MwDg/1UZ/NA4PCTRoamuf8x
wrg5i5/4cjo+T55s8AW0jTIk19hkYfO1w0Ytv4dLZFWJt75bLW0IwVCcmv8G64sb
zs2rD50RGztQAIiCqU3ZZYEbSuh3SHuTNHT0JnNkEDmevEdYO0JgnFB4qvpm6zo5
TDlFZGo2ARF3n0ALQVCRKMIUgMiPYGBWvSrqC7A/VqPXdf4f/jU9+NEsEx4BqBod
9eXTCSg8YUvus5XRIFHDr2h9MwI3AGL+Eu9Aa36mQcIhhhj6j9N3bBEY87bIb3to
KiJLbjsecMIni4R6vPrO6OM3vIlgEHMRrx9HZqevIEbcXyx15s0jJnm/bqsbQ0uQ
frya2uXNYwm5hMHAqYVdwSxk8vJAH8a/somnowmvQdAgYsJAx1TWV93qoQ8kk72R
YzoWP7mMF6BS21jH7N7CL71Qhzj+D88H9wmq7q7cd/CJp1KWIjrxL/gEmyALDi9z
4uDyposmqaHjupJcnhiEnaLlBJGxiDA+OJqmW2kc+08d3is7WQzs78IXh646DY/G
7PvWhjmy8fwXgR5hlvCO
=Djyt
-----END PGP SIGNATURE-----

--R6sEYoIZpp9JErk7--

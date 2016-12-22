Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/11] clk: bcm2835: Register the DSI0/DSI1 pixel clocks.
In-Reply-To: <20161221231446.GA8288@codeaurora.org>
References: <20161214194621.16499-1-eric@anholt.net> <20161214194621.16499-3-eric@anholt.net> <20161221231446.GA8288@codeaurora.org>
Date: Wed, 21 Dec 2016 17:23:18 -0800
Message-ID: <871sx069kp.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 12/14, Eric Anholt wrote:
>>=20=20
>>  	/* the gates */
>>=20=20
>> @@ -1890,8 +1976,18 @@ static int bcm2835_clk_probe(struct platform_devi=
ce *pdev)
>>  	if (IS_ERR(cprman->regs))
>>  		return PTR_ERR(cprman->regs);
>>=20=20
>> -	cprman->osc_name =3D of_clk_get_parent_name(dev->of_node, 0);
>> -	if (!cprman->osc_name)
>> +	for (i =3D 0; i < ARRAY_SIZE(cprman_parent_names); i++) {
>> +		cprman->real_parent_names[i] =3D
>> +			of_clk_get_parent_name(dev->of_node, i);
>> +	}
>
> Can we use of_clk_parent_fill() here? Or do we need to support
> holes in the parent array? If it's the latter please add a
> comment so we don't mistakenly change this later.

It looks like that will work fine.  We'll only be missing parents from
the end of the array.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhbKwYACgkQtdYpNtH8
nujGORAAieBRc84uzJWcshq20Wy/Q77M6dVgqDhggs/J13l2Lx6LpgAo9VbwUPsk
PWW7UeOvxp0nG0R8FZW4xFQcz5A9gR9PwG4h+o78fAh+57PQpS51uWZBxsFX6B7O
4J6Bo7OLD9+FMawWr6huLXoEL8c3w8Sno74DqvOlBo703QNRSgNqbIEZWRvJd8xy
2VnY+laB+HvBlRVCdlrNi/3ZpGhKuyVP0mVqD8+qdemV/iqJ85pw/G+5m6rS+0bG
ilEJWOSlYjxPI1VWG08W+2D61y9CHQiiaWfhuySm1o7u30qeiTpEyVGpl55oln5U
Pcu7lZNsLhdak7ZUqj1URkP3nzbpNhyOQKEMnBMYjsIOG/VuOZekKIVAWmfph3Ri
jUDJYMOE5udOUWDaax86358UXbQIGg7HlJIitJPcJbPYxHyyBUDavYJVhHwNMEvs
zZSbRyWUyxbXlzKv+gzze0bDyiG0L6XcSCk18n7bpzSS4fjouG0tqHRUFEoIeTag
AQ546FIgNDE2Yk0IQxawE2HDRPBuo7WlN6Obo06km0p76aRczmL2Jtbx2XjE/VTt
NPxkbNxaDK9qBUcfknqf+eWrc5WErPN1+DKjkJ5CNSA43nyZ1XvNQL/s5QwVgiAG
ooPTs3GzfZoCEfuk17X2kXwt8Dxsbh27448qsbYVIIMyf+vEk1M=
=rmEP
-----END PGP SIGNATURE-----
--=-=-=--

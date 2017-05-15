Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stefan Wahren <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Phil Elwell <phil@raspberrypi.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: bcm2835: Correct the prediv logic
In-Reply-To: <1373231207.445862.1494870459462@email.1und1.de>
References: <20170515173504.11337-1-eric@anholt.net> <1373231207.445862.1494870459462@email.1und1.de>
Date: Mon, 15 May 2017 12:03:29 -0700
Message-ID: <87bmqundry.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Eric,
>
>> Eric Anholt <eric@anholt.net> hat am 15. Mai 2017 um 19:35 geschrieben:
>>=20
>>=20
>> From: Phil Elwell <phil@raspberrypi.org>
>>=20
>> If a clock has the prediv flag set, both the integer and fractional
>> parts must be scaled when calculating the resulting frequency.
>>=20
>> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> ---
>>=20
>> While this is a bugfix, I haven't put a "Fixes:" line in here to get
>> it automatically backported to stable.=20=20
>
> sorry, i can't follow. How should this happen without "Fixes: "?

I didn't want it to be backported to stable, because of the risk.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkZ+4EACgkQtdYpNtH8
nui6Vg/+JF2r+ADnHhGGUEnfljusxqkXGMnckdMqh9WzyY6mlVVP6bL7qcOk+1ah
4nW9usP7HeTMvjAcCc4a8hb0x5xqKiNzYvAAcIvqheEq3ONyID0eqJRf07M4D02V
kUZ5hMtEajw7Lx8/MiZix51PbdI7JjdDs+vhvhzM3L2eF2MHRGr3moFFoLru6DJn
jq9Pm8oGy2ZkR/SXtbDiLiEYm+9XG6PntNr48hX7Ecgr7/kl5TLBPP11wkHDbRYZ
lMQ9Yss/e6YUfgHNMJhPYyBUc8i9ROHevi2gfgQrAEH/Oa6h2mEpfZ3YSpbWC1pZ
HZx2o6MDm64DOWRUvL3ZbQxkV7RMuSf0w7r5DG886RUSdbagvZQ7iXWUQfduXc+4
/bi31OIQWlnLme7wPS2VFYmuSngYHfEl1OaIF9N2pQdK2sVsNkK0kurflB4+ZpE/
iI5a9k9u5/k8izDhlCuORJd0rlZPRzauXSCnu3kzIKDkotZ2jgVtX0UfKRK9Sx/m
4weJ8W4IfVyySo1Psx7Se33O95q8+pfJfATIx5DXCPBVDe7BhsPteQ9RB/KeChoW
X55SieI7Hn9MDtu4IqfhLA267NgpuH4uuVFk323sqV/BWc8zu/JDJTA6OqdXNNt/
/65qt12GU5fmZBWqc9to3pcNr6Yx0xhNc9tRHD26U3iI7CW1gOk=
=pcvU
-----END PGP SIGNATURE-----
--=-=-=--

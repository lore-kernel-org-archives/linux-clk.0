Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: bcm: Support rate change propagation on bcm2835 clocks
In-Reply-To: <20161202205021.074fd441@bbrezillon>
References: <1480626020-20031-1-git-send-email-boris.brezillon@free-electrons.com> <1480626020-20031-2-git-send-email-boris.brezillon@free-electrons.com> <87lgvyf956.fsf@eliezer.anholt.net> <20161202205021.074fd441@bbrezillon>
Date: Fri, 02 Dec 2016 13:13:35 -0800
Message-ID: <87y3zynif4.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> On Fri, 02 Dec 2016 11:01:09 -0800
> Eric Anholt <eric@anholt.net> wrote:
>
>> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
>>=20
>> > Some peripheral clocks, like the VEC (Video EnCoder) clock need to be =
set
>> > to a precise rate (in our case 108MHz). With the current implementatio=
n,
>> > where peripheral clocks are not allowed to forward rate change requests
>> > to their parents, it is impossible to match this requirement unless the
>> > bootloader has configured things correctly, or a specific rate has been
>> > assigned through the DT (with the assigned-clk-rates property).
>> >
>> > Add a new field to struct bcm2835_clock_data to specify which parent
>> > clocks accept rate change propagation, and support set rate propagation
>> > in bcm2835_clock_determine_rate().
>> >
>> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>=20=
=20
>>=20
>> A possible simplification would be to limit VEC to only PLLH_AUX, since
>> that was how the HW designers intended it to be used.  Then you could
>> just have SET_RATE_PARENT flag, rather than the bitfield.
>>=20
>
> I can rework the patches to do that if you prefer.

I'm fine with the patches as is, just throwing the idea out there.

In general, I think the only automatic parent switching I've heard of
being useful in the platform is I2S's clock being able to get a
non-MASHed clock when the rate divides evenly off of something.  Other
than that, automatic parent switching seems to just get us in trouble
(we've had bugs with PLLC, and we wouldn't want any non-VEC clock to end
up on PLLH_AUX either).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhB4/8ACgkQtdYpNtH8
nuhHmBAAhmBPEBRQB9Zuqz1NXZj45nAhPxKDBGIf69jKhlRv4uARKapUsrQdlSZf
bQiobxolliAcur74qBRZkPdjLBNleoW0SAHmCqYxcLI9kFFh7hUCO6N33U5DLZKu
vHVIvMlmXT7xPBVG1v9PGKAjHi4uR8SajH7+iEuJvMeUYH/EVy4kGYCw2x8TmkqB
mR6DkLarplGfL5cC8MKwqo3x7mFSdR+nSp/lr4tN3xud8CaAJcEf0qYMyLdup6UW
Q2tPFwtVU/Sq3+es9dQQv4JX9AmKjpWYZXCkfGebQ2tsS76B4VfRIqHEsDH0SeQ/
HHRRiX11lDzx+Jv+chAlidDRfrFT5/hZhHS5TNOiTlYbEl1WKYbhtqdSdvKxCDnH
5fRIDNsziQqH/Wv+bzqAF1Ym+yEakvsc8YF+ONJXRwZ4etkeBk4pjnAWnsOHOtdt
K6BfA+GzLtz0WcKOh3UYa2gJiv6kSGJ3bJ8KOhrlt4sR4YmAsP7RDKj2p//GLek8
0bPX/9YABn576tI0kKy2AV7TbAIJDkNpleYuFiuprMaA5k6drOnFdUb7jgYySDje
m3Q/NVLblvlURnGXRaschwwctaAsjcvLlB9APLoIaparcD2cSKzSJnzKxsAnNv23
k+Q5WcVeukbrmY7Sx6wn3bePsSaBvl+i2+BP1aJO954DcFu3ogw=
=wx/7
-----END PGP SIGNATURE-----
--=-=-=--

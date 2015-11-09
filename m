Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: bcm2835: Support for clock parent selection
In-Reply-To: <20151105185336.GJ13534@cruxbox>
References: <1446678502-16243-1-git-send-email-repk@triplefau.lt> <1446678502-16243-2-git-send-email-repk@triplefau.lt> <87si4l2oek.fsf@eliezer.anholt.net> <20151105185336.GJ13534@cruxbox>
Date: Mon, 09 Nov 2015 08:38:50 -0800
Message-ID: <87h9kvw2jp.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> Hi,
>
> On Wed, Nov 04, 2015 at 06:03:31PM -0800, Eric Anholt wrote:
>
> [...]
>
>>=20
>> It looks like you've dropped the use of the divisor off of the PLL
>> channel when setting a rate.  That seems bad for all the other clocks in
>> the system, and a feature we couldn't lose.
>
> Sorry, but I'm not sure to understand your point here. Are you afraid
> that clocks such as PWM, H264, etc, have lost the ability to divide the
> rate from the PLL or oscillator clock they cosume as source ?
>
> If so, I think it's ok. If I'm not wrong here, clk_set_rate() first
> calls clk->determinate_rate() then calls clk->set_rate(). This patch
> makes bcm2835_clock_determine_source() to only select the parent to use
> and does not set the clock's rate itself. The clock's rate is set later
> on when bcm2835_clock_set_parent() is called.
>
> bcm2835_clock_set_parent() still divides the parent rate so we are not
> loosing this feature here.

I see.  You're leaving req->rate as-is, so that it gets passed back in
on the set_rate() call.  Since you've chosen only a parent with a
rate greater than ours, we know we'll be able to divide into it.

This has the downside that anything using the min/max rate clamping
doesn't get to know before setting that we might be out of bounds.

> It would probably be better to have bcm2835_clock_determine_source()
> selects the parent by choosing the one that provides the rate which,
> after being divided, generates the highest but lower rate out of the
> PWM clock itself.
>
> Moreover, if you agree with the above modification I see no reason to
> not call it "bcm2835_clock_determine_rate"

This sounds like what the function should be doing.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWQMwbAAoJELXWKTbR/J7o7V8P/0xXA451BeJ+dTpAVjcRCXyF
nrB8oxuHALNqYCgQZI+jCYh5buSjFOn3hx79gQlEVLoLtD8JF8Jh0D0t282faUA9
v84y1gPIIhhPEAU9JFsuBqR7r8W+bAyBYp6EKH5334GxryfGDpiXcDhL7HZqxuy8
MHTvuRExHOApLa7Pu5xjMEjFl9MVjyN+vkiCn/kcI7dayCHle3wmH4Z6C/SD6UJ6
BHi/6VvGwlpmsg13/2fXjYpNlOkJtf0P/Sc64ePx9ygBERaZFJd0igXWL3UkYTqy
qNMZKFauSSMmu6XKwZBdNl+4cvaHU0tuUB39rUZsQrrpHQAoiEKaVqmfGBHWa4P6
n5eqWSC2UkXSqxV48GKwmvQROo2xey1iXy3TFM5y6yQ6GLVSvekOjpFemuw72f85
15KYQqth5++SVWhSn9fo9MjgisonBaKcc1+vhNmWS83A9vCIJ7XfCsGbeIarcuvj
72mWOB5fXrciuCuSgJYBaFSLq1noiw02ZyqejI4+Idsy683sFc4X0p19XrlEbiOu
kZbSxrK/1PTqg9e3R9caW2tZP3g0mxKQG7f7lEu7EjJab3+g9ab8FQi5Zvj7E6S9
vsE4n9iisTXgS5rQIBIhAfWce0SrQFlGYZ+SiMYj+Kn9bGW6pAvQf7iYggDKV6DC
22J+XItjnp9B/VcHPyRk
=2G1n
-----END PGP SIGNATURE-----
--=-=-=--

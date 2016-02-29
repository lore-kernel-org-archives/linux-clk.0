Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Martin Sperl <kernel@martin.sperl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] clk: bcm2835: expose current divider, parent and mash via debugfs
In-Reply-To: <058897BC-1090-4171-B239-D2A289F1D626@martin.sperl.org>
References: <1456755616-2472-1-git-send-email-kernel@martin.sperl.org> <1456755616-2472-3-git-send-email-kernel@martin.sperl.org> <87h9gr5jt3.fsf@eliezer.anholt.net> <058897BC-1090-4171-B239-D2A289F1D626@martin.sperl.org>
Date: Mon, 29 Feb 2016 15:13:00 -0800
Message-ID: <87r3fvjekj.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Martin Sperl <kernel@martin.sperl.org> writes:

>> On 29.02.2016, at 21:43, Eric Anholt <eric@anholt.net> wrote:
>>=20
>> kernel@martin.sperl.org writes:
>>=20
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>=20
>>> For each clock expose the following values via debugfs:
>>> * current_parent - the currently selected parent
>>> * current_divi - the integer portion of the currently set divider
>>> * current_divf - the fractional portion of the currently set divider
>>> * current_frac - the current frac/mash settings for the divider
>>=20
>> current_parent can already be found through /debug/clk/clk_summary quite
>> nicely I think.  If we wanted a per-clock parent file, that seems like
>> something the core ought to be doing.
>>=20
>> current_frac is looking at a bit that doesn't exist for non-MASH clocks.
>>=20
>> divi/divf are OK, I guess, but don't seem particularly useful given the
>> raw register output already.  A cooked floating point point divider
>> debugfs entry would be nice, but I don't know if we can do that.
>
> The reason I had those is because I wanted to allow people to
> see quickly what is the parent clock and what is the used=20
> parent and divider=E2=80=A6
>
> While discussing with the PCM/I2s people they were always concerned
> about those details - so I needed to provide them with a way to access
> those things easily. And explaining to them the register format was -
> for me - out of the question.
>
> Especially the mapping of =E2=80=9Cid=E2=80=9D to real parent was a bit o=
f a pain.
>
> What do you mean by cooked? Something like: "33+27/4096=E2=80=9D?

I mean, given your "33+27/4096" example, "33.006591796875"

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW1NB9AAoJELXWKTbR/J7o9n4P/jIIEVdyWMi/MtBh76GvS0F1
QP65V/eJm/pwyIy0lTcfmXwJx+DbAoMq7ZA6SLMCSopLNchUZMF4Xe5EgWTGf2JR
OhjwsGFQULxTVe7aOu3uwTOQe5C94UZVedaoNOTPPQ21zBwkUKInSD7t+V5zLiQf
XPolLFqo0W2HWyduXxYXg3UrysBfgVvFSzz4j0qqzYvoJ2EgN9rAgCoA7SH9Xyjn
1C5Mwy0TX+Ojp5YdD0CVDd7ecqEK5zjIP/VKdntvMABZN+/U2hI786rqMFrMjojG
hN2VXa/0hKSWAh+MQjnLZgHJ0OLa1iKHmBHdLIMX/EkQ/4GInwFYceYu1TbqkzJG
fsYIRL4tCwYcN4uD37Tjr0Z2M0p60Hb/irdlwcYKjMQJfsYXG/gmkggQJukh3KsB
n9p44Z1hQIkmw9xphume3i3P30+q76VJhNpAUp0bHds43d3a4flZv/rH7gkfjUZw
Gq9c+HvmL+rHcu4GyDY9oORg1DDQ9gird9+/dD5ljLmBoicjOmHQpRXw97H/awqD
VG5KfpxcjEawo5UvR6V0g2eG05QzKXjFIRDd5d0eXCW7yBNSUPoqTM+J025mkrYJ
1kN/j9sx5eSmKoJ5rO5KATFmjXHKLK5OTyXAP2q/Ko2IbSpABc7oRztaCw1i1wWD
Izr4pI8tR5fLXLHvv8lg
=luwa
-----END PGP SIGNATURE-----
--=-=-=--

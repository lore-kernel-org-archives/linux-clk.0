Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Martin Sperl <kernel@martin.sperl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 1/2] clk: bcm2835: mark enabled clocks with CLK_IS_CRITICAL
In-Reply-To: <5CC0D984-91E5-4401-8AB6-5827269C4395@martin.sperl.org>
References: <1461951756-16804-1-git-send-email-kernel@martin.sperl.org> <1461951756-16804-2-git-send-email-kernel@martin.sperl.org> <87zis8h3pp.fsf@eliezer.anholt.net> <5CC0D984-91E5-4401-8AB6-5827269C4395@martin.sperl.org>
Date: Mon, 02 May 2016 18:13:09 -0700
Message-ID: <87wpncueoq.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Martin Sperl <kernel@martin.sperl.org> writes:

>> On 02.05.2016, at 17:36, Eric Anholt <eric@anholt.net> wrote:
>>=20
>> kernel@martin.sperl.org writes:
>>=20
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>=20
>>> The bcm2835 firmware enables several clocks and plls before
>>> booting the linux kernel.
>>>=20
>>> These plls should never get disabled as it may result in a
>>> stopped system clock and more.
>>>=20
>>> So during probing we check if the clock is enabled
>>> and if it is then mark that clock with CLK_IS_CRITICAL.
>>>=20
>>> As a consequence this will also enable the corresponding
>>> parent plls and pll-divs.
>>>=20
>>> This is intended as a stop-gap until CLK_ENABLE_HAND_OFF
>>> becomes available, at which point it should be used instead.
>>>=20
>>> Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
>>=20
>> I still think that we don't want this patch.  We should be able to
>> disable clocks that the firmware turned on, unless they really need to
>> stay on.  If you have troubles on the upstream DT, let's talk about
>> individual clocks.
>
> May I ask you what is your main concern about using
> CLK_IS_CRITICAL as a stop-gap/in general?

Burning power when you shouldn't, which is a bug.

> Also the current situation of the machine crashing when releasing the
> PCM clock when the parent is PLLC or PLLD is worse than having some
> clocks/pll running unnecessarily.

Are you saying this happens on the upstream kernel?  This sounds like a
bug you'd see in the downstream kernel because they haven't hooked up
the clocks in their DT.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXJ/slAAoJELXWKTbR/J7ounQP/jFCQevkHaYFc7gH4vXGKlUe
fCHnkNa0DiexBTUXYuIBVLedBj2aUMEllR63/6dY9d/RuwLSBA6x017nHm9TE0NI
AWgQa/HxM7OaRrDJw6JLkcr6DndekTg83Exdy0UGNG+g01l2E2XcGFp8yBwdMMDP
O+ba0Pnlhq08PbKe0uFWmIK+Kt13vdGFaKjgHOLBWVYA6Sj/IUnSkQK5A5e8KKmC
7kCRRv27WhfRpgD1C9oL4jE/aGTxXu2AeRIdNz/iSd2lQ+XssdVHNiXU79GCvPFR
J68eR2gIDsQ81zaa2FGllACAQ0bbbxoN+F/jVS6EciFrO6CB6LslNrVVD0+TXC9i
s/n2E7b2GhJmaXvzfCNDnxMKjEz9WVM7Fvjc3GDPENx0VK7hc6tk+PRPjMHt5tDH
Vog5r4RE3keHRJNwcTND12jT5gfz08nRHmS903chZcbhgXX6Rf6ERMlgT/vEXMip
4YjqL5uV3jQXxQVIviVEvJMUdyXL5UEvJ+fJQDLGM88URV85XOdwfXHdjy0VeATK
bnxXxBlViSH8WyypL4NmGSx6iujhMO+2Oy0HAW9W9jaC8kJPbOoE8VwHgZI8vsb+
CHIbyykrt3ZibjxsuK7pDAjBp/QGKfg8oCaWRKeRuEvg5Mz5r49xSPAmAzMlxcRm
aKjf3mkiPx4NFYq2vjFR
=LZWO
-----END PGP SIGNATURE-----
--=-=-=--

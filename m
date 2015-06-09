Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 1/7] dt/bindings: Add binding for the Raspberry Pi clock provider
In-Reply-To: <1433807940-15328-1-git-send-email-eric@anholt.net>
References: <1433807940-15328-1-git-send-email-eric@anholt.net>
Date: Mon, 08 Jun 2015 17:03:05 -0700
Message-ID: <877frdague.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Eric Anholt <eric@anholt.net> writes:

> The hardware clocks are not controllable by the ARM, so we have to
> make requests to the firmware to do so from the VPU side.  This will
> let us replace fixed clocks in our DT with actual clock control (and
> correct frequency information).
>
> v2: Include the dt-bindings header in this commit instead of the next
>     one.  Make the clock indices match the firmware clock IDs.  Rename
>     the binding's compat string.  Move the firmware phandle to be
>     under a vendor-specific namespace.

Having failed to move the versioning bits below --- again, I'm adding
scripting to hopefully catch myself if I'm about to do it again.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVdi06AAoJELXWKTbR/J7oC5MP/3RZkzDIfw5aAV8LBpDvL25j
5unHXlHhwR607gbIC6ATeodG3XncC0KkE+K1L5lf4FhkR2eur+L6KbdqUg999Voe
WHNCBBbp7la/ZsK5hYkDoextVvt0CQBA5Zaj5XzT/G4SAqlIflnwE0bQCYHW1MyE
zAfCsNRyObYo3ApwqHgAeiSBAoHvC0R04RWsQhwM2rwd8t69GuRjr0PnuzAmoHgs
sUZ/fSO9h0U8tdPS39qhID6qu/9UYGXSI87Tm/+ttWgjcqFlf1TEsZsPO020IdJT
9BL6RTwLwhHg18NRo+xj0EYC6gqOMCUUeeP5zcYQ0KiKUQ81dwsqBZZJ0K4gqPu7
2Ca1zJNlidTa7HqHf5M/hM+nINrHfG5cV3ZvUJt8XoBi3gXx7WcHeBQdeNOSAW0f
/JhxJ3UrA85kwhGajY4bGU14iUytV9g8RH/tnNXRttglpRfythNGbwQ+DYAPp4XH
MPqMtVZ+s9+6IsG35p6wt3XZ2MzooN6v7HSj7zJZKK1PWTEiv3RS/T0hj0Nof9cD
Gn6cQvZLUx5O9+eO0s4gqET9p6cyn7MfqcsmjL1egVSJggRlUBMprnjM6MsStiiF
NbDOvWBSSS5FEccieXron4tMQbr4yiJAfqx3eCxH7H3Yl3Lec7o/FdU12VTXcRG/
chfWui4ro/30rNy4sVlr
=cl/e
-----END PGP SIGNATURE-----
--=-=-=--

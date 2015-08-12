Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Michael Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 2/8] clk: Add a Raspberry Pi-specific clock driver.
In-Reply-To: <20150811211733.31346.11122@quantum>
References: <1437420787-32137-1-git-send-email-eric@anholt.net> <1437420787-32137-3-git-send-email-eric@anholt.net> <20150811211733.31346.11122@quantum>
Date: Wed, 12 Aug 2015 11:04:05 -0700
Message-ID: <87wpx04c4q.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Michael Turquette <mturquette@linaro.org> writes:

> Hi Eric,
>
> Quoting Eric Anholt (2015-07-20 12:33:01)
>> +void __init rpi_firmware_init_clock_provider(struct device_node *node)
>> +{
>> +       /* We delay construction of our struct clks until get time,
>> +        * because we need to be able to return -EPROBE_DEFER if the
>> +        * firmware driver isn't up yet.  clk core doesn't support
>> +        * re-probing on -EPROBE_DEFER, but callers of clk_get can.
>> +        */
>> +       of_clk_add_provider(node, rpi_firmware_delayed_get_clk, node);
>> +}
>> +
>> +CLK_OF_DECLARE(rpi_firmware_clocks, "raspberrypi,bcm2835-firmware-clocks",
>> +              rpi_firmware_init_clock_provider);
>
> Do you require CLK_OF_DECLARE here? Could this be a platform driver
> instead?

I'm not actually sure.  The common pattern seemed to be using
CLK_OF_DECLARE (130 files using it versus declaring a struct
platform_driver), and it seems to avoid a whole lot of boilerplate.
What would the advantage be?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVy4qWAAoJELXWKTbR/J7o3KwQAJAra/7pyl2RZNvCrGFZ+oOX
hnl3Ux94wIOH2nphJi5UJEYI+ULX3mT0nvQ1cK8PcjDlCCemMvY3/aqo0no4ry35
uFsCGVXw1J0oWePpudsBq1/HOjjrNsanJGkOJxb2V0qI1mOCRHGhYVadkvUCEnC4
d8CmkbDh46du/NNF7z9JC/RUAjjNWMFnjv7eQFiWBeutyE90Dz5HQinJudQ6AN7L
GOO7vuy8CcRJVjWnSNj1KC9tHhF97UFU8J1DzeSgWuXCu7wQdDahY+D4K5K6s727
chENVI7i1NBeKyLWYU8niNuswxdyTiUvUM1a9q44Tzv5PqkjkTaHC8nJWUzbgiAT
kOA9huVAKzX/fy2ClkGRr8ppwtC5A6HSpMcBnMykj351IelDT6WOOtZuSPfiW3Ge
jxliHuNSYL5yDjE2tsy/o7zOKoUwQkqAtL6pgKZ/sdF7MPZL3gVppvadGPU94gQ/
GqaaOzhpVs+9KAe9AQJoC2CKouTRv1fCKCOvu3s/EEnnkIT/EY1NhliK0arPHTtu
tEOXVm1nHOj3r/nUVABfAJwnYLUDu/QPof0mJpDMtRmsu3H9GQdYpZFkLl0p8lhk
b5RfSkM57C9npsRHveH66l6sQttYdFtrpYXeQ2GjDg0f7+sO6/opUyyJsQw/OYdv
hUulnqY+4UIIWFo1V0IS
=zGnp
-----END PGP SIGNATURE-----
--=-=-=--

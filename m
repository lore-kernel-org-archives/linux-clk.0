Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stephen Boyd <stephen.boyd@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 04/34] clk: bcm2835: Migrate to clk_hw based registration and OF APIs
In-Reply-To: <20160601231533.9354-5-stephen.boyd@linaro.org>
References: <20160601231533.9354-1-stephen.boyd@linaro.org> <20160601231533.9354-5-stephen.boyd@linaro.org>
Date: Thu, 02 Jun 2016 11:25:48 -0700
Message-ID: <87r3cfa1n7.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Stephen Boyd <stephen.boyd@linaro.org> writes:

> Now that we have clk_hw based provider APIs to register clks, we
> can get rid of struct clk pointers while registering clks in
> these drivers, allowing us to move closer to a clear split of
> consumer and provider clk APIs.

This looks good, but it'll conflict with the fixes for 4.7.  Could we
land those first and then put this commit on top of that?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXUHosAAoJELXWKTbR/J7oYgkP/i34kKHmGLCvP7DMuGPIBtYh
vcyP4KM7x/4vw9q9jF3nYLpANHUYxm8nFc6qc8tbxXHQslf6/DaHKwk8tgGxOz4g
Xr/SIDKuxE3O8H4+zD5sIT2qMTRri5qXev7SZNzfVc75g8+eViJlUCkcWjc1CjOw
6VX3Plpz6x3i0G+vHySVFlpyd2liLNwc6BHK+fNjrRhBSLSeRmIChSzwNSZJJMIo
LGbLBpaCX2310VWcqgS6gmYoe60kz7X4SARNyJnU+4E4x180yGdtN8m79RMb5KIf
I+rRSjL3I2JXkuMj7/zCmcjpAppChMlatW0tWG3OELS7AD3EgN+a5oiQOSXeO7ai
HQHnRmE4K2ykdUXfVQZjUCVn19Ku+OSle8Qwr+dJp3zX6jpVNRBnEIyG2N0wWFvC
+cz4Z7oHxpaMT2Z/VawJLtHpLHmeXdOJVKIW/X58HY5YGeVSV/AgNGpQbXIQpuIC
xNObD2MAFWQ1T7tsJt1jRM4HbpStEfT6TZGGDI0JPZo8mUExldywAuQ5f1QJyYuD
4ZPe+S4o6jllABAv8on6AZCsPSmn5qJ3adcTni3tupQ+tJqYg13W1QvJupI37JKe
1hO2ok4T4AE/OaLhtgeo7WG/QB1L4zawPdHxSCAWubNiYZY/iIbJ4NwBaUc7VSPz
8G47yAdGJB6yfN5CoMx4
=lFyZ
-----END PGP SIGNATURE-----
--=-=-=--

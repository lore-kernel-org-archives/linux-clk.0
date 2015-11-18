Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v2 3/3] clk: bcm2835: Add PWM clock support
In-Reply-To: <1447251765-16297-4-git-send-email-repk@triplefau.lt>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt> <1447251765-16297-4-git-send-email-repk@triplefau.lt>
Date: Wed, 18 Nov 2015 10:32:55 -0800
Message-ID: <87bnar2m5k.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> Register the pwm clock for bcm2835.
>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/clk/bcm/clk-bcm2835.c       | 14 ++++++++++++++
>  include/dt-bindings/clock/bcm2835.h |  3 ++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 2b01a53..db378f3 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -39,6 +39,7 @@
>=20=20
>  #include <linux/clk-provider.h>
>  #include <linux/clkdev.h>
> +#include <linux/clk.h>

Stray new #include?  With that dropped (assuming it's unnecessary),

Reviewed-by: Eric Anholt <eric@anholt.net>


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWTMRXAAoJELXWKTbR/J7oJ8MP/2uB5Lh90lPbrHwceAuB3EDd
KH4fDiWQimeDVblKTZ7l2AHnJodxxjMWTsy6n41AcN/nhJkuS3GRG1KumaLHFk3e
o3c+YxVu5FH70WtX56V6YDhCxPkdtw+HeTqIj3fSnlADP+w2+qZQWBAyIPkvLbEi
EZmax8ig9IJLqWo4g7EZv5YeP73jz9BtB7230OlYKEyi+YUO5xRuB+D5dfh4krU6
/xG/97j3iaQQ8HZzOrZCVBQkQkK4rQ0qq1AiQk2vIW51fACtzFUSJpJvDaaauzMq
QG9LpWrNs34QA9f4aYrG/eeZh1KQQZxzhuHNODiaHsBwVcoqKZw9R6XYnn7DJvAD
zx0PUM/zIQ0UZSj3lUTifr4CuOFBmcv9ZPnC3gk4aVzQ0We/02l1MVGhmAFGCOcC
9bRJgUR3H3mNsrwzTm/3XRGeHdcy+lpQXbZ3RO+GYfAcbfil4LrfacDtj4vceZ29
DALCS+eTqPci0gjLYJUMhpJkTtgZ3k3yzt9c2VnQlBqQNkbHDiHGzXkOdgkbQnqZ
j6zymkTY9EaAP7W+NeqghP8rM7TrXYl7TX7hiOLIw0W2cvXjhhVIjshgesADJ/Xv
yTurM5sYS0VwcWhqZxAbi8tttcxn8lUScdx82eaoIm749lggttZBvrvTFLgompbE
hntGLmkRRckMf001QLXU
=iW2a
-----END PGP SIGNATURE-----
--=-=-=--

Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Mike Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v5] clk: bcm2835: Add support for programming the audio domain clocks.
In-Reply-To: <20151008005532.GB26883@codeaurora.org>
References: <1444181140-3570-1-git-send-email-eric@anholt.net> <20151008005532.GB26883@codeaurora.org>
Date: Thu, 08 Oct 2015 16:44:31 -0700
Message-ID: <87h9m17wo0.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 10/06, Eric Anholt wrote:
>> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
>> index dd295e4..b4d4421 100644
>> --- a/drivers/clk/bcm/clk-bcm2835.c
>> +++ b/drivers/clk/bcm/clk-bcm2835.c
>> @@ -17,10 +17,273 @@
>>  #include <linux/clk-provider.h>
>>  #include <linux/clkdev.h>
>>  #include <linux/clk/bcm2835.h>
>> +#include <linux/module.h>
>>  #include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <dt-bindings/clock/bcm2835.h>
>
> Please include slab.h for the kzalloc usage

OK, I think I've done all of your feedback now, as well as Stephen
Warren's.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWFv/fAAoJELXWKTbR/J7oL7sQALQoj96aMWkxSouBnDrm8qdy
Z6kMVu/djxZPQTf48FRckXfTeaV7rNslxnJV0uWCxhTf8JPKkXvIUMvod46QpEnE
FKAhuRwG9NQubiw8+ilHv9TIbRwEjtQ8qGO1/2mB+mizHtu3pLum3tgAoqYBUqcn
M4EA24IUhX2OBFVaNb1pycglrHEFmRn8vTQCZWYMmR45SUXQK2Jgc28LPhLURX7O
Mh3dhS/HwLeeYQSMHZvDsCoq3ixRyU7KuG2kSyKbkHWigLobkStEcI1Tb9rFQvPP
zVBmPX8XuiQIK9kZx8Qu8Qiab+GutT7mcofO1QIdTLqQoGv2IsW5xPeVrTjTWNyA
7cdVPAiVqx2HY6VeIafAKbYHSHsFYMpz+ypOFfESzVfXMtbyErYpUYGmxf5SazVY
D1CsWavwg2XkXwOyqbQns8WagLs6S4acrSSjwu4qPa/I8cwLDlV+vyxbdnycDtL9
LydyOtIivb/B95oPvJ7RFC2IeOylu2LYdWQhH/+QZ9cHM9XgXiVHnxRh9oTe3RBe
sypdBgaCijK3DB842l+7EcA6MynN1IMt0WP5pWvMVExhufrgJckKjU37kyyTwW5H
RIEz73KC9+k9wBrYkqd9UOIDT/XAOP21dmvypRTqktMAsUmdXjOVebno42iuVfke
H9T2v8y47Jw4Sz8VSC71
=wiOp
-----END PGP SIGNATURE-----
--=-=-=--

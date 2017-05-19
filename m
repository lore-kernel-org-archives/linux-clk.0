Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>, linus.walleij@linaro.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/pl111: Register the clock divider and use it.
In-Reply-To: <20170519001328.GA20170@codeaurora.org>
References: <20170508193348.30236-1-eric@anholt.net> <20170519001328.GA20170@codeaurora.org>
Date: Fri, 19 May 2017 11:12:18 -0700
Message-ID: <87shk0g1h9.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 05/08, Eric Anholt wrote:
>> This is required for the panel to work on bcm911360, where CLCDCLK is
>> the fixed 200Mhz AXI41 clock.  The rate set is still passed up to the
>> CLCDCLK, for platforms that have a settable rate on that one.
>>=20
>> v2: Set SET_RATE_PARENT (caught by Linus Walleij), depend on
>>     COMMON_CLK.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
>
> One minor comment below
>
>> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl1=
11/pl111_display.c
>> index 39a5c33bce7d..2d924a6bf43c 100644
>> --- a/drivers/gpu/drm/pl111/pl111_display.c
>> +++ b/drivers/gpu/drm/pl111/pl111_display.c
>> @@ -288,6 +296,126 @@ const struct drm_simple_display_pipe_funcs pl111_d=
isplay_funcs =3D {
> [...]
>> +
>> +	return 0;
>> +}
>> +
>> +const struct clk_ops pl111_clk_div_ops =3D {
>
> static?

Fixed, thanks.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkfNYIACgkQtdYpNtH8
nugwjg//RF7gcIM82HCBRUbHreKp1vyqHJAkwzNV3Chegn/8DHfIjvHgiNgQ808h
65NGIEfwlrH01haRQ5s3YqAJo3ZcTQWDE/J1Pox/alfXnhFsrTmsH+fXBd+R111D
sKw7AHdv4mADLQXZZYidk+nwY/+SlumCppgKE/42thNeSg1pzK3iY6C7DSOPutb9
78UoDo3ZEgcvugwoZUyAlR8nstRgiLgYzgJA8Fq5mnAAGIoqsxbAEccTbHquhuvx
z4pE8CsB7FgRMbdq9U0zqIh5hPzccJ4Nv1bR1NhmN9Kde9//BYuVstYTmCdcILB/
nDa3JzNirOo/dau552Ue8fTXBHJaRaojxrk9XWIZe575gJ0DQlkcVZXcZuzz9oxQ
eSFDB73nF6zfxTvBw7JZZkAOQAbUaZ09lRac/m6Zz7/GhV3/pWHh7tbIhuGxbmS+
KtFXQEzWqWv6o7LXYLk6w6+/0OejL0Zo+5wKfbX05kB24QObQu7tfjloDnnvyiMS
+hC/kPrGWRoq3lwjNSIzFOkE3g3hAj19wm5pDdJGfqoRwQZ9rMKKPtQkQIlbrIyM
7ZEmBEbMT3ZhdPSecYcaAByLBhLG5Tvn0ArctA6zS3GwTwsVa9NnHr4LbmXaCsQY
jXhCcfViQ8ADFjqRbDnIvBb8X36UM/je+apAhnn918yFfLBOtQM=
=wG3S
-----END PGP SIGNATURE-----
--=-=-=--

Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Mike Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v6] clk: bcm2835: Add support for programming the audio domain clocks.
In-Reply-To: <20151009003721.GM26883@codeaurora.org>
References: <1444347736-23681-1-git-send-email-eric@anholt.net> <20151009003721.GM26883@codeaurora.org>
Date: Thu, 08 Oct 2015 18:31:18 -0700
Message-ID: <874mi03k0p.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Boyd <sboyd@codeaurora.org> writes:

> Please drop the full-stop from your subject lines.
>
> On 10/08, Eric Anholt wrote:
>> This adds support for enabling, disabling, and setting the rate of the
>> audio domain clocks.  It will be necessary for setting the pixel clock
>> for HDMI in the VC4 driver and let us write a cpufreq driver.  It will
>> also improve compatibility with user changes to the firmware's
>> config.txt, since our previous fixed clocks are unaware of it.
>>=20
>> The firmware also has support for configuring the clocks through the
>> mailbox channel, but the pixel clock setup by the firmware doesn't
>> work, and it's Raspberry Pi specific anyway.  The only conflicts we
>> should have with the firmware would be if we made firmware calls that
>> result in clock management (like opening firmware V3D or ISP access,
>> which we don't support in upstream), or on hardware over-thermal or
>> under-voltage (when the firmware would rewrite PLLB to take the ARM
>> out of overclock).  If that happens, our cached .recalc_rate() results
>> would be incorrect, but that's no worse than our current state where
>> we used fixed clocks.
>>=20
>> The existing fixed clocks in the code are left in place to provide
>> backwards compatibility with old device tree files.
>>=20
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> Tested-by: Martin Sperl <kernel@martin.sperl.org>
>> ---
>
> There's a variable length array in here, causing sparse to
> complain:
>
> 	drivers/clk/bcm/clk-bcm2835.c:1408:41:
> 	warning: Variable length array is used.
>
> This one looks easy enough to fix with another allocation.

We know the bounds of the allocation, which is up to 10 entries
populated in the 4-bit bitfield.  I've switched to using 1 <<
CM_SRC_BITS to shut up sparse.

> But then there's some weird casting warning coming from sparse
> that I honestly don't understand:
>
> drivers/clk/bcm/clk-bcm2835.c:370:36: warning: cast truncates bits
>from constant value (3fffffffff8000 becomes ffff8000)
>drivers/clk/bcm/clk-bcm2835.c:372:19: warning: cast truncates bits from
>constant value (3ffffffff80 becomes ffffff80)
>drivers/clk/bcm/clk-bcm2835.c:378:37: warning: cast truncates bits from
>constant value (fffffffff80000 becomes fff80000)
>drivers/clk/bcm/clk-bcm2835.c:380:42: warning: cast truncates bits from
>constant value (1fffffffff becomes ffffffff)
>
> I guess I'll just ignore that for now. A couple nitpicks are
> left, but nothing major.

That's from GENMASK, which returns an unsigned long, unfortunately.
>
>> +	/* Wait for the PLL to lock. */
>> +	start =3D ktime_get();
>> +	while (!(cprman_read(cprman, CM_LOCK) & data->lock_mask)) {
>> +		ktime_t delta =3D ktime_sub(ktime_get(), start);
>> +
>> +		if (ktime_to_ms(delta) > LOCK_TIMEOUT_MS) {
>
> Didn't notice this one before. Why not add the LOCK_TIMEOUT_MS to
> start, and then call ktime_get() in the loop and use
> ktime_after() to figure out if we're beyond the timeout?

I've switched to that, but I was just modeling off of samsung/clk-pll.c
(one of the few drivers that doesn't infinite loop).

I've fixed the other devm_clk_register() and the extra parens as well.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWFxjmAAoJELXWKTbR/J7oKBwP/0q/lMy8T7IsHP17dKtV5EXq
t/NXLjAce00YAnasGFqPzX0PemOz3OR45usmSUpEGVlauEd8qAqz7VsZEKz9ihZV
pXFVtZa/8dOSGq+sbdl611YfNO/wctlpys/A4e794Xm+TX9h068MWqR128FDu9Yu
0u/E0TIVKmiyh76/IAW3UXSEeI2qadsR7OLWw/7g6UzniqEfbIJjc23jiQsoEMEk
bw28Qaaq7fC46T6iU1bKPgujctzCG9pJ0uQIRPxoIo+hIvp2jaoGgIkM20I3lltO
uVThUD+m/HipV5503YDZ6rvG1ptxoas7/hT7VgVmCoVpTitpFmROrSFklc0eBC1T
5dudJCGsEG2S1VU3dpah6GnpfbrexqbWjmlh/ucWd8WBfNqMnuYAnGLNKu21GNbs
WBmtFLcZf2P5BACUpKwS6Eg59lL2Nxt+P/ZywiIWk3TZN6XbXV/W8WaBXlGA26vi
VuSxi8S+PTjApO0N5Qosids7qzAlTlx44VvcHWv+XQwhOa88mGnS7CtzxSzWvHOU
7dxa/mq5DvzHHwC7XW9oebkyzuOaMCVCjkq6ZpDYyyU241GfDlpblpiAbqUOlBxZ
U8dmxmGmEQJwOWV0VHBy+Ms5aT4OON9WxIBwUMB7xanw2HWkjwOkD2Ra1BK6f2Z/
fhlYZ2liNkDH5goKc5gB
=ZKt8
-----END PGP SIGNATURE-----
--=-=-=--

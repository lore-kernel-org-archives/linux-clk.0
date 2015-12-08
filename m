Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stefan Wahren <info@lategoodbye.de>, Remi Pommarel <repk@triplefau.lt>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/4] clk: bcm2835: Add PWM clock support to the device tree
In-Reply-To: <5665D30F.2060809@lategoodbye.de>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt> <1449418969-5565-5-git-send-email-repk@triplefau.lt> <5664A5A9.4030204@lategoodbye.de> <20151207181752.GA453@cruxbox> <5665D30F.2060809@lategoodbye.de>
Date: Mon, 07 Dec 2015 20:09:47 -0800
Message-ID: <87wpspeg38.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <info@lategoodbye.de> writes:

> Hi Remi,
>
> Am 07.12.2015 um 19:17 schrieb Remi Pommarel:
>> Hi Stefan,
>>
>> On Sun, Dec 06, 2015 at 10:16:25PM +0100, Stefan Wahren wrote:
>>> Hi Remi,
>>>
>>> please send this patch to devicetree@vger.kernel.org.
>>
>> Ok, just to be sure I understand the process here. I should resend a new
>> version of the whole patchset including the devicetree mailing list as
>> recipent. Then the first 3 patches will eventually get pushed by a clock
>> subsystem maintainer. And finally this last patch will be pushed by a
>> devicetree maintainer.
>>
>> Am I right here ?
>
> sorry for the confusion. I mean that you send a copy to=20
> devicetree@vger.kernel.org so subscribers have a chance to review.
>
> I'm not sure but according to your subject you suggest that this dts=20
> patch should go through clock subsystem which isn't optimal. This should=
=20
> be better applied by Stephen or Eric.

It would be applied by me, but that's for me to worry about, not the
patch submitter.  The subject prefix would be "ARM: bcm2835: ", but
that's trivial for me to fix when applying, not the kind of thing worth
asking for a respin for.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWZlgLAAoJELXWKTbR/J7oIvEQAJxovPK5bkLeMX/R6R3ftyaY
b9J4YQRpTes1h/gDNl9ytvT1JOCDKfQumVFkK5vRtuh6G5SXZfL76dR78eotUqOx
fUw93MrcaRWAM3wXzJnVd3YuFEMkci5x4K9bwxNMYXdF8Qr94tJmQA13YTBJwWV7
5ljZezan7XdBxLsQKpcqHjFWso9/dX7Kr6EKQ+rzyMJTodKa0q1bFN+we25SeBWm
DiL0jjF9829wC0dMmufj6ddV/LvrM0f3KiEY8X/XhsBbFI86goTY3tnlPA9uQm65
BdSFxuWIpVt9womaLcesX+64REJmTiVQcBnXk9NjeBPBnK1/4TBUZ01IFeXL/eKo
Fd57U176u/fXwf4q0hRZbSfbElNIGu76IXG0mA/XAwiZ5XD7dJ67sJY57mbBTvBN
70CuEBd1sK0wseNgYI1DbUHRRul8UlnI9m0GdmXBKhS0U0PN69JCresDy2yvt+0H
BBcI3eTJit/hxhjxzxY/FU89RZU8AcKzWTi+CKgXlG05qSBK5Cz+FIDhuQAbL+7b
3aQmxHmDhdfhhNC1vwy/vSUtyTAykHin0p9F3028jMGKjaj7FyJy4y0YO+lYTdhF
/t/kCq+JKWPT7V2nyKkWMwYG5vYdPXMJS7rD8mORUXynTVckre2fzT3xMsgIjosV
FEQrWG4JC8P9gkv87X0r
=4bQC
-----END PGP SIGNATURE-----
--=-=-=--

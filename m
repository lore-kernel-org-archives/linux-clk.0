Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>
Cc: Stefan Wahren <info@lategoodbye.de>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/4] clk: bcm2835: Add PWM clock support to the device tree
In-Reply-To: <20151216075725.GF453@cruxbox>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt> <1449418969-5565-5-git-send-email-repk@triplefau.lt> <5664A5A9.4030204@lategoodbye.de> <20151207181752.GA453@cruxbox> <5665D30F.2060809@lategoodbye.de> <87wpspeg38.fsf@eliezer.anholt.net> <20151216075725.GF453@cruxbox>
Date: Wed, 16 Dec 2015 12:05:10 -0800
Message-ID: <87a8parwg9.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Remi Pommarel <repk@triplefau.lt> writes:

> On Mon, Dec 07, 2015 at 08:09:47PM -0800, Eric Anholt wrote:
>> Stefan Wahren <info@lategoodbye.de> writes:
>>=20
>> > Hi Remi,
>> >
>> > Am 07.12.2015 um 19:17 schrieb Remi Pommarel:
>> >> Hi Stefan,
>> >>
>> >> On Sun, Dec 06, 2015 at 10:16:25PM +0100, Stefan Wahren wrote:
>> >>> Hi Remi,
>> >>>
>> >>> please send this patch to devicetree@vger.kernel.org.
>> >>
>> >> Ok, just to be sure I understand the process here. I should resend a =
new
>> >> version of the whole patchset including the devicetree mailing list as
>> >> recipent. Then the first 3 patches will eventually get pushed by a cl=
ock
>> >> subsystem maintainer. And finally this last patch will be pushed by a
>> >> devicetree maintainer.
>> >>
>> >> Am I right here ?
>> >
>> > sorry for the confusion. I mean that you send a copy to=20
>> > devicetree@vger.kernel.org so subscribers have a chance to review.
>> >
>> > I'm not sure but according to your subject you suggest that this dts=20
>> > patch should go through clock subsystem which isn't optimal. This shou=
ld=20
>> > be better applied by Stephen or Eric.
>>=20
>> It would be applied by me, but that's for me to worry about, not the
>> patch submitter.  The subject prefix would be "ARM: bcm2835: ", but
>> that's trivial for me to fix when applying, not the kind of thing worth
>> asking for a respin for.
>
> Thanks for review.
>
> I'll submit dt patch to devicetree@vger.kernel.org for review. Is it bett=
er
> to submit the whole patchset (patch 1 to 4) to provide some context for t=
he
> device tree patch or just this patch alone ?

I think you're fine sending just patch 4 -- the clk-bcm2835.c bugfixes
are between us and the clk maintainers, as far as I know.  Check
scripts/get_maintainer.pl output to see who all should get the CC on it.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWccP3AAoJELXWKTbR/J7oY7MP/1bCi0EKmcNS8d5rUZ/4BQip
zEKY+27c72rKH1PP6xw14lQERPGHyMMH5DzkDbec+Stf7eygrh7fcgWE9GALUr72
yS6t010tTlnmG0xhOESla2aO0F+9iERESPm2wR0mQDMx/pxcvs06nEnUc3u9ArJK
dnna+irsUiPIBTm6S37ji3dZo9jBYuZgGQd4X7xqwTCLP27TJExkzKoL9YTo8gG3
0RZOQlF5okhZvn0WYb3th/e2ibEyBJ60/+wqOKq+bZHlurfvAGpP9yYZTHdvKukX
ZAlWcRcs3eCkNABO76mKlnoiRuURc2392u9ilckn8dIKU9whgqe1mwABhXJFwmN6
m+gIG4yJqQrE/xWqdRREhXmxVDBzBvY72YXP/20n/DkK5sn2KH33Lt4JyOWy75jF
YcpBgeEkZPQVHT9evoXKe1YOjdYatDQNhn8KUdCeZn13zrmMvjmg0a7dChmSOsju
kphPL+rwHvq6QBda/Sv45Bw6KpI4jXmNyi5bRCY15eMadVTm7dW5BuAbNasAGHBq
Rp3+5FiCGU1nJab124Fg+orKepzsGQZp3bPF28jVMO2Eqz3U5A2tOMgoGTb+SUJ5
LnTC6au2TkS8zQSVEfAeT/nQlUXXriPKViqJ5I0iXnq6gsVepeMc0oILbKuCiuRW
n7HYpYKEt0dbvZ33sTK2
=MnVO
-----END PGP SIGNATURE-----
--=-=-=--

Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Mike Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] bcm2835 clk changes for 4.6 maybe
In-Reply-To: <20160329233923.GR18567@codeaurora.org>
References: <1458265130-30734-1-git-send-email-eric@anholt.net> <20160329233923.GR18567@codeaurora.org>
Date: Tue, 29 Mar 2016 22:12:46 -0700
Message-ID: <877fgk5z1t.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Boyd <sboyd@codeaurora.org> writes:

> On 03/17, Eric Anholt wrote:
>> This is late, so feel free to drop it, but I figured I'd send it to
>> you in case you were still open to merges.  I've pounded on it a bit
>> today (modesets to all sorts of resolutions on HDMI, used it for
>> testing the DPI panel support that I'm hoping to have for 4.7, and did
>> a whole lot of browsing of clk_summary as I debugged DPI), and kbuild
>> test robot came back clean, so I'm pretty happy with it.
>>=20
>> The following changes since commit 4d3ac6662452060721599a3392bc2f524af98=
4cb:
>>=20
>>   clk: bcm2835: fix check of error code returned by devm_ioremap_resourc=
e() (2016-03-15 18:14:11 -0700)
>>=20
>> are available in the git repository at:
>>=20
>>   git@github.com:anholt/linux.git tags/bcm2835-clk-next-2016-03-17
>
> Please make sure to use a proper URL here. I don't have access to
> git@github.com, but I can fetch this from
> git://github.com/anholt/linux.git. The tag and the contents match
> so I'm fairly confident all is well.

Yeah, it should have been https://github.com/anholt/linux -- sorry about
that!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW+2BOAAoJELXWKTbR/J7onNEQAIeWOf1lCfzfOlNcmhpaKPLL
S2k9hfRK6y1gff+q/GnVr0odazI5vH8lsd4nXI/YfzZKHMZe3VpFPXARYh1ayDAl
C+74+5eUevQymVKZmRqH4vob34MdNVIob4b1Fvoxqs0jICnD60er8iVdZYV2AG4R
DbIOQwP/XrIOCBz51/nyDo+qFciACe6UZ44JzVbq0oR5jOEN+1VUguS/GCFwBECZ
Dr3tP8eCn2go1NRHuR9IwGoBrOytJsi2G6QdkLMri4KCNYrTiTE9m2XeNAiZThU6
C7GToP/6vHR/IQqZE6T1fCDO3Pz0K+DZ3QPpc0Yr0cC2OdQ9I1LfYom+o449BsQR
ZTr1uM3PvxZCrihTjSGjQWBSOhexaodSEQQwDZkE2yGTUwtlnquSKMTenwIxPziF
uKvWaOPOmYxwcibA+HGFbIN1IjbAYP6oZMOk91oDR2KYLYZ2z9035uCSmUtoYQid
8s2TXyiWxlJHIfD62gDpJmM+kqep4QW/UoAXa+R2JGrspDZJDTEkLxRAHooE5ntd
uAsVyQaY+SoyC38yUzNtfd27d8m8t9cbnKAiFdf4lnUyL3N6YHHwP0pzs6pQXGzG
APQ3drL6WyQDee2T2j19QEmMdgXdm/ibye6Rqx9H1bDxEu1A5LAnMYBsfeKg0OD3
OuSNYkgegpbFQHDQ0KAS
=GrD2
-----END PGP SIGNATURE-----
--=-=-=--

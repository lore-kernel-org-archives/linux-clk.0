Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 22 Nov 2016 15:47:31 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: arm@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner arm64 DT changes for 4.10, bis
Message-ID: <20161122144731.c6q6jxgd7cyeieqr@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r2pocq5tag5geony"
List-ID: <linux-clk.vger.kernel.org>


--r2pocq5tag5geony
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

Here is a second run at the arm64 PR I sent earlier.

We had a (build) dependency against the clock patches that have been
merged by Stephen and Mike through the clock tree.

Hence, this new PR is based on top of the tag I sent their way, and it
supersedes the previous arm64 PR.

I used this occasion to rename the patches prefix as Olof suggested in
the earlier pull request.

Thanks,
Maxime

The following changes since commit 0f6f9302b819ca352cfd4f42c18ec08d521f9cae:

  clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for audio module clocks =
(2016-11-11 21:47:41 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/su=
nxi-dt64-for-4.10-bis

for you to fetch changes up to 5757867e8758f40227e710625df64a471ec81411:

  arm64: dts: allwinner: add Pine64 support (2016-11-22 15:43:01 +0100)

----------------------------------------------------------------
Allwinner arm64 DT changes for 4.10, bis

Support for the Allwinner A64, their first armv8 SoC.

----------------------------------------------------------------
Andre Przywara (3):
      arm64: dts: allwinner: add Allwinner A64 SoC .dtsi
      Documentation: devicetree: add vendor prefix for Pine64
      arm64: dts: allwinner: add Pine64 support

 Documentation/devicetree/bindings/arm/sunxi.txt    |   1 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/allwinner/Makefile             |   5 +
 .../boot/dts/allwinner/sun50i-a64-pine64-plus.dts  |  50 ++++
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |  74 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 263 +++++++++++++++++=
++++
 8 files changed, 396 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/Makefile
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-plus.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r2pocq5tag5geony
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNFqDAAoJEBx+YmzsjxAgntwP/jnKMWx+xxWji20iytLLlRma
dMihyz1yixOa64cR9fq0jSQGf5PsrcM+XR8uhPR2d2wBicj1/kU4O4Mywp5coM3M
d3W1401kSzQ6zL1PtKyMYTJagiWGw4FWZBVqvWGa//b+qRtyKzv5QTeRXscTYFIB
9Aa6cQ9LwokxuGGHv3OZNtEB9i/xes2Br5qEYRaswvqxEVW6oiEs4q9k271ISGJF
prTnd9CogMrdShofR9FCNu2TBvEOWDceJskBL0TdsaBWAnoS6yySxDOAePQSxo7c
4jXHdOnMJc7SLVey+4kKVQudkpAN3XXAMs4IfBwl0dDNbhRirvz9A92lS0Bem+0r
O0cC7aqWjUxklBwga/Nzxh+4+TNVWQ7ISC3mtlkA6NiqdKtowmKVJqVQy1sg0dxp
9WwFTwsVzBveeO2xPD+xGbY9yUU643yyXBCIaAM8h6kN0Ptgdjx2sTeaPSAZ/A+5
EW2wr9/XCNqNmbPHIz/86KAJgaXDhX6YQJoROFyR6Ih1noKNQc2mwfRRGbRJ261g
4fZrDgy12hfi9Qt2ib+Aa0+WBGAJNEmFz/jn1az5hL69/XkuKtpteVA7rM56xymE
r/OO567WK4V3f2A2KU9NWLZHfQl9Nhsin6Ena9H1SOsmUwd17USDmkaUA78Jm5Cz
gE2CYEYCpi6mEWGjk8Ip
=Tdq/
-----END PGP SIGNATURE-----

--r2pocq5tag5geony--

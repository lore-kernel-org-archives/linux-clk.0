Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:41086 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754987AbeAHDtD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 7 Jan 2018 22:49:03 -0500
Date: Mon, 8 Jan 2018 11:49:01 +0800
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [GIT PULL] Allwinner clock changes for 4.16, round 2
Message-ID: <20180108034901.GA5577@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=big5
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here are a few more clock changes for 4.16. The DE2 clock changes have
been around for awhile. The A83T clock fix was found by Jernej while
working on HDMI output for the SoC. We'd like to get these in so patches
don't pile up on the mailing lists.

ChenYu

The following changes since commit e952ca3c6b2ffdfbf9618e4bd3e9aad1ff3f5eb4:

  clk: sunxi-ng: sun8i: a83t: Use sigma-delta modulation for audio PLL (201=
7-12-08 10:08:32 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.16-2

for you to fetch changes up to 7dbc7f5f4904cfddc199af171ea095490a434f15:

  clk: sunxi-ng: a83t: Add M divider to TCON1 clock (2018-01-03 13:45:04 +0=
800)

----------------------------------------------------------------
Allwinner clock changes for 4.16, part 2

The hardware description for the DE2 clocks on the A64 and H5 SoCs is
fixed, and support for these clocks on the H3 is added. Also, the
description for the TCON1 clock on the A83T is fixed. All these are
non-critical, as they have no users.

----------------------------------------------------------------
Icenowy Zheng (3):
      dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
      clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
      clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU

Jernej =C5=A0krabec (1):
      clk: sunxi-ng: a83t: Add M divider to TCON1 clock

 .../devicetree/bindings/clock/sun8i-de2.txt        |  5 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c              |  4 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               | 53 ++++++++++++++++++=
++--
 3 files changed, 55 insertions(+), 7 deletions(-)

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAlpS6iwACgkQOJpUIZwP
JDBojA//bZRGfUJU1QfaRL2flgrpLDomLHH9/VsRziNv0ytaEez78OGRkGMJ6fZ7
3W7OQgncSfcJs3G0U9GMizxa6u1y33riCoRg9/QIZNRf57JraRO3iEXDXGVwru2H
NIYfuYNZ+K0bfe9eVFngUnScbAFrWr8+K3+kKJEgY6kUFfN9LbauNgLI8Gxubf28
/MX18yPglORsdOThGK2rmdLc25WmEYeBZtBoKCb0PI2k5O55u32DAnftttddKTyU
kDanGt/5YzoKEx1Q6DCXWiIQOftLUH/LXIqFFiNbzcJotgQt2cjq18SuuIhnRNyo
khAxu8EMirgN7waCqvRfD9nhfXUzHU7l79B9Pz80lDLev0BYeIHPSiaNdMVJ6lgw
Swt1vXXL3rHdVARrlQhPZZOGO0nbxpg5hdRKjuKmKXbOh6M4Pe+YGOoyFKS+oiW5
AUBxgRC3WYzF65TZNRgkHxKgrURtafQUzWOTC95YS/N+bQ1nPe/QB36YWwKypy48
vBiY9McuUsywV/uh3oVY1+JuxfTliCFt+dx5GmyrdRvtzz/Kj1Of6+o0Qe16zG+d
8GjbZ+uA1bGrZWTlPvfUUVB43N3vtfctrifcAxz1jG3z/tlqRWzVEltqh68RV5Jq
KSAoJUXCUTDxMpEp103SOXaYmk2PUCJRqzSS3U3GgRfK/q7cAmw=
=PrjA
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 20 Apr 2017 10:17:49 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 4.12, take 2
Message-ID: <20170420081749.bok3wwusmk2no5vw@lukather>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7roefruvokk5g4na"
List-ID: <linux-clk.vger.kernel.org>


--7roefruvokk5g4na
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike, Stephen,

Here are the few last minor fixes that didn't go through for 4.11,
plus two fixes for previous drivers changes found in the earlier pull
request for 4.12.

Thanks!
Maxime

The following changes since commit cb545960dea2749771c88b0cb26e5adfd12a0315:

  clk: sunxi-ng: Display index when clock registration fails (2017-04-06 09=
:10:30 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-clk-for-4.12-2

for you to fetch changes up to 7149c1becddf49022fe0aad2fa395377cd8f753e:

  clk: sunxi-ng: a80: Fix audio PLL comment not matching actual code (2017-=
04-13 14:09:30 +0200)

----------------------------------------------------------------
Allwinner clock changes, take 2

A few minor bug and comment fixes, plus some fixes for the PRCM CCU driver
merged in the prior pull request

----------------------------------------------------------------
Chen-Yu Tsai (3):
      clk: sunxi-ng: use 1 as fallback for minimum multiplier
      clk: sunxi-ng: Fix round_rate/set_rate multiplier minimum mismatch
      clk: sunxi-ng: a80: Fix audio PLL comment not matching actual code

Icenowy Zheng (2):
      clk: sunxi-ng: fix PRCM CCU ir clk parent
      clk: sunxi-ng: fix PRCM CCU CLK_NUMBER value

 drivers/clk/sunxi-ng/ccu-sun8i-r.c   | 2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.h   | 2 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 3 +--
 drivers/clk/sunxi-ng/ccu_nk.c        | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkm.c       | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkmp.c      | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nm.c        | 4 ++--
 7 files changed, 17 insertions(+), 18 deletions(-)

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7roefruvokk5g4na
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY+G6tAAoJEBx+YmzsjxAgg/IP/1sABHmx+NijfAdZsIzZhChR
6qhrZnmhCE4HK4X8+0cZydcUW6z/JlVju3nb3GUqzzH190+b9+2J+B9XQJTpVoVk
7chKtO1Fx8GXKzuo4Eoot1oRaNopejCXjMH3RfH92+m6AjMZy/t+a+Gk6ocLSckt
3iOTtJwBje8LBfhvVqEbCdM3FoYZG4Y9C59nVuKJrnzNkyCj8d8ji4KYNrkqciFh
kUXMwHSdSm/WJr42rHvpAKIPa/1ymngaCtkf5wtKYZ8gskAeVX/XhiZKW7fTaPkK
ACqwYueuy0pkmcfNYhJq/GYJqP4kuL0Lffd5fwYozMwvUXuUddOcYnPPVBiFVcGC
YEf9sjmaydKoje6t42bXY9fs+qxPwnB6wI93HmPOFBQtBj5828y5y/utMEKDQr1d
aABZlt3SzRPF1FuIjfClWge1My9uKN22mX+5vSVjNFUu/pzu2D8PtUXMm4ek0Ii8
7LIw/bnwdmYFSCvRM24P12oNfE7U6qcIG0TsWlS47uPXYT2bb7EFPdPjg60a32WW
owPbtOi1WAhhHKmlx/+gBf+mlOi4iUnK3D8fOXCvzrJrELCS96pnoqZOPd5/Ype+
/MbE/ir1AmiN6GTx5TZp9khOF5I45n1bTqg+zIOqbVUIBR5gNDuDbjakDIma7TYa
zhrYJK/t9VbkQ+2atZEb
=YmfA
-----END PGP SIGNATURE-----

--7roefruvokk5g4na--

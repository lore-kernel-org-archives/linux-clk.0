Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from up.free-electrons.com ([163.172.77.33]:34782 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S933709AbcJTR1u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Oct 2016 13:27:50 -0400
Date: Thu, 20 Oct 2016 19:27:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 4/9] clk: sunxi-ng: Add minimums for all the relevant
 structures and clocks
Message-ID: <20161020172747.dagnsdwhhxmxvm4c@lukather>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <a96b56fb7bda849e087b63a04ff76d1396c44d72.1476196031.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64itwTvMoxvtYDqOALL-XJYvhv-5daPPjPzb9DfY3o62A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="railmedgbrcx4slw"
In-Reply-To: <CAGb2v64itwTvMoxvtYDqOALL-XJYvhv-5daPPjPzb9DfY3o62A@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--railmedgbrcx4slw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 11:04:18PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 11, 2016 at 10:28 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Modify the current clocks we have to be able to specify the minimum for
> > each clocks we support, just like we support the max.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>=20
> Including the bits from patch 2.

Applied with those bits merged in this patch.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--railmedgbrcx4slw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCP6TAAoJEBx+YmzsjxAgSGMQAKoPVBnj+W2JcbxOx2OAjd8u
5rgQ0JjY0blR+sCpSarKOwb8duSnsDdQU4bYPYYXf9wUalFc0ghFq8efwtpn3/mh
LDwN+TFGAHLLSOyHFyrINtz7wvrznbN2KATuaH+ISBzatpOh5zbUxMg+O6E3xZcn
/1osPwPUWcng04o241vQazkxYA1VjGx59myhN6JzeCRJlHHnpfQVuNyoX5/5o9VJ
abmuReLHpYX8vvxooAhUeD4EVSJ5ypDSlqtnMuYwMsqHkDi99giM5dIAVGkFwqXR
nN+tE80VKRUXZ/HuqEuPpL+Qe3/mPs3X81tGy+cEe4T3UJ0TQaFKZvUWgli6QSKV
9QgZS3DBGPy8MmoXFTbPwGF2lNkb/Q0Yv1fL73oPuAgPcclnUYYS4cZyGoqx+Ynk
G5K4dWhTL4WO/Q1fFD7B+FBWD6YA7h50t+G8TClC4pAJJTMzZORFfspXvkpGE3nj
O0fIcpMaZrIoIldOvOh74kUIgXTs/qEi1/wdPjU+FAHv+Rcvfe5tb2njl+fILRhU
Ph6P8Sg9ZkeYw3jpBC0m5m7kChj0V1Ycb9LdctatkDJfP+61+x7itWzNhm5Pcyo9
BK57JluCwzIKXULdgw8aAZUc3GPUYStUOLESNdn9HIJwsh9SWmt5qmAu4dTDo7cR
y8lt7TooVSM7NqUr00Eg
=71Ar
-----END PGP SIGNATURE-----

--railmedgbrcx4slw--

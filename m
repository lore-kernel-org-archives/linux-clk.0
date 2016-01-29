Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 29 Jan 2016 11:37:57 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v3 1/2] clk: sunxi: factors: Add missing recalc pointer
 copy
Message-ID: <20160129103756.GC32462@lukather>
References: <1454008958-12655-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v66dbtBPwRQzA3rtP5hu-0rvfaX2ac7KWRiF42wtEiafwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
In-Reply-To: <CAGb2v66dbtBPwRQzA3rtP5hu-0rvfaX2ac7KWRiF42wtEiafwg@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 02:18:34PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 29, 2016 at 3:22 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Commit 4a9b2abc213e ("clk: sunxi: factors: Support custom formulas") was
> > introducing a custom recalc function. However, the pointer was never
> > filled, which was making the whole thing unused.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> (facepalm)
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>=20
> Can you squash it into the original?

I just did, and pushed the updated branches.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWq0EEAAoJEBx+YmzsjxAglDgP/2oPkHiUgMtfw2hbUWQhhB8X
PNtY3Iq2qdLVcMrc5AQWoMrnNki1l76jXlMIIlX4ptIFiKT65fpIru/6CixEohmn
zzi13wBMgv+HqO798yL2kJbxBdicB0320c1hsfjWdB26G9ClcYKReMjKv1T3Iuqn
AI5grcHcSVxlmXv1BeIC5rvhRNoftgv64SG2QVTDeoVnreThr4viTkjuX7ZDr4KH
fzo65fjFr7/alzatc4XQgdCU68hbzNjJG+strdDuUTM2gX9g9dQ9NKIFfYi60YXs
2tPq8jnGnhDvaYC1QX01OIjo3nec+t4KwParfSfkq4woWgjdqg75MQLiDCuKYmcp
CJnDdVHZkVhMfJ03TYFFaf106aWHmT2LuIe7r9Cfm3zFTrIOZ38it1UnSECMxN1y
p/rN3kZ3y0MnmzJG/HPqJGaycMHqrwP+nMPlUzqEXN707tkm9cg0yEOsfSJXoreT
TQW7B3LhZwm+uCySKmvmvcYbTddPtvnNBmwYOCG89D0PF54qVeDUENzQVqBVMiFZ
Q/f+TuTxBvCZ5C2niMwnLbLqgSU+e648txRoIF7sHPz8uvgKusX/z9LOjyu1D3TS
2pAde/ctYQWTvGCbgpKC6GAOjZSiNcFUyy/XnilroHKlVF9P8srUAduDenirD+hT
yRdbW65POGcNA7EJGBfU
=Aavj
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--

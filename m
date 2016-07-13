Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 13 Jul 2016 22:52:40 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Hao Zhang <hao5781286@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>,
	yassinjaffer@gmail.com, dev@linux-sunxi.org,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Reinder de Haan <patchesrdh@mveas.com>,
	Jens Kuske <jenskuske@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: sunxi: Add CSI (camera's Sensors Interface) module
 clock driver for sun[457]i
Message-ID: <20160713205240.GN4761@lukather>
References: <1458204222-31149-1-git-send-email-yassinjaffer@gmail.com>
 <1458204222-31149-2-git-send-email-yassinjaffer@gmail.com>
 <20160319235905.GA16539@rob-hp-laptop>
 <20160402011436.GA18567@codeaurora.org>
 <20160404212450.GP4227@lukather>
 <CAJeuY78Mt-286pWvCVqPFnPixp3cQ+C=SHekCkMfAd7Lf_t1+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cs5saTBZh7UZl2eX"
In-Reply-To: <CAJeuY78Mt-286pWvCVqPFnPixp3cQ+C=SHekCkMfAd7Lf_t1+w@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--cs5saTBZh7UZl2eX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 11, 2016 at 01:07:26AM +0800, Hao Zhang wrote:
> Hi all
> I am developing a media codec driver(using bt656) for cubieboard
> one(allwinner a10 processor), i want to use DT to banding csi. after i get
> some reference on
> Documentation/devicetree/bindings/media/video-interfaces.txt, i have some
> question about whether the csi driver for cubieboard one support to parse
> the DT node just like in the reference document? if not, whether someone
> is developing it or should i necessary to complete it together (What's the
> progress of it) ?

There's no driver for it yet. We're currently working on it, so it's
probably going to be done soon, but it's not there yet.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cs5saTBZh7UZl2eX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhqoYAAoJEBx+YmzsjxAge8gP/izj+6UFrFByKCZPduDVOioC
XYyQRK6Vbs3e98+tBo8XnZ7ThX1KUXJKJhiec3x7XQxmZmoS+CW42o7Bm6KAoGaJ
Dp3xsUL1DJGnNZK8qHvD//TuYbw4IKWOSoMEd2GfeEzuq3xFZ7H59pnG2l05sqpM
SN/BLRk4rCh/2NlEAkJ+q0LZeTFb6N7+/dJud9GZsQUZs39sdH6yKub7r5N24wXo
VRX8Iv8t7fcAQEzoEY2CgvqQt23fzUDaG6SYBMWLOYJqmUAcM0cKqERxcl3jG+OK
6kSjGaVqeqyseWyTr2krRl7xObPzF5HW/zpZdskFZxlJxeBqksB4aTrAMdBwwkWS
4JVEAdRglixMgC7cxTBxhodQnWbAL2SyQ3Cz3YTA+/mSDT94hRjCf+70XZ47PfJY
vuID0HAlQ3PEF59rE36iKSRZIOd/FHw+iBckzY4ETrGSIaTyF4FoePlaGzoYU+D0
M+Wda0qsCeGCKJQjkmBQ7XcU9WO4vv7Wm7ANeRCIbztj0ky2pHkvIDxHDtBWtEt9
8FjyYGwkT08WfXRulA2gmLE15Go6M0+6hDaCEOV7M8CP05Sio14O5ZISuKWxJ97E
uI6JSUC6iygxVwlM1iQw8DRIc7Q0zNmQn7f5cv64MBLsDN686jvXg+S2vlMBTxI2
Y9QwS/Zw+XGNb1zUxGbn
=S7Qk
-----END PGP SIGNATURE-----

--cs5saTBZh7UZl2eX--

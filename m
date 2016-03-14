Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 14 Mar 2016 11:52:08 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>,
	=?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Jens Kuske <jenskuske@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Reinder de Haan <patchesrdh@mveas.com>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 01/13] pinctrl: sunxi: Add A83T R_PIO controller
 support
Message-ID: <20160314105208.GM8418@lukather>
References: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
 <1457192586-25596-2-git-send-email-vishnupatekar0510@gmail.com>
 <CACRpkdZ5o=SKtHxshaedkYNETERt6DfiOPtC5JV2LNWKL_mqDg@mail.gmail.com>
 <CAEzqOZta65UBJPBrp_4xr=SzHU98dWDucwzVb80eKE9ChJ8jpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BDCv8JNaL8ltm7rS"
In-Reply-To: <CAEzqOZta65UBJPBrp_4xr=SzHU98dWDucwzVb80eKE9ChJ8jpQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--BDCv8JNaL8ltm7rS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Mar 12, 2016 at 12:48:02PM +0800, Vishnu Patekar wrote:
> Hello Linus,
>=20
>=20
> On Wed, Mar 9, 2016 at 10:55 AM, Linus Walleij <linus.walleij@linaro.org>=
 wrote:
> > On Sat, Mar 5, 2016 at 10:42 PM, Vishnu Patekar
> > <vishnupatekar0510@gmail.com> wrote:
> >
> >> The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> >> interrupt bit is 6th and A83T has one extra pin PL12.
> >>
> >> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> >> Acked-by: Chen-Yu Tsai <wens@csie.org>
> >> Acked-by: Rob Herring <robh@kernel.org>
> >
> > As partly noted by others:
> >
> >> +config PINCTRL_SUN8I_A83T_R
> >> +       def_bool MACH_SUN8I
> >
> > bool
> >
> >> +       depends on RESET_CONTROLLER
> >
> > Should it rather select RESET_CONTROLLER?
> I used depends on and def_bool as it is used for other sunxi pinctrl driv=
ers.
> Using bool and select will not harm anything.

It will, at least in the case of def_bool, since that symbol will not
be enabled by default, and you'll have no way to enable it.

And RESET_CONTROLLER is a bit messy, since you can't just select it
because it also has a dependency on an ARCH_HAS_RESET_CONTROLLER
symbol.

> Should I change it to bool and select ?  or keep it to be uniform with
> earlier options?

Please keep it that way.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BDCv8JNaL8ltm7rS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW5pfYAAoJEBx+YmzsjxAgqpIP/R5fIuDIUf69/qlopNfwl/kp
uftf9w8N7GnTFMEAoydCbQEKMT5GrfqEaXYg4Ie54kq4WvvFEkZdltP+5vt8yi1G
UbrENVpQHdQVVwFXbVrooXP2dOvpiGO/DIMfKICT1o0UNtdCTGDhwKeivqOfOLmh
khuRW7agJjDW4yCz0dWYEJ9d+M98RYMj2BXtoKq0j4/QvEaO5NPSfwuacQd1Aiuk
WulK7a6cgGK7YxWQLd+yegrAyoCqRBNzaaddS7+hUwWKecoJFHqXyeIZCnqdiTwq
/n6LtMuZVLuRyLGM1hcKtf+6VuDYybntDvAZgLx8J6lTGOTfs+fQ39xM54stXX5L
zb2txtMoD28xVDcftw+HznRa33xiJ/x+hpQwImSeH05Yziw41zTdNiNlpeBTQA8E
68I/l81B5sm0dwBjjAnGv5fla8Uvpc3GSeB3n61zZF3UiJ/yvWm0W67akm4Y6QdL
ijYkOxCPzpyb9Q1gA97GpUMehUqg9XmEc2gxmLnoM5/ANtUZGknQWssQwSD8t5Tw
NVEo/f22ft2J3jt+fJGxJ7JcfUAZ6P41vKy8gn1vcow5HUdoZvbKkfaxkmkNeKJ+
iK3fcyPHOoRPi3H0SGt+wspq3wg3DwMwsQZvNxBN/t5HU+cGgrXN07K6eUydn8vi
oLlHsl+7IM/rWWPsGmtk
=jtfl
-----END PGP SIGNATURE-----

--BDCv8JNaL8ltm7rS--

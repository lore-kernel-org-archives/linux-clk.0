Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 20 Oct 2015 16:40:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v6 1/5] clk: Add a basic multiplier clock
Message-ID: <20151020144047.GA10947@lukather>
References: <1445326609-6314-1-git-send-email-maxime.ripard@free-electrons.com>
 <1445326609-6314-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151020134343.20687.16333@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
In-Reply-To: <20151020134343.20687.16333@quantum>
List-ID: <linux-clk.vger.kernel.org>


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Tue, Oct 20, 2015 at 06:43:43AM -0700, Michael Turquette wrote:
> Hi Maxime,
>=20
> Quoting Maxime Ripard (2015-10-20 00:36:45)
> > +struct clk *clk_register_multiplier(struct device *dev, const char *na=
me,
> > +                                   const char *parent_name,
> > +                                   unsigned long flags,
> > +                                   void __iomem *reg, u8 shift, u8 wid=
th,
> > +                                   u8 clk_mult_flags, spinlock_t *lock)
> > +{
>=20
> Patch looks good in general. However this is a good opportunity to stop
> the madness around the registration functions in these basic clock
> types.
>=20
> clk_register is really all that we need since we've had struct
> clk_init_data for a while. Initializing a multiplier should be as simple
> as:
>=20
> 	struct clk_multiplier clk_foo =3D {
> 		.hw.init =3D &(struct clk_init_data){
> 			.name =3D "foo",
> 			.parent_names =3D (const char *[]){
> 				"bar",
> 			},
> 			.num_parents =3D 1;
> 			.ops =3D &clk_multiplier_ops,
> 		},
> 		.reg =3D 0xd34db33f,
> 		.shift =3D 1,
> 		.width =3D 2,
> 	};
>=20
> 	clk_register(dev, &clk_foo.hw);
>=20
> This is nice since it turns these basic clocks into even more of a
> library and less of a poor mans driver.
>=20
> (I really hope the above works. I did not test it)
>=20
> Is it possible you can convert to using this method, and if it is
> correct for you then just remove clk_multiplier_register altogether? (In
> fact you might not use the registration function at all since you use
> the composite clock...)

This chunk of code has been here since v2, which has been first posted
in May, two and half kernel releases ago.

In the meantime, we had a full-blown DMA driver and a quite unusual
ASoC driver merged. For some reason, this is the only piece of the
audio support that is missing for us, while at the same time it's the
most trivial.

If that's the only issue you have with this patch, I'm fine with
sending a subsequent patch this week. But I'd be really unhappy with
sending yet another version for a single change, while you had 5
monthes to review it, and we discussed it several times on IRC and
face to face.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWJlJvAAoJEBx+YmzsjxAg1DUQAKSbmNx2ONHQCcAdLbSp4vxH
3slilqd02d0wHR97Y5YREj0xgFVyVk0wsh61ZpusdubNGUYC/go6sB7QbCG4uxvQ
YRyTuGb/xOTmG8kSbAVlstpwD1eZLrTK9VDIY9qnx8WYSxGfxPR9t/5NPuX2g8SS
Ym4c2Dhy+7sWajN9gdapJg05HJkNhvFx89dAVMh6VIdkwpdbzT7QlGohVRjaqbQu
59q4dJMKFzMIoGFtGoWN/Nh2UOcCtj6cNZEw56+M6+UJG8sG6pJ1Qx7UxCu2ho6E
CP8xxnSWUtr18tlkNYjUxEEyvyY8E2UWjbZme8FDs2/ikUWKZgG1/GcqbhgecJS3
J2m1DYIyOxtMybRoXwtMqT81Se7HMu8mkv4RqqX0HsFHkvZGfck7zCV8Knkus+Ii
td0MVaPDEsssIBCnzZRkRQiKK4Fb+9DcFuhHWhcWbl+8gJfc8x09JTjSqxUD+pJb
5VsvZXAJP0uWymtG5n74x3D++l8DyC2/nNeA19u/RaV5s41ruIYeFjHScVplR21+
1M1r51Vc9W6fvY0gD/FESaSZaKO1lr6zecSp+pDQzCD+4K+93cxq7k7LLMqSaDU6
4JJ+FgcaYSVm2k9tzpk/Ip52GlgFpTNw0APMBJb91nQmx0IuEyIrOH0hxOGcR3Ky
cEYlc+3pOdg77E1z6Ztt
=uEjj
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--

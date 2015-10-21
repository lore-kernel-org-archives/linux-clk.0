Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 21 Oct 2015 16:53:35 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v6 1/5] clk: Add a basic multiplier clock
Message-ID: <20151021145335.GF10947@lukather>
References: <1445326609-6314-1-git-send-email-maxime.ripard@free-electrons.com>
 <1445326609-6314-2-git-send-email-maxime.ripard@free-electrons.com>
 <20151020134343.20687.16333@quantum>
 <20151020144047.GA10947@lukather>
 <20151020162939.20687.32769@quantum>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
In-Reply-To: <20151020162939.20687.32769@quantum>
List-ID: <linux-clk.vger.kernel.org>


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2015 at 09:29:39AM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2015-10-20 07:40:47)
> > Hi Mike,
> >=20
> > On Tue, Oct 20, 2015 at 06:43:43AM -0700, Michael Turquette wrote:
> > > Hi Maxime,
> > >=20
> > > Quoting Maxime Ripard (2015-10-20 00:36:45)
> > > > +struct clk *clk_register_multiplier(struct device *dev, const char=
 *name,
> > > > +                                   const char *parent_name,
> > > > +                                   unsigned long flags,
> > > > +                                   void __iomem *reg, u8 shift, u8=
 width,
> > > > +                                   u8 clk_mult_flags, spinlock_t *=
lock)
> > > > +{
> > >=20
> > > Patch looks good in general. However this is a good opportunity to st=
op
> > > the madness around the registration functions in these basic clock
> > > types.
> > >=20
> > > clk_register is really all that we need since we've had struct
> > > clk_init_data for a while. Initializing a multiplier should be as sim=
ple
> > > as:
> > >=20
> > >       struct clk_multiplier clk_foo =3D {
> > >               .hw.init =3D &(struct clk_init_data){
> > >                       .name =3D "foo",
> > >                       .parent_names =3D (const char *[]){
> > >                               "bar",
> > >                       },
> > >                       .num_parents =3D 1;
> > >                       .ops =3D &clk_multiplier_ops,
> > >               },
> > >               .reg =3D 0xd34db33f,
> > >               .shift =3D 1,
> > >               .width =3D 2,
> > >       };
> > >=20
> > >       clk_register(dev, &clk_foo.hw);
> > >=20
> > > This is nice since it turns these basic clocks into even more of a
> > > library and less of a poor mans driver.
> > >=20
> > > (I really hope the above works. I did not test it)
> > >=20
> > > Is it possible you can convert to using this method, and if it is
> > > correct for you then just remove clk_multiplier_register altogether? =
(In
> > > fact you might not use the registration function at all since you use
> > > the composite clock...)
> >=20
> > This chunk of code has been here since v2, which has been first posted
> > in May, two and half kernel releases ago.
> >=20
> > In the meantime, we had a full-blown DMA driver and a quite unusual
> > ASoC driver merged. For some reason, this is the only piece of the
> > audio support that is missing for us, while at the same time it's the
> > most trivial.
> >=20
> > If that's the only issue you have with this patch, I'm fine with
> > sending a subsequent patch this week. But I'd be really unhappy with
> > sending yet another version for a single change, while you had 5
> > monthes to review it, and we discussed it several times on IRC and
> > face to face.
>=20
> The change can go in later. It's not a prerequisite. I had a feeling
> you'd be grumpy about me asking but I thought I'd try anyways. I won't
> even ask if you got sign-off from Jim on whether this works for his
> platforms ;-)

I asked several times, he never replied... :/

> The copy/paste nature of these basic clock types really sucks and it is
> one of many reasons that I am hesitant to accept them and slow to merge
> them...

I guess we cover all cases now? So it shouldn't grow that much.

> Anyways it seems that you are not using the registration function at all
> so I might just follow up with a patch to remove it.
>=20
> I can pick these 5 patches directly, or do you plan to send a PR?

I have a pull request coming for you with a single patch, I can apply
them on that branch and send you the PR later today if it's okay?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWJ6bvAAoJEBx+YmzsjxAgELIP/3Kszk5tWro3IyiRGCgMkwB0
cCpkqlMj+YaM2iD9HVll2XTCjR4xsrHM+YHRgNcbzjtGOsAIbuVuzAlpnstiDSGm
5qr/rd1iJgX6W35FvIDpI8zrJAZeCfZ/X/JaniqEdXcQfHmJx/9/fY4BrPLMuRs+
5YEBk3VDTkkak8GZ+DEJDiBuimiSgX0PyBKOjeGMo0oF6YOgT/FaJjtVZ8TdlNfM
VQo0kvpAKfsm0DHZqSNsk0oHzX0eZi6PvJHxz3iyZZupg3hTb1xa0iRu+InPTA7R
xfZOJ06WSunsyD4yflTAaFHPANXR2RcbjTPalW/JA/bEvjMn2iK/gzoJF9TsMi3T
SoVR6YW5meyBp4YcKK+OZVYxZTjcGCO0uYZlfNQnUwOt519tte4qMB0Uo/8WGXwE
sXRoGQa5QRsRh0MasdiE3GCA3nZsABCi+oZLTK/hNMoQZb3krX0H53DyN5iPoe0T
yNcBb9ATbNBNUZm0oYopPd1KjMCLroJZSBXix4gBZxkE7ANnxIINITWBKHmqvw0r
GNUZvaAGIax8e9QL5kH68ct4MKXx5WlFgGueDX0xhbAVPT52bsYJW5KjbIExdozc
MS5NxSd/z2OO9BoBN/9q2iksMuBjKzeZkQeWqkcZ9oQG4NKVPnOXPn1mhQEfhBiS
q1CX06SNo40wm+X5Zs2R
=3eJU
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--

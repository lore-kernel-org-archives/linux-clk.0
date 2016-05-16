Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 16 May 2016 22:15:09 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 02/16] clk: sunxi-ng: Add common infrastructure
Message-ID: <20160516201509.GL27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
 <1462737711-10017-3-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v67XWt6tjG_xXWgGatTaiN5uYQb2_Q6bgixMDUkHfVHLHg@mail.gmail.com>
 <20160515183122.GA27618@lukather>
 <20160516100239.a93a238b0d458b38a3689a95@free.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DH4/xewco2zMcht6"
In-Reply-To: <20160516100239.a93a238b0d458b38a3689a95@free.fr>
List-ID: <linux-clk.vger.kernel.org>


--DH4/xewco2zMcht6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean-Francois,

On Mon, May 16, 2016 at 10:02:39AM +0200, Jean-Francois Moine wrote:
> On Sun, 15 May 2016 20:31:22 +0200
> Maxime Ripard <maxime.ripard@free-electrons.com> wrote:
>=20
> > > > +void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
> > > > +{
> > > > +       u32 reg;
> > > > +
> > > > +       if (!(common->features & CCU_FEATURE_LOCK))
> > > > +               return;
> > > > +
> > > > +       WARN_ON(readl_relaxed_poll_timeout(common->base + common->r=
eg, reg,
> > > > +                                          !(reg & lock), 0, 500));
> > >=20
> > >                                     no delay between reads? ^
> >=20
> > Yes, I intended it to be a simple busy waiting loop since I don't
> > expect it to be very long. Do yu have any more data on how much time
> > it usually takes?
>=20
> I have a Soc in which the rate of the audio clock is stable after a
> good second.

You mean before the clock is actually stable, or before the lock bit
is cleared?

Which SoC is it? As far as I've seen, only the H3 allows to configure
the stable time, and while by default it will take 16us, you can
configure as high as 66ms (which is still way higher than the current
limit).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DH4/xewco2zMcht6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXOipNAAoJEBx+YmzsjxAgCqwP/j1PkGapNuw9KPTpkr4yEa9g
887RwL7od9toDFCxuDYAr8XZm8XbZ4TobEaX62AZdg+yqzzqBinV2uEmeyQUbg0O
4gI4GylMDfK4W6QdoYt0uSqHNmeYCniEtVRqu1wo7257jy/sLryexMa/oEr7Sab5
V5LNANvEXQr4hLqBs0De1/3Ve8e+JsHKKLknwlHR2NQVxdGpr/rNnjJHPVWcfDs9
6EQ0YU0rx5T0E1deXVQOw8gNEHVAmfDBAPevtg5xMrk27lZnFjSZqmk6FOHIKtZ7
45Qb97T2+FZhb9agu8sMLBLQZcH3+82OaL3BDDzzdFB79FKWk5FCoS6JgnQcKS+Z
7UWgiNrYdK3yWtkiCIGXVDIRxglfb5ndJaG/JWmAtbg+fOHEt/aBmnGeHhyUqCPi
8nqzxzyyh5/wPWmCDG+EQB1gBSwFPykuE/1wIgmNPPl8YQwdRHZ8KfNJvZnpsBSE
5GLzXFSS9YJ563Py0mIAuJwG50F7ldzQigjZcQDkKN8EJDyUldS1V3iLb9iQZehg
rayQpiNLP8bXdRlAqxxb17UwHzStTTcg8AmMgpqZqbIxr6Q6dtLhKXGP9d3J+PBL
6zd+VzBSzkIKk3eHIaCst8q6wjICnfC26WzMEAiTtTjdV0az3t3dErB1/w9gLmC1
+nY9mfTdrCynQFJgQ5Qr
=O4x1
-----END PGP SIGNATURE-----

--DH4/xewco2zMcht6--

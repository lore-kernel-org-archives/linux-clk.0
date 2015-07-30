Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 30 Jul 2015 12:09:08 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@kernel.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Doug Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Alex Elder <elder@linaro.org>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Sascha Hauer <kernel@pengutronix.de>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Chao Xie <chao.xie@marvell.com>,
	Jason Cooper <jason@lakedaemon.net>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Andrew Bresticker <abrestic@chromium.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Georgi Djakov <georgi.djakov@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Barry Song <baohua@kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Viresh Kumar <viresh.linux@gmail.com>,
	Gabriel FERNANDEZ <gabriel.fernandez@st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Peter De Sc hrijver <pdeschrijver@nvidia.com>,
	Tero Kristo <t-kristo@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Olof Johansson <olof@lixom.net>,
	Tyler Baker <tyler.baker@linaro.org>
Subject: Re: [PATCH v3 0/2] clk: improve handling of orphan clocks
Message-ID: <20150730100908.GI2564@lukather>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
 <554BD33D.7050907@codeaurora.org>
 <20150508100247.GQ11057@lukather>
 <4099394.C7vEjTFs8V@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OMWfJhzSPULbgPV"
In-Reply-To: <4099394.C7vEjTFs8V@diego>
List-ID: <linux-clk.vger.kernel.org>


--0OMWfJhzSPULbgPV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

On Mon, Jul 27, 2015 at 10:57:33AM +0200, Heiko St=FCbner wrote:
> > > Also we can try to see if critical clocks aren't being forced on by
> > > applying this patch and looking for clk_get() failures
> >=20
> > And that shows that the CPU and DDR clocks are not protected, which
> > obviously is pretty mad.
> >=20
> > I've mass converted all our probing code to use OF_CLK_DECLARE, and
> > make things work again.
> >=20
> > http://code.bulix.org/5goa5j-88345?raw
> >=20
> > Is this an acceptable solution?
> >=20
> > We were already moving to this, I'm not really fond of doing this like
> > that, but I guess this whole debacle makes it necessary.
>=20
>=20
> did this lead anywhere meanwhile.
>=20
> Last I remember the change to orphan handling made sunxi fail, but
> I'm still hoping to get this usable at some point :-)

To be honest, I don't know what the current status is. I haven't get
any news since that mail.

I started to move a significant portion of our clocks to
CLK_OF_DECLARE, but not all of them are (which probably make the
situation worse for the time being).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--0OMWfJhzSPULbgPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuffEAAoJEBx+YmzsjxAgj+AP/jqrMrqEMYIGWB1/O1aWO+rc
jEt9NgPjkRayhyb8e7EbS7yAPbn2g9Y08LzPE1R4JAhyLh/5SLmGErz+vtzDGzs1
46eoSBeo3BulYWdZadj0gFX7bj+JhmNG2wYgl7BcMXoqkwHxD/pYk/tCAahXwyBQ
Qd50eMDQkCKnfSiTHqPjM59ot2/E7bUrce9KFf1lJ5CkV4c7WyhMCXEUMnmrXqhk
zfy73/GwR1ehWPkZJDKVdYwMB4k0xa89zskMCb7UWphpi7UVPCtEgTwsXq9NvMGK
Af1dKba9Tsd6nNSdB58A5bG4yb0Kk1krQuAK1TN5qYdfvDH/6sdJGX+RSB2yOKUm
yL3/Wizw/kL71jtJgNQZ50WTQfs6dhTYsfuKsA6y59QV8EyM2TjxyFo9IqjyJ79g
bVT0jfxJVgHrhLeAsOGHv6Gg2jKDp5Okbousi+XbiEhX+ufBCcJf2T5OCSsIV5FQ
7brGQlr6N0vAjSE5XUl2qWLDrh3q5Ykm98clYSkt+Fu7/kMeD2/E8uNxBkk91f5f
lLHJYb/wYVNGu4xWKIR9WuA6qVViguGid+uQ6B2SCzeYj9EoLU6xSS7fnzHs+yHN
OYWcERBHbQYe2W3qv+F4OLYM9LWt347vvJ7kEQewJoHMhCpx6Lx9U4HJ68SzkKI1
l91PtXPaPeh+Mqbfy2te
=ej/e
-----END PGP SIGNATURE-----

--0OMWfJhzSPULbgPV--

Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 13 May 2015 22:14:26 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Kevin Hilman <khilman@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Mike Turquette <mturquette@linaro.org>,
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
Message-ID: <20150513201426.GH4004@lukather>
References: <1981330.kGUrTurMy5@diego>
 <5543E79F.2080400@codeaurora.org>
 <22709390.NTAlubMgNB@diego>
 <55440EDA.4030905@codeaurora.org>
 <CAMAWPa_n+59+v+x3fKkmdtW1wMJF7kqtTjLLowmv1xwGWprYJw@mail.gmail.com>
 <554BD33D.7050907@codeaurora.org>
 <20150508100247.GQ11057@lukather>
 <55528046.4030107@codeaurora.org>
 <20150513130304.GA4004@lukather>
 <7hiobw8s31.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
In-Reply-To: <7hiobw8s31.fsf@deeprootsystems.com>
List-ID: <linux-clk.vger.kernel.org>


--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2015 at 07:33:54AM -0700, Kevin Hilman wrote:
> Maxime Ripard <maxime.ripard@free-electrons.com> writes:
>=20
> > On Tue, May 12, 2015 at 03:35:50PM -0700, Stephen Boyd wrote:
> >> On 05/08/15 03:02, Maxime Ripard wrote:
> >> > On Thu, May 07, 2015 at 02:03:57PM -0700, Stephen Boyd wrote:
> >> >> On 05/07/15 08:17, Kevin Hilman wrote:
> >> >>> On Fri, May 1, 2015 at 4:40 PM, Stephen Boyd <sboyd@codeaurora.org=
> wrote:
> >> >>>> On 05/01/15 15:07, Heiko St=FCbner wrote:
> >> >>>>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
> >> >>>>>
> >> >>>>>>> Instead I guess we could hook it less deep into clk_get_sys, l=
ike in the
> >> >>>>>>> following patch?
> >> >>>>>> It looks like it will work at least, but still I'd prefer to ke=
ep the
> >> >>>>>> orphan check contained to clk.c. How about this compile tested =
only patch?
> >> >>>>> I gave this a spin on my rk3288-firefly board. It still boots, t=
he clock tree
> >> >>>>> looks the same and it also still defers nicely in the scenario I=
 needed it
> >> >>>>> for. The implementation also looks nice - and of course much mor=
e compact than
> >> >>>>> my check in two places :-) . I don't know if you want to put thi=
s as follow-up
> >> >>>>> on top or fold it into the original orphan-check, so in any case
> >> >>>>>
> >> >>>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
> >> >>>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >> >>>> Thanks. I'm leaning towards tossing your patch 2/2 and replacing =
it with
> >> >>>> my patch and a note that it's based on an earlier patch from you.
> >> >>> It appears this has landed in linux-next in the form of 882667c1fc=
f1
> >> >>> clk: prevent orphan clocks from being used.  A bunch of boot failu=
res
> >> >>> for sunxi in today's linux-next[1] were bisected down to that patc=
h.
> >> >>>
> >> >>> I confirmed that reverting that commit on top of next/master gets
> >> >>> sunxi booting again.
> >> >>>
> >> >>>
> >> >> Thanks for the report. I've removed the two clk orphan patches from
> >> >> clk-next. Would it be possible to try with next-20150507 and
> >> >> clk_ignore_unused on the command line?
> >> > This makes it work, but it's not really an option.
> >> >
> >>=20
> >> Hmm.. I thought it didn't fix it for Kevin. Confused.
> >
> > I'm too, but it does fix things here.
>=20
> To be more precise on what I tested.  I used next-20150507 and tested on
> 4 different sunxi platforms.  First test was "normal" commandline,
> second was with clk_ignore_unused appended:
>=20
>   - cubie: fail, fail
>   - cubie2: fail, fail
>   - bananpi: fail, pass
>   - cubietruck: fail, pass
>=20
> So it seems to have some effect, but by itself, doesn't fix the issue.

It's very odd, I actually tried with a cubie2 here...

I'm booting on an initramfs and not MMC though, but I can't see how
that can be related to our issue...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVU7ChAAoJEBx+YmzsjxAg+LMP+gOw15H51FiYzSbySBYbmVbj
6GuBSneG629qCXG1AvkBVbewMJXDmgxs9YybAazxVzsLWzX4dizVvby9iCE66Q48
opRlJAaTXGkZ9lElU2Ix1zmBxqxhr5a2OdbozabCBAbMN2xp1qqPNx1eXU8vwHj6
83X/HHFcaZBby7w0VUbug7ON52gyEA4P90Gf7vdOmpUy43eRwB7ciptKOsRGd9oO
TKF62fNGwwOqG4CnzLLAwn/JYe5gp57lokkK/ymek8/dDod3GHa8GzvSn9EqLDfY
drRuHgIq/pIgC8uLIcLpm/If9r8TeQXfuvNzP9+a1RzXmCW4uzybIIvjYM+SFE5o
JQbAM2M6Grn64uqi60kHREL9P5miLF5HGfjr5FTf60SS0b5Q08MTUbDbw9Kg7+rY
6lmqien9w3KgjjlpI60TPCXUfQSvgHnUb+UFsf/NQGWeNQc/ypyo+1/mjEvYm51r
WV375ekz7b830tYSDnkRLpORamyOdUQBNd9509rUYD1XlTnMKWLwELn8+xHI8zEd
qg4ONt2z6Wud15913ireASHLDc+4wwrGBsMYTiOVQjov3HvcxwrLXP4ZJpfLH/vW
PsBSVgynnXozyRn57ashsgW8a+PTWxc13kpGnwC/3alzo9PYh9s8c9AWWGdHY6jf
8iq2nJjy8heph1ZQIblN
=hDiT
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--

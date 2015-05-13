Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 13 May 2015 15:03:04 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kevin Hilman <khilman@kernel.org>,
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
Message-ID: <20150513130304.GA4004@lukather>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
 <1981330.kGUrTurMy5@diego>
 <5543E79F.2080400@codeaurora.org>
 <22709390.NTAlubMgNB@diego>
 <55440EDA.4030905@codeaurora.org>
 <CAMAWPa_n+59+v+x3fKkmdtW1wMJF7kqtTjLLowmv1xwGWprYJw@mail.gmail.com>
 <554BD33D.7050907@codeaurora.org>
 <20150508100247.GQ11057@lukather>
 <55528046.4030107@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
In-Reply-To: <55528046.4030107@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 03:35:50PM -0700, Stephen Boyd wrote:
> On 05/08/15 03:02, Maxime Ripard wrote:
> > On Thu, May 07, 2015 at 02:03:57PM -0700, Stephen Boyd wrote:
> >> On 05/07/15 08:17, Kevin Hilman wrote:
> >>> On Fri, May 1, 2015 at 4:40 PM, Stephen Boyd <sboyd@codeaurora.org> w=
rote:
> >>>> On 05/01/15 15:07, Heiko St=FCbner wrote:
> >>>>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
> >>>>>
> >>>>>>> Instead I guess we could hook it less deep into clk_get_sys, like=
 in the
> >>>>>>> following patch?
> >>>>>> It looks like it will work at least, but still I'd prefer to keep =
the
> >>>>>> orphan check contained to clk.c. How about this compile tested onl=
y patch?
> >>>>> I gave this a spin on my rk3288-firefly board. It still boots, the =
clock tree
> >>>>> looks the same and it also still defers nicely in the scenario I ne=
eded it
> >>>>> for. The implementation also looks nice - and of course much more c=
ompact than
> >>>>> my check in two places :-) . I don't know if you want to put this a=
s follow-up
> >>>>> on top or fold it into the original orphan-check, so in any case
> >>>>>
> >>>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
> >>>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >>>> Thanks. I'm leaning towards tossing your patch 2/2 and replacing it =
with
> >>>> my patch and a note that it's based on an earlier patch from you.
> >>> It appears this has landed in linux-next in the form of 882667c1fcf1
> >>> clk: prevent orphan clocks from being used.  A bunch of boot failures
> >>> for sunxi in today's linux-next[1] were bisected down to that patch.
> >>>
> >>> I confirmed that reverting that commit on top of next/master gets
> >>> sunxi booting again.
> >>>
> >>>
> >> Thanks for the report. I've removed the two clk orphan patches from
> >> clk-next. Would it be possible to try with next-20150507 and
> >> clk_ignore_unused on the command line?
> > This makes it work, but it's not really an option.
> >
>=20
> Hmm.. I thought it didn't fix it for Kevin. Confused.

I'm too, but it does fix things here.

> >> Also we can try to see if critical clocks aren't being forced on by
> >> applying this patch and looking for clk_get() failures
> > And that shows that the CPU and DDR clocks are not protected, which
> > obviously is pretty mad.
> >
> > I've mass converted all our probing code to use OF_CLK_DECLARE, and
> > make things work again.
> >
> > http://code.bulix.org/5goa5j-88345?raw
> >
> > Is this an acceptable solution?
> >
> > We were already moving to this, I'm not really fond of doing this like
> > that, but I guess this whole debacle makes it necessary.
> >
>=20
> I wonder why we can't switch out the clk_ops on the affected platforms +
> clocks to be read-only (at least for the enable/disable part)? That
> would fix it just the same right? I wasn't around for the original
> discussion regarding this always-on stuff so perhaps I've missed somethin=
g.

We're using clk-gate, so that would require to recode our own
driver. That change seemed less invasive, while fixing the issue and
ensuring that we wouldn't have any orphan clock, which seems to be
hunted down these days...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVU0uIAAoJEBx+YmzsjxAgV1EQAJe8az6hxbIDP1quyDNw9s0I
dGa3WtDvmHPrm/DaoKmnv/JpsFISb+pRrBvr6hsKWYtkdfq5EB0REpWVuyOKtvoN
DGx/IRp4oqWQy1GaYrUH9m8hTZ7tGYpVask2ujEgN0Q0yKjMXJ/8gT7HnOZ2f6s0
cAKkS0Ys/fEqFU0lQGcQKQccUQO4LNMcXZLsqCLUKOhwx/WPwfERhltFSoW9Ffis
7BmgkPKrQ4HzEsOucJz+KE4N0upsOFqZuIOW9CclW6PR8vCx2Nr4EsRzCkVSUIPX
DUg+OQ0dT9/fJSLlF7/39y00jfz0+Gc++hu5Izn+IE4KVEknsx419MljiNBnLLM6
7Me4RDwUKSR84n/pbgB25CdDuLkqJu/IH8t9Kop9NO2JcPPNQU+Hm455m9KKOFys
MDihzmGiBnQUCwJ67rZuyUtaqqxOYRy+2klVva/T2cIFGZu1X3Xio8Rhbc7AWqxY
/BhnooenvBChaW0T/5xbnuyOA4uifPmNcQJkrFnih+uGohT8Z8RwD/dEDMTxFr8O
ZQkrjXCYokV5JNwxmivfc+yzOw9fpRS/p8mKf0Lp8dVecx8amkMANrcP85JR0cEr
gJA5HXrc9/SuEBXXJWQVERrANHDJ4dHT8E7dKQszYfG3xsFUMWxZzN0IKhnEp3uk
ys0F8gX7nKIFqAikZrAa
=WlTj
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

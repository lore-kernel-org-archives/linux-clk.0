Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 8 May 2015 12:02:47 +0200
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
Message-ID: <20150508100247.GQ11057@lukather>
References: <1429735986-18592-1-git-send-email-heiko@sntech.de>
 <1981330.kGUrTurMy5@diego>
 <5543E79F.2080400@codeaurora.org>
 <22709390.NTAlubMgNB@diego>
 <55440EDA.4030905@codeaurora.org>
 <CAMAWPa_n+59+v+x3fKkmdtW1wMJF7kqtTjLLowmv1xwGWprYJw@mail.gmail.com>
 <554BD33D.7050907@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zywvytGCXzdVpkje"
In-Reply-To: <554BD33D.7050907@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>


--zywvytGCXzdVpkje
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2015 at 02:03:57PM -0700, Stephen Boyd wrote:
> On 05/07/15 08:17, Kevin Hilman wrote:
> > On Fri, May 1, 2015 at 4:40 PM, Stephen Boyd <sboyd@codeaurora.org> wro=
te:
> >> On 05/01/15 15:07, Heiko St=FCbner wrote:
> >>> Am Freitag, 1. Mai 2015, 13:52:47 schrieb Stephen Boyd:
> >>>
> >>>>> Instead I guess we could hook it less deep into clk_get_sys, like i=
n the
> >>>>> following patch?
> >>>> It looks like it will work at least, but still I'd prefer to keep the
> >>>> orphan check contained to clk.c. How about this compile tested only =
patch?
> >>> I gave this a spin on my rk3288-firefly board. It still boots, the cl=
ock tree
> >>> looks the same and it also still defers nicely in the scenario I need=
ed it
> >>> for. The implementation also looks nice - and of course much more com=
pact than
> >>> my check in two places :-) . I don't know if you want to put this as =
follow-up
> >>> on top or fold it into the original orphan-check, so in any case
> >>>
> >>> Tested-by: Heiko Stuebner <heiko@sntech.de>
> >>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >> Thanks. I'm leaning towards tossing your patch 2/2 and replacing it wi=
th
> >> my patch and a note that it's based on an earlier patch from you.
> > It appears this has landed in linux-next in the form of 882667c1fcf1
> > clk: prevent orphan clocks from being used.  A bunch of boot failures
> > for sunxi in today's linux-next[1] were bisected down to that patch.
> >
> > I confirmed that reverting that commit on top of next/master gets
> > sunxi booting again.
> >
> >
>=20
> Thanks for the report. I've removed the two clk orphan patches from
> clk-next. Would it be possible to try with next-20150507 and
> clk_ignore_unused on the command line?

This makes it work, but it's not really an option.

> Also we can try to see if critical clocks aren't being forced on by
> applying this patch and looking for clk_get() failures

And that shows that the CPU and DDR clocks are not protected, which
obviously is pretty mad.

I've mass converted all our probing code to use OF_CLK_DECLARE, and
make things work again.

http://code.bulix.org/5goa5j-88345?raw

Is this an acceptable solution?

We were already moving to this, I'm not really fond of doing this like
that, but I guess this whole debacle makes it necessary.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--zywvytGCXzdVpkje
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVTInHAAoJEBx+YmzsjxAgpQsP/1doPKcrn0NR2bYrnAHjwjqR
dNJw5L31k4WFwgATYI/FZ7dnMPHL2F5N8st2qmIYLu7WZLf9ZWc+sOtnAzxmhfuW
citr0kNoYC+heIFW1n7OSvETWOopDtEqmfInVpLQFzRMIB7KmxCfq69dxiScjIl8
XokwV28xZTq12ypoLqLhMvHg/3iI+3Lqay0z+6csMubqRVglZynqJgRzrRv633Q+
mrH4bE/DTS7Db9oavNg5trhi34vO0yR6JUH3eXvWgC3CJMmLzRaDciqh5dfpV6+Q
WlFYKhsK5yy1j8WX4PskxfruGIzjib3QNsl/wmhpSDoe+rd6MzcE5pHw20L4ci7Y
cMOrYPM4bUIyRuC/1atePl3tA8Mt0YJqZCSKCLisP17XQUEoAI4anaDbMZ46OVqk
qRxhASME76iLn0tYwulHsqnoMMhYF06wcr6teZYnbn+Gz8Z00+xiwVSWGOh90O0L
TTrXjXBhh993F/AkxZcvleEcyM1I/X4JykFKzVxYgw6KH7QDv3CLFPqriXtwsl+w
3wKvzELjnDBtf9dPuGaZzIVnsWSbMkrabTNzoNPQGWqSiKlvLBEf3r8bKsfF5P69
Almd/ZTS4gJ9Rk4kRT5o4JW0byjhkMhJ4c2yCSYgAKrTatp8Tq5QIAYSr836buyY
NXLUvETjco0e6pnmVWF5
=pJtw
-----END PGP SIGNATURE-----

--zywvytGCXzdVpkje--

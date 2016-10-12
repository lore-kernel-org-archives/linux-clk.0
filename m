Return-Path: <broonie@sirena.org.uk>
Date: Wed, 12 Oct 2016 10:56:59 +0200
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	John Stultz <john.stultz@linaro.org>, Andreas Mohr <andi@lisas.de>,
	Brian Norris <briannorris@chromium.org>,
	Tao Huang <huangtao@rock-chips.com>,
	Tony Xie <tony.xie@rock-chips.com>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>
Message-ID: <20161012085659.y74qnipuwdblkjjh@sirena.org.uk>
References: <1476133442-17757-1-git-send-email-dianders@chromium.org>
 <alpine.DEB.2.20.1610110908240.7794@nanos>
 <CAD=FV=VTc-RFNiUqkKDr=NFWhphV7r2J+EudSbqt4X3TX62mQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hawcpf24p6g7vfdm"
In-Reply-To: <CAD=FV=VTc-RFNiUqkKDr=NFWhphV7r2J+EudSbqt4X3TX62mQw@mail.gmail.com>
Subject: Re: [PATCH v2] timers: Fix usleep_range() in the context of
 wake_up_process()
List-ID: <linux-clk.vger.kernel.org>


--hawcpf24p6g7vfdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 11, 2016 at 09:33:15AM -0700, Doug Anderson wrote:
> On Tue, Oct 11, 2016 at 12:14 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> > On Mon, 10 Oct 2016, Douglas Anderson wrote:

> >> Users of usleep_range() expect that it will _never_ return in less time
> >> than the minimum passed parameter.  However, nothing in any of the code
> >> ensures this.  Specifically:

> > There is no such guarantee for that interface and never has been, so how
> > did you make sure that none of the existing users is relying on this?

> > You can't just can't just declare that all all of the users expect that and
> > be done with it.

> You're right that I can't guarantee that no callers are relying on the
> existing behavior of a wake_up_process() causing usleep_range() to
> return early.  I would say, however, that all callers I've seen are
> absolutely relying on the min delay being enforced and I've never
> personally seen a caller relying on being woken up from
> usleep_range().  All the users relying on the min delay being enforced

Indeed.  It's *highly* surprising for any sleep interface to undershoot
on delays, the usual thing is that they might delay for longer.  If the
function doesn't actually reliably delay for the minimum time then I'd
expect that a large proportion of those conversions and other recent
code that's been added is buggy.

> one of two functions: usleep_atlest() and usleep_wakeable().  As
> argued below I think that usleep_range() name implies that it will at
> least sleep the minimum so I would really like to avoid keeping the
> name usleep_range() and also keeping the existing behavior.

I tend to agree with everything Doug is saying in terms of API
expectations.

--hawcpf24p6g7vfdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJX/frXAAoJECTWi3JdVIfQX7UH/it23a1hvDi2h8XCii6fHgkU
X+i8VtEzCd2jNihGL6FoUYvLu71BvWYd/Pbe+mR5tIO57dhitRnfXkSwvD5VCO0o
K+0o/4zFULAyjRuE5pTUCO0cv6dVrIZscVv7tiym8CSE35eOzmvHFdz5BqCfXDJn
GI55tk1IN4GI/GB4+kUQZwx6bmeTCkY90qKt2mfbh6FJ5tpba04xnbsNGnPmxkWf
M3ntKRM84lfvhBs17z0QkWEtP9YQLZ0A0uuniMGawGTumiiGUJlnwMx2thAe1/1G
R3LpO5Hp1KLIUg23yBMxIe81vXyEg2zo9inyu/Q90dvr9JTuMqLA+UcdT0vYNSg=
=ECTj
-----END PGP SIGNATURE-----

--hawcpf24p6g7vfdm--

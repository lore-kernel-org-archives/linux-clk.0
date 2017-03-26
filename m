Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 26 Mar 2017 22:51:24 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Add driver for A83T CCU
Message-ID: <20170326205124.vdjbmjukfysgbefc@lukather>
References: <20170214033526.16977-1-wens@csie.org>
 <20170214033526.16977-5-wens@csie.org>
 <20170214095819.utsftcvti5zdmlmi@lukather>
 <CAGb2v66PxbhUdqSwFc5iFN2wDVQbOsibDkckXpFsxXW1WJNe3w@mail.gmail.com>
 <20170215094954.h3wyaxlqkeb342yu@lukather>
 <CAGb2v67ey1Ppc3wf1154QKoCX-xsOjWDEsXi5gxPbL4MY37zHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bf6mpdsqixwtklyz"
In-Reply-To: <CAGb2v67ey1Ppc3wf1154QKoCX-xsOjWDEsXi5gxPbL4MY37zHw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--bf6mpdsqixwtklyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Wed, Mar 22, 2017 at 02:50:31PM +0800, Chen-Yu Tsai wrote:
> On Wed, Feb 15, 2017 at 5:49 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > On Tue, Feb 14, 2017 at 06:26:39PM +0800, Chen-Yu Tsai wrote:
> >> On Tue, Feb 14, 2017 at 5:58 PM, Maxime Ripard
> >> <maxime.ripard@free-electrons.com> wrote:
> >> > On Tue, Feb 14, 2017 at 11:35:25AM +0800, Chen-Yu Tsai wrote:
> >> >> +/* Some PLLs are input * N / div1 / P. Model them as NKMP with no =
K */
> >> >
> >> > Is that even working?
> >>
> >> Looking at the nkmp clock code, only .recalc_rate will work properly t=
hough.
> >> Maybe I could fix up the code so it handles zero width factors.
> >>
> >> > I'm not quite sure we want to do that. We might model it as a NP clo=
ck
> >> > with a variable prediv?
> >>
> >> There's no NP clock type yet. And a problem with a variable prediv is =
that
> >> it doesn't participate in factor calculation. It's effectively fixed.
> >>
> >> I did this for the A80 as well though. Fixing up the NKMP clock might =
be
> >> easier.
> >
> > Then maybe we just need a NMP clock type then. What I'm really afraid
> > of is that we'll just end up in a clk-factors situation that was
> > simply impossible to maintain without breaking anything, hence why we
> > had different clock types then.
>=20
> Upon further review, I think it will work. I did notice a discrepancy
> between .set_rate and .round_rate though. Will send fixes later.
>=20
> About the old clk-factors situation, I'm not exactly sure what part
> you're referring to.

We need to be able to support old DTs, which will still use the old
clock code. Whatever solution we come up with need to take that into
account.

> To me it seems the "factors" bits are mostly the same. Differences
> are mostly with parent-specific pre-dividers, clock post-dividers,
> and non-standard factors. The first is nicely handled by the new mux
> wrapper, the second is currently only used with NK types, and the
> last is currently only supported by single factor divider or
> multiplier clocks with tables.
>=20
> Non-standard factors are probably the trickiest one, but given we will
> support full factor tables for some of the tricky CPU PLLs, this is
> probably solved, even if not implemented yet.
>=20
> I'll start with the NP style clocks, which only use P when the output
> is under a certain frequency.

Do we need to use a P factor? I mean, we can just create a custom
clock for that, I'd realy don't want to cripple the generic code for a
completely non-generic problem.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bf6mpdsqixwtklyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY2CnIAAoJEBx+YmzsjxAgT6MP/3H8ljhykejdroCTuH2BZutm
WHvYGgHAwU03IRuxtPxYtlIisXtLFl2m7j6+IXYVJIUw2jH/01MiqWdXMvDzTZx8
HOj1OOHXu+BRia32pGmZR+fQIrhoGFcIHj9GN1pmEhcteGM08+KWbhCpm8Y4DO+V
TxVoqC6ncKaZ8JorhNqjTnfqWyxqpbzl6sD/O+EhmGyIW7VkBTdoP27IVZ7jEsNS
CT1hsNKpq72Fcd0JXGjiOxfYoiTGUypqr0bNVn6xv+wEfzYHvJoBa54oN3KhSqdz
fV9Mzxf8n5tvgq3ShgQq+WgwiISqz8auaDakCTOm23wlIRa7bbAW5aX1yHMc5jT9
9ZboYz8RP3Do8OrtOI1fEpwE14qV73Fke4xW+F0NVBgexUv3U0RCRDSI2XTmtzcp
FENW3+nvEh5AFv2FX9WFt+nsMF7xngc2bCBZ+E7hEVp5K9IcRyOGCuH0n+qlqYeC
4XqZDErb6v+fUjr/G4UuxGJZ3WaCtP2Gl800ricbbaXA5Wn5hnZPrEQVmt3foRPq
Q4WI3bE/QAM9JuA57QYVIc47upDQqOjXsjpNrXDEr4MRjOLBHqXAJ/MpKIKBX6Mu
gKNv8IAuxghRVvCazulOyK5v+wI1oTomjLQsrLZ4N8xC7vt+qlJgwpEBNUMqMBGz
0CedYIo2AizXqarG89st
=/Cj7
-----END PGP SIGNATURE-----

--bf6mpdsqixwtklyz--

Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 3 Apr 2017 09:53:53 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Add driver for A83T CCU
Message-ID: <20170403075353.ep4yoadxjpw5c5vf@lukather>
References: <20170214033526.16977-1-wens@csie.org>
 <20170214033526.16977-5-wens@csie.org>
 <20170214095819.utsftcvti5zdmlmi@lukather>
 <CAGb2v66PxbhUdqSwFc5iFN2wDVQbOsibDkckXpFsxXW1WJNe3w@mail.gmail.com>
 <20170215094954.h3wyaxlqkeb342yu@lukather>
 <CAGb2v67ey1Ppc3wf1154QKoCX-xsOjWDEsXi5gxPbL4MY37zHw@mail.gmail.com>
 <20170326205124.vdjbmjukfysgbefc@lukather>
 <CAGb2v647bc0VdYTQDyEjAerKnfjtkDYGdhnUgpTU-Tuns6FYYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="roay77adqyqvkcju"
In-Reply-To: <CAGb2v647bc0VdYTQDyEjAerKnfjtkDYGdhnUgpTU-Tuns6FYYA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--roay77adqyqvkcju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2017 at 04:53:05PM +0800, Chen-Yu Tsai wrote:
> >> To me it seems the "factors" bits are mostly the same. Differences
> >> are mostly with parent-specific pre-dividers, clock post-dividers,
> >> and non-standard factors. The first is nicely handled by the new mux
> >> wrapper, the second is currently only used with NK types, and the
> >> last is currently only supported by single factor divider or
> >> multiplier clocks with tables.
> >>
> >> Non-standard factors are probably the trickiest one, but given we will
> >> support full factor tables for some of the tricky CPU PLLs, this is
> >> probably solved, even if not implemented yet.
> >>
> >> I'll start with the NP style clocks, which only use P when the output
> >> is under a certain frequency.
> >
> > Do we need to use a P factor? I mean, we can just create a custom
> > clock for that, I'd realy don't want to cripple the generic code for a
> > completely non-generic problem.
>=20
> I'm not sure. AFAIK the vendor BSP cpufreq doesn't use frequencies
> low enough to require the P divider, so we could just ignore it. But
> then we need to make sure it's set to 1 at probe time, while keeping
> the output frequency usable, which would kind of bloat the probe
> function. FYI I'm in favor of doing it this way.

Hmmm, I don't know why I replied that anymore, I thought you were
still talking about MMC, while you were clearly talking about
CPU_PLLs...

The question still remains though. If we're not using P yet, and if
the BSP doesn't either, then we can just hardcode it.

We can always come up with something later if we need to use it,
either an NP-class, or a table. The only thing we need to care about
would be to pay attention to what the P factor already is, before
forcing it to 1. If it's set to 4, that would mean multiplying the CPU
clock by 4, which is probably not such a great idea.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--roay77adqyqvkcju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4f+NAAoJEBx+YmzsjxAgHA4P/RcAV2Tt+X2V3S4anHFPhObN
aa31dMrkM25tn5f26GLbY2QK2mPC73oHtWrA3xoJx7ebS2GYBNghanwFYtCvyEFU
ybNx74FnyD03mfnvCzDmeHAmUU2yJVKsPJTNcBwbS+nw/FBUOXlLbEqPysEG71NS
YKEUjFX9V93beUb2qK6jEl3Cqky8XgtuOjmJCT3pITlNF2uLDKhSHaXjs/+3P6wB
i2aydWNEEHMTNZgkGtTwdJJgXF5y/CPUr+zPsnrVwHI+yswjzhIuYDnq+o7mQQU1
5QxxYi4sf99AEbOIDQBSU4ZuxF5auzUPGrDUi0ci/cup+Hm1CpsTU0lYPFDjLmOQ
IIGAjLQmI/0fUnr5aHaYXI2k/wMDpWacWw66hNBX+gCRbR/cml8hWnLEFpzjcUUy
fhnH0edsJeNdZYhN7gyDHZpykQ4sDcIixkNq4E5VhlyI6L7Nu46HNB8k6sDLmB8N
GcM2pCQ+WLMucyjkO1DSJBPVDrB3P4zbYKiNwHiOGjewC4L53sAY7lAqm9c9BI71
5LLVPg+aOLTWgLdzyVhyrtmFsUack0TuF6UI+4BX1CM2o7MtgeRkABbcfX7P9M4d
nHrLSoNcid9A3NAJ6jOoU1AyAyRbdRYLU70jh/ArS7g32z9mZjQQS/61PpqB6/b0
bdeXBudCPts9FoCCybUn
=4mBa
-----END PGP SIGNATURE-----

--roay77adqyqvkcju--

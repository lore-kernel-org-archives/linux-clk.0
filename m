Return-Path: <broonie@sirena.org.uk>
Date: Tue, 16 Aug 2016 11:51:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20160816105158.GQ9347@sirena.org.uk>
References: <1470915049-15249-1-git-send-email-broonie@kernel.org>
 <20160815220610.GG361@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="suroagWEfFHnktSq"
In-Reply-To: <20160815220610.GG361@codeaurora.org>
Subject: Re: [PATCH] clk: Make clock framework user selectable
List-ID: <linux-clk.vger.kernel.org>


--suroagWEfFHnktSq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 15, 2016 at 03:06:10PM -0700, Stephen Boyd wrote:
> On 08/11, Mark Brown wrote:

> >  config COMMON_CLK
> > -	bool
> > +	bool "Common Clock Framework Support"
> > +	depends on !HAVE_CUSTOM_CLK

> Is the plan that architectures will keep selecting this when they
> want to enforce common clk framework on their arch? We could move

I think that's a per-architecture thing - if the architecture doesn't
need control of clocks then there's no reason for it to force the API
on, but if the architecture is unlikely to do anything useful without
then it's a different story.

> enabling this config to the defconfigs if we make of_clk_init() a
> stub when this config is disabled. Interestingly arm already has
> that ifdefed out so nothing fails to compile there, but not every
> arch is following that design.

That's probably a good idea anyway.

> Also, are there patches for all the users to select
> HAVE_CUSTOM_CLK? Otherwise we can get randconfig failures when
> two places define clk API functions.

They're trivial to make if you apply this.

--suroagWEfFHnktSq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXsvBNAAoJECTWi3JdVIfQQpwH/3gq9WQXwCmjPDCoc67Mlbig
i8KNdbT5Xoj6IQ771ExYAZhdOAejiEB2z87MeXuM1HhZdQ6T0yGsNTv3ViJ375Jt
EHQi8PlVCresSdj9y3ziqQP3gp7xYu0shIvolxyNpfI19hLhCVALlnWi82IYVzVg
lVBL1S6LDstLxuij1/6AarkYP2rV4B8JdpA/dSncyW9SinxtDh2R0LRa9kX0SiiT
iHxw6uc3jcCieMAbe4HsT5gzB7erx+zSlwLPRZuQMY3x+ZahbsMjU9HrgbI46l/o
ZNNYqP3jcFsHozfYzFFLAuagOvyarCzo1kJm0i4DABrlyFpXlb10FL8vG6WemzM=
=sN9d
-----END PGP SIGNATURE-----

--suroagWEfFHnktSq--

Return-Path: <broonie@sirena.org.uk>
Date: Fri, 26 Jan 2018 12:52:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Sriram Periyasamy <sriramx.periyasamy@intel.com>
Cc: ALSA ML <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Vinod Koul <vinod.koul@intel.com>,
	Patches Audio <patches.audio@intel.com>, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-clk@vger.kernel.org,
	Naveen M <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v7 4/6] ASoC: Intel: eve: Enable mclk and
 ssp sclk early
Message-ID: <20180126125223.GD32674@sirena.org.uk>
References: <1515065119-1683-1-git-send-email-sriramx.periyasamy@intel.com>
 <1515065119-1683-5-git-send-email-sriramx.periyasamy@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
In-Reply-To: <1515065119-1683-5-git-send-email-sriramx.periyasamy@intel.com>
List-ID: <linux-clk.vger.kernel.org>


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 04:55:17PM +0530, Sriram Periyasamy wrote:
> From: Naveen M <naveen.m@intel.com>
>=20
> rt5663 and rt5514 needs mclk/sclk early to synchronize its internal
> clocks.

This doesn't apply against current code, please check and resend.

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlprJIYACgkQJNaLcl1U
h9AwjQf+OIVn1Y4DiqTEgCrN4VGWgt1Q5yhvTrYRa2cbNIpBQy6UvHOP4gWEWdho
h501Yhz67OCEUsve3iIQ4a4XmXOawq/ZmsoZHDNMqbwqFdHGwPrOIwUm864n7u9U
BfNs2+CWsF8BoxUVRTNHvBeATNoYu9eiRIGS9EThZitFP+7p5Z8T4SS5Ayb0kbkw
lIRZ+6RzpEbbmykqRh/twKbdgjCTlqLYwFSeUJBvx6tEPhWyxO5bCKKwY5Bsrk8R
3+KC4ZZ2ahSKIMMSyZWBNRYeVWBSchjV7TfYMdaE4dpZ+0BvtwilZ0sSVM0rvrIs
hpsnAuQCyrkpS7xmafrRAnWPkhdGLA==
=8QM8
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--

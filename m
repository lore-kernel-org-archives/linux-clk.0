Return-Path: <broonie@sirena.org.uk>
Date: Tue, 4 Oct 2016 15:07:27 +0200
From: Mark Brown <broonie@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
	vinod.koul@intel.com, maxime.ripard@free-electrons.com,
	wens@csie.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	lee.jones@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com, alexandre.belloni@free-electrons.com
Message-ID: <20161004130727.srmaielkvd2z5k3s@sirena.org.uk>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
 <85cbd9926e52d0aa03f6bbfd8794373d8db491e0.1475571575.git.mylene.josserand@free-electrons.com>
 <20161004144008.0d07d18c@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gpztr7jxwopd7ip3"
In-Reply-To: <20161004144008.0d07d18c@free-electrons.com>
Subject: Re: [PATCH 06/14] ASoC: Add sun8i digital audio codec
List-ID: <linux-clk.vger.kernel.org>


--gpztr7jxwopd7ip3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 04, 2016 at 02:40:08PM +0200, Thomas Petazzoni wrote:

> > +/* CODEC_OFFSET represents the offset of the codec registers
> > + * and not all the DAI registers
> > + */

> This is not the proper comment style I believe for audio code, it
> should be:

> /*
>  * ...
>  */

I don't care, IIRC that's something from CodingStyle which checkpatch
moans about.

> > +	/* pcm operations */
> > +	.ops = &sun8i_codec_dai_ops,
> > +};
> > +EXPORT_SYMBOL(sun8i_codec_dai);

> This EXPORT_SYMBOL looks wrong. First because it doesn't seem to be
> used outside of this module. And second because using EXPORT_SYMBOL on
> a function defined as static doesn't make much sense, as the "static"
> qualifier limits the visibility of the symbol to the current
> compilation unit.

Also all the ASoC code is _GPL so a non-GPL export is an issue.

> > +	.component_driver = {
> > +		.dapm_widgets		= sun8i_codec_dapm_widgets,
> > +		.num_dapm_widgets	= ARRAY_SIZE(sun8i_codec_dapm_widgets),
> > +		.dapm_routes		= sun8i_codec_dapm_routes,
> > +		.num_dapm_routes	= ARRAY_SIZE(sun8i_codec_dapm_routes),

> I'm probably missing something, but in the sun4i-codec.c driver, those
> fields are initialized directly in the snd_soc_codec_driver structure,
> not in the .component_driver sub-structure.

We're in the process of pushing everything out to component level, this
update should be made in the old code if it's not happened already.

> > +	if (clk_prepare_enable(scodec->clk_module))
> > +		pr_err("err:open failed;\n");

> Grr, pr_err, not good. Plus you want to return with an error from the
> probe() function.

Also when printing an error message use dev_err().

--gpztr7jxwopd7ip3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJX86mOAAoJECTWi3JdVIfQBN0H/0hEvPxnDY3IJcUtpnC9qVeb
ykmKv1gtF/m9M9peXqqorRFZ4in1OwHeyU6vUY0+5bDtq9B9g9V2TYad1Ur1R4nF
7KzqnCxa2XPoqDTGz3pkPsVeLNQjFA39IW/fBqu7MOpK6FZ+neXgfrwBzG81XRzQ
J6/mqeiDi8yygUZqIW0jsthmq0Q0LbpIPJDk6gbT2D5SE+aRJftB4vxdQal6DQPw
wn8kYDdcbnlAwiivzJFmKJuRvSLgcUr9+ab6K4cmWXqfeVaZXvQLaCmBxP13Q5mD
eW5OGleZ28Sprjsp/0DlGF6uAseZAOzCEBIOvJQKj9q8RmHa2ZEcatADMP1pNak=
=PoB3
-----END PGP SIGNATURE-----

--gpztr7jxwopd7ip3--

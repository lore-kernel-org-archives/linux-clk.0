Return-Path: <moinejf@free.fr>
Date: Wed, 5 Oct 2016 12:03:03 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Code Kipper <codekipper@gmail.com>
Cc: =?ISO-8859-1?Q?Myl=E8ne?= Josserand
 <mylene.josserand@free-electrons.com>, mark.rutland@arm.com, devicetree
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org, linux-sunxi
 <linux-sunxi@googlegroups.com>, thomas.petazzoni@free-electrons.com,
 vinod.koul@intel.com, linux-kernel@vger.kernel.org, Michael Turquette
 <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 sboyd@codeaurora.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Chen-Yu Tsai
 <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 alexandre.belloni@free-electrons.com, dmaengine@vger.kernel.org, Maxime
 Ripard <maxime.ripard@free-electrons.com>, Lee Jones
 <lee.jones@linaro.org>, linux-clk@vger.kernel.org, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 07/14] ASoC: Add sun8i audio card
Message-Id: <20161005120303.93eb05294d189e04461bb314@free.fr>
In-Reply-To: <CAEKpxBkUbCGJdToReQx7P+5i92doUdNeMvA5fiDACGcniY=nJg@mail.gmail.com>
References: <cover.1475571575.git.mylene.josserand@free-electrons.com>
	<cover.1475569400.git.mylene.josserand@free-electrons.com>
	<33d641ff43f0c0349cdfa2cdbbfdcdde66205596.1475571575.git.mylene.josserand@free-electrons.com>
	<CAEKpxBkUbCGJdToReQx7P+5i92doUdNeMvA5fiDACGcniY=nJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Wed, 5 Oct 2016 08:04:26 +0200
Code Kipper <codekipper@gmail.com> wrote:

> > +static int sun8i_probe(struct platform_device *pdev)
> > +{
> > +       struct snd_soc_dai_link *link =3D &sun8i_dai_link;
> > +       struct device_node *np =3D pdev->dev.of_node;
> > +       int ret;
> > +
> > +       /* register the soc card */
> > +       sun8i_card.dev =3D &pdev->dev;
> > +
> > +       /* Retrieve the audio-codec from DT */
> > +       link->codec_of_node =3D of_parse_phandle(np, "allwinner,audio-c=
odec", 0);
> > +       if (!link->codec_of_node) {
> > +               dev_err(&pdev->dev, "Missing audio codec\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       /* Retrieve DAI from DT */
> > +       link->cpu_of_node =3D of_parse_phandle(np, "allwinner,i2s-contr=
oller", 0);
> Now that I've spent some time trying to add my changes for the H3
> ontop of your code,  I think this file should be more generic and rely
> on the dtsi more. It's pretty A33 specific but with little effort it
> can be worked to cover all of the sun8i type drivers. I would change
> "allwinner,i2s-controller" to "allwinner,audio-dai" for starters and
> then maybe pull in some info for the dai-link from the dtsi.
> CK
	[snip]

In fact, there should be no audio card driver as proposed here:
with such a simple layout
	CPU DAI (sun4i-a10-i2s) -> CODEC DAI (sun8i-a33-codec)
the 'simple-card' does the job.

BTW, I have a I2S/PCM/TDM driver for the H3 and A83T.
But, as it works with HDMI and contains echanges with the DRM driver,
it cannot go yet to the mainline...

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

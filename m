Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Oct 2016 14:12:21 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Jean-Francois Moine <moinejf@free.fr>
Cc: =?UTF-8?B?TXlsw6huZQ==?= Josserand
 <mylene.josserand@free-electrons.com>, vinod.koul@intel.com,
 maxime.ripard@free-electrons.com, wens@csie.org, mturquette@baylibre.com,
 sboyd@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, lee.jones@linaro.org, mark.rutland@arm.com,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, alexandre.belloni@free-electrons.com,
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/14] dma: sun6i-dma: Add burst case of 4
Message-ID: <20161004141221.55327f1b@free-electrons.com>
In-Reply-To: <20161004124011.d7f5754a082d5f17d5185fc4@free.fr>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
	<3a2404510b5f8b16ae3bb193982d70f158700b2b.1475571575.git.mylene.josserand@free-electrons.com>
	<20161004124011.d7f5754a082d5f17d5185fc4@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Tue, 4 Oct 2016 12:40:11 +0200, Jean-Francois Moine wrote:

> > Add the case of a burst of 4 which is handled by the SoC.
> >=20
> > Signed-off-by: Myl=C3=A8ne Josserand <mylene.josserand@free-electrons.c=
om>
> > ---
> >  drivers/dma/sun6i-dma.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 8346199..0485204 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -240,6 +240,8 @@ static inline s8 convert_burst(u32 maxburst)
> >  	switch (maxburst) {
> >  	case 1:
> >  		return 0;
> > +	case 4:
> > +		return 1;
> >  	case 8:
> >  		return 2;
> >  	default:
> > --=20
> > 2.9.3 =20
>=20
> This patch has already been rejected by Maxime in the threads
> 	http://www.spinics.net/lists/dmaengine/msg08610.html
> and
> 	http://www.spinics.net/lists/dmaengine/msg08719.html
>=20
> I hope you will find the way he wants for this maxburst to be added.

I was about to reply to Mylene's e-mail, suggesting that she should add
a comment in the code (and maybe in the commit log) to explain why this
addition is needed, and also that even though the schematics say that
value "1" (max burst size of 4 bytes) is reserved, it is in fact
incorrect. The Allwinner BSP code is really using this value, and it's
the value that makes audio work, so we believe the datasheet is simply
incorrect.

We already discussed it with Maxime, so I believe he should agree this
time. But I would suggest to have such details explained in the commit
log and in a comment in the code.

Best regards,

Thomas
--=20
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

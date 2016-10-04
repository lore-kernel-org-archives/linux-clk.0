Return-Path: <moinejf@free.fr>
Date: Tue, 4 Oct 2016 12:40:11 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: =?ISO-8859-1?Q?Myl=E8ne?= Josserand
 <mylene.josserand@free-electrons.com>
Cc: vinod.koul@intel.com, maxime.ripard@free-electrons.com, wens@csie.org,
 mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lee.jones@linaro.org,
 mark.rutland@arm.com, robh+dt@kernel.org,
 thomas.petazzoni@free-electrons.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, alexandre.belloni@free-electrons.com,
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/14] dma: sun6i-dma: Add burst case of 4
Message-Id: <20161004124011.d7f5754a082d5f17d5185fc4@free.fr>
In-Reply-To: <3a2404510b5f8b16ae3bb193982d70f158700b2b.1475571575.git.mylene.josserand@free-electrons.com>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
	<3a2404510b5f8b16ae3bb193982d70f158700b2b.1475571575.git.mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Tue,  4 Oct 2016 11:46:14 +0200
Myl=E8ne Josserand <mylene.josserand@free-electrons.com> wrote:

> Add the case of a burst of 4 which is handled by the SoC.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> ---
>  drivers/dma/sun6i-dma.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 8346199..0485204 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -240,6 +240,8 @@ static inline s8 convert_burst(u32 maxburst)
>  	switch (maxburst) {
>  	case 1:
>  		return 0;
> +	case 4:
> +		return 1;
>  	case 8:
>  		return 2;
>  	default:
> --=20
> 2.9.3

This patch has already been rejected by Maxime in the threads
	http://www.spinics.net/lists/dmaengine/msg08610.html
and
	http://www.spinics.net/lists/dmaengine/msg08719.html

I hope you will find the way he wants for this maxburst to be added.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/

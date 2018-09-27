Return-Path: <maxime.ripard@bootlin.com>
Date: Thu, 27 Sep 2018 19:18:31 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Michael Trimarchi <michael@amarulasolutions.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 05/12] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short
 write 2 param transfer
Message-ID: <20180927171831.2nfybgn2xmc4vrgt@flea>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-6-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180927114850.24565-6-jagan@amarulasolutions.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 27, 2018 at 05:18:43PM +0530, Jagan Teki wrote:
> Short transfer write support for DCS and Generic transfer types
> share similar way to process command sequence in DSI block so
> add generic write 2 param transfer type macro so-that the panels
> which are requesting similar transfer type may process properly.
>=20
> Also added error check for unsupporting transfer types this make
> debugging easy for new transfer types.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index 156b371243c6..1c7e42015645 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -869,6 +869,7 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_hos=
t *host,
>  		     SUN6I_DSI_CMD_CTL_TX_FLAG);
> =20
>  	switch (msg->type) {
> +	case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
>  	case MIPI_DSI_DCS_SHORT_WRITE:
>  	case MIPI_DSI_DCS_SHORT_WRITE_PARAM:

You should order them by alphabetical order.

>  		ret =3D sun6i_dsi_dcs_write_short(dsi, msg);
> @@ -885,6 +886,8 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_hos=
t *host,
>  		}
> =20
>  	default:
> +		dev_err(dsi->dev, "unsupported message type 0x%02x\n",
> +			msg->type);

And this isn't an error check.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

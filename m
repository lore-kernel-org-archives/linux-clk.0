Return-Path: <wens213@gmail.com>
Return-Path: <wens213@gmail.com>
MIME-Version: 1.0
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-15-jernej.skrabec@siol.net>
In-Reply-To: <20180902072643.4917-15-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 22 Sep 2018 21:54:55 +0800
Message-ID: <CAGb2v679T6eqUcgRtR0Tw6Njq4GupCAmHhvq=K1EAGYkryWYyQ@mail.gmail.com>
Subject: Re: [PATCH 14/27] drm/bridge/synopsys: dw-hdmi: Enable workaround for v2.12a
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
	Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
	Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> It turns out that even new DW HDMI controllers exhibits same mangenta

magenta?

Otherwise, FWIW,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> line issues as older versions.
>
> Enable workaround for v2.12a.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 5971976284bf..df1c7a2d6961 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1664,6 +1664,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>         case 0x131a:
>         case 0x132a:
>         case 0x201a:
> +       case 0x212a:
>                 count = 1;
>                 break;
>         default:
> --
> 2.18.0
>

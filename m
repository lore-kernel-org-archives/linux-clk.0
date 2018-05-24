Return-Path: <sean.wang@mediatek.com>
Message-ID: <1527130342.4607.27.camel@mtkswgap22>
Subject: Re: [v3 03/10] mfd: mtk-mmsys: Add mmsys driver
From: Sean Wang <sean.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
CC: <matthias.bgg@kernel.org>, <ulrich.hecht+renesas@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <ck.hu@mediatek.com>,
	<p.zabel@pengutronix.de>, <airlied@linux.ie>, <robh+dt@kernel.org>,
	<mark.rutland@arm.com>, <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<davem@davemloft.net>, <gregkh@linuxfoundation.org>, <mchehab@kernel.org>,
	<rdunlap@infradead.org>, <linux-clk@vger.kernel.org>,
	<linux@armlinux.org.uk>, <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <mbrugger@suse.com>
Date: Thu, 24 May 2018 10:52:22 +0800
In-Reply-To: <20180430101826.GC5147@dell>
References: <cover.1524820923.git.mbrugger@suse.com>
	 <e0894c97775e46ce6d9a441dc05e2e2479a4b612.1524820923.git.mbrugger@suse.com>
	 <20180430101826.GC5147@dell>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: sean.wang@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2018-04-30 at 11:18 +0100, Lee Jones wrote:
> On Fri, 27 Apr 2018, matthias.bgg@kernel.org wrote:
> 
> > From: Matthias Brugger <mbrugger@suse.com>
> > 
> > The MMSYS subsystem includes clocks and drm components.
> > This patch adds a MFD device to probe both drivers from the same
> > device tree compatible.
> > 
> > Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> > ---
> >  drivers/mfd/Kconfig     |  9 ++++++
> >  drivers/mfd/Makefile    |  2 ++
> >  drivers/mfd/mtk-mmsys.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++++

[ ... ]

> > +};
> 
> This driver is pretty pointless.  It doesn't actually do anything.
> 
> I think you just want to use "simple-mfd" instead.
> 


Hi, Matthias

Why not embedded a platform_device_register_data call into existent
MMSYS driver ?

It looks elegant and makes sense that mmsys device is being as parent
device for all its DRM components device and no need to create an
additional node representing the same device with mmsys simply in order
to probe its DRM components.

I'm planing to send a bunch of HDMI, MIPI related to MMSYS nodes for
MT7623 SoC when 4.18 rc1 comes out, so we should want to solve the
dt-binding violation issue first.

Though there are two same mmsys-compatible strings involving in dts
though, it seems that hdmi still can work fine in my setup.

	Sean


> > +static const struct of_device_id of_match_mmsys[] = {
> > +	{ .compatible = "mediatek,mt2701-mmsys",
> > +	  .data = (void *) MMSYS_MT2701,
> > +	},
> > +	{ /* sentinel */ },
> > +};
> > +
> > +static struct platform_driver mmsys_drv = {
> > +	.probe = mmsys_probe,
> > +	.driver = {
> > +		.name = "mediatek-mmysys",
> > +		.of_match_table = of_match_ptr(of_match_mmsys),
> > +	},
> > +};
> > +
> > +builtin_platform_driver(mmsys_drv);
> > +
> > +MODULE_DESCRIPTION("Mediatek MMSYS multi-function driver");
> > +MODULE_LICENSE("GPL");
> 

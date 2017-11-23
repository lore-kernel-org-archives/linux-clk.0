Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1511428388.7685.11.camel@pengutronix.de>
Subject: Re: [PATCH 6/8] drm/mediatek: Add mfd support for mt8173
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 ulrich.hecht+renesas@gmail.com,  laurent.pinchart@ideasonboard.com,
 ck.hu@mediatek.com, airlied@linux.ie,  robh+dt@kernel.org,
 mark.rutland@arm.com, mturquette@baylibre.com,  sboyd@codeaurora.org,
 lee.jones@linaro.org
Cc: davem@davemloft.net, gregkh@linuxfoundation.org, mchehab@kernel.org,
	rdunlap@infradead.org, pi-cheng.chen@linaro.org, sean.wang@mediatek.com,
	linux-clk@vger.kernel.org, linux@armlinux.org.uk,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
	Matthias Brugger
	 <mbrugger@suse.com>
Date: Thu, 23 Nov 2017 10:13:08 +0100
In-Reply-To: <20171114214114.15793-7-mbrugger@suse.com>
References: <20171114214114.15793-1-mbrugger@suse.com>
	 <20171114214114.15793-7-mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-11-14 at 22:41 +0100, Matthias Brugger wrote:
> Use the MFD device for SoC mt8173. Probing via devicetree
> is no longer needed for any SoC, so delete it.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>

Apart from the mmsys_private issue noted in previous patches,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

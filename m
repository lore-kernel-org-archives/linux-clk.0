Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1472271672.21203.17.camel@mtksdaap41>
Subject: Re: [PATCH v12 2/4] reset: mediatek: Add MT2701 reset driver
From: James Liao <jamesjj.liao@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Erin Lo <erin.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Turquette <mturquette@baylibre.com>, "Rob Herring" <robh@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel
 Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <srv_heupstream@mediatek.com>, Shunli Wang
	<shunli.wang@mediatek.com>
Date: Sat, 27 Aug 2016 12:21:12 +0800
In-Reply-To: <20160824175049.GC19826@codeaurora.org>
References: <1471854565-19810-1-git-send-email-erin.lo@mediatek.com>
	 <1471854565-19810-3-git-send-email-erin.lo@mediatek.com>
	 <20160824175049.GC19826@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2016-08-24 at 10:50 -0700, Stephen Boyd wrote:
> On 08/22, Erin Lo wrote:
> > diff --git a/drivers/clk/mediatek/clk-mt2701-hif.c b/drivers/clk/mediatek/clk-mt2701-hif.c
> > index 18b4ab5..702fd74 100644
> > --- a/drivers/clk/mediatek/clk-mt2701-hif.c
> > +++ b/drivers/clk/mediatek/clk-mt2701-hif.c
> > @@ -52,11 +52,15 @@ static int mtk_hifsys_init(struct device_node *node)
> >  						clk_data);
> >  
> >  	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > -	if (r)
> > +	if (r) {
> >  		pr_err("%s(): could not register clock provider: %d\n",
> >  			__func__, r);
> > +		return r;
> > +	}
> > +
> > +	mtk_register_reset_controller(node, 1, 0x34);
> 
> The cleanup here isn't great. mtk_register_reset_controller()
> should really return an error so that we can properly cleanup if
> needed. Fixing that in a later patch would be a good idea.

Hi Stephen,

I think so. This function returns void because it was invoked in
CLK_OF_DECLARE() in previous SoC's drivers. I'll investigate how to make
it return an error code without breaking backward compatibility.


Best regards,

James

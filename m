Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1451555942.10610.18.camel@mtksdaap41>
Subject: Re: [PATCH 3/5] clk: mediatek: Add MT2701 clock support
From: James Liao <jamesjj.liao@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
	<sboyd@codeaurora.org>, <devicetree@vger.kernel.org>,
	<srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shunli Wang <shunli.wang@mediatek.com>,
	Sascha Hauer <kernel@pengutronix.de>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Date: Thu, 31 Dec 2015 17:59:02 +0800
In-Reply-To: <20151230233406.19557.35006@quark.deferred.io>
References: <1451456865-44139-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1451456865-44139-4-git-send-email-jamesjj.liao@mediatek.com>
	 <20151230233406.19557.35006@quark.deferred.io>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

Hi Mike
On Wed, 2015-12-30 at 15:34 -0800, Michael Turquette wrote:
> Quoting James Liao (2015-12-29 22:27:43)
> > +CLK_OF_DECLARE(mtk_topckgen, "mediatek,mt2701-topckgen", mtk_topckgen_init);
> > +CLK_OF_DECLARE(mtk_infrasys, "mediatek,mt2701-infracfg", mtk_infrasys_init);
> > +CLK_OF_DECLARE(mtk_pericfg, "mediatek,mt2701-pericfg", mtk_pericfg_init);
> > +CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt2701-mmsys", mtk_mmsys_init);
> > +CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt2701-imgsys", mtk_imgsys_init);
> > +CLK_OF_DECLARE(mtk_vdecsys, "mediatek,mt2701-vdecsys", mtk_vdecsys_init);
> > +CLK_OF_DECLARE(mtk_hifsys, "mediatek,mt2701-hifsys", mtk_hifsys_init);
> > +CLK_OF_DECLARE(mtk_ethsys, "mediatek,mt2701-ethsys", mtk_ethsys_init);
> > +CLK_OF_DECLARE(mtk_bdpsys, "mediatek,mt2701-bdpsys", mtk_bdpsys_init);
> > +CLK_OF_DECLARE(mtk_apmixedsys, "mediatek,mt2701-apmixedsys",
> 
> None of these compatible strings are documented with a binding
> description in this patch series. In fact looking through
> Documentation/devicetree/bindings/clock/ on the latest linux-next tag I
> see that the only existing binding is mt8173-cpu-dvfs.txt.
> 
> Am I looking in the wrong place or do we have a case of missing binding
> descriptions?

The binding documents are located in
Documentation/devicetree/bindings/arm/mediatek/ . And I missed to add
mt2701 compatible strings into it. I'll add them in next patchset.


Best regards,

James

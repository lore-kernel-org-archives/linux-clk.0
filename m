Return-Path: <jamesjj.liao@mediatek.com>
Message-ID: <1451556167.10610.20.camel@mtksdaap41>
Subject: Re: [PATCH 4/5] reset: mediatek: mt2701 reset controller dt-binding
 file
From: James Liao <jamesjj.liao@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
	<sboyd@codeaurora.org>, "Sascha Hauer <kernel@pengutronix.de>, Daniel	Kurtz
 <djkurtz@chromium.org>,   srv_heupstream@mediatek.com,
	devicetree@vger.kernel.org,   linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,   linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,   Shunli Wang" <shunli.wang@mediatek.com>,
	<p.zabel@pengutronix.de>
Date: Thu, 31 Dec 2015 18:02:47 +0800
In-Reply-To: <20151230234917.19557.59026@quark.deferred.io>
References: <1451456865-44139-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1451456865-44139-5-git-send-email-jamesjj.liao@mediatek.com>
	 <20151230234917.19557.59026@quark.deferred.io>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Return-Path: jamesjj.liao@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

On Wed, 2015-12-30 at 15:49 -0800, Michael Turquette wrote:
> Hi James & Shunli Wang,
> 
> Quoting James Liao (2015-12-29 22:27:44)
> > From: Shunli Wang <shunli.wang@mediatek.com>
> > 
> > Dt-binding file about reset controller is used to provide
> > kinds of definition, which is referenced by dts file and
> > IC-specified reset controller driver code.
> > 
> > Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
> 
> I've Cc'd Philipp Zabel. I know the patch is trivial but it's best to
> keep the correct maintainers Cc'd.
> 
> Also it looks like this header is missing a corresponding binding
> description? Unless you're using some kind of common reset compatible
> string?

Thanks for your suggestion. I'll add binding description into
Documentation/devicetree/bindings/arm/mediatek/ in next version of
patchset.


Best regards,

James

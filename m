Return-Path: <mars.cheng@mediatek.com>
Message-ID: <1490313138.25996.10.camel@mtkswgap22>
Subject: Re: [PATCH v3 02/12] irqchip: mtk-sysirq: extend intpol base to
 arbitrary number
From: Mars Cheng <mars.cheng@mediatek.com>
To: Marc Zyngier <marc.zyngier@arm.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@codeaurora.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou
	<loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Jades Shih
	<jades.shih@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "My
 Chuang" <my.chuang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<wsd_upstream@mediatek.com>, <linux-clk@vger.kernel.org>,
	<chieh-jay.liu@mediatek.com>
Date: Fri, 24 Mar 2017 07:52:18 +0800
In-Reply-To: <3790b6ad-12c0-0c48-c24e-0f3397c6bbba@arm.com>
References: <1489937193-2953-1-git-send-email-mars.cheng@mediatek.com>
	 <1489937193-2953-3-git-send-email-mars.cheng@mediatek.com>
	 <3790b6ad-12c0-0c48-c24e-0f3397c6bbba@arm.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: mars.cheng@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-03-23 at 16:25 +0000, Marc Zyngier wrote:
> On 19/03/17 15:26, Mars Cheng wrote:
> > Originally driver only supports one base. However, MT6797 has
> > more than one bases to configure interrupt polarity. To support
> > possible design change, here comes a solution to use arbitrary
> > number of bases.
> > 
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> 
> Acked-by: Marc Zyngier <marc.zyngier@arm.com>
> 
> What is the merge strategy for this? I'm happy to take the irqchip stuff
> through my tree, but there is much more in this series...
> 
Hi Marc

Thanks for your review.

Hi Matthias

Would you comment on this? If Marc take the following stuff first in his
tree:

[PATCH v3 01/12] dt-bindings: mediatek: multiple bases support for
sysirq  
[PATCH v3 02/12] irqchip: mtk-sysirq: extend intpol base to arbitrary
number 
[PATCH v3 03/12] irqchip: mtk-sysirq: prevent unnecessary visibility
when set_type 

Since other stuff might need more review and irqchip didn't affect them.

Thanks.

> Thanks,
> 
> 	M.

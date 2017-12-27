Return-Path: <sean.wang@mediatek.com>
Message-ID: <1514347269.30687.39.camel@mtkswgap22>
Subject: Re: [PATCH] clk: mediatek: remove superfluous line including
 linux/clk-provider.h
From: Sean Wang <sean.wang@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <matthias.bgg@gmail.com>, <jdelvare@suse.de>,
	<jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<kevin-cw.chen@mediatek.com>, <shunli.wang@mediatek.com>,
	<chen.zhong@mediatek.com>, <arnd@arndb.de>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Date: Wed, 27 Dec 2017 12:01:09 +0800
In-Reply-To: <20171227011507.GR7997@codeaurora.org>
References: <96d2fcd536d75dbbfde0aa0ad0797e80da89117b.1514191770.git.sean.wang@mediatek.com>
	 <20171227011507.GR7997@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: sean.wang@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-12-26 at 17:15 -0800, Stephen Boyd wrote:
> On 12/25, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > clk-mtk.h has already included linux/clk-provider.h inside, so remove
> > the superfluous line including linux/clk-provider.h from these files which
> > also included clk-mtk.h.
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > Cc: Jean Delvare <jdelvare@suse.de>
> > ---
> 
> Please don't do this. If anything, I would remove as many
> includes from clk-mtk.h as possible and forward declare the
> structures used in there so there isn't any header dependency.
> Then it becomes clear which C files are clk-provider drivers
> almost immediately because we have the include in the driver, and
> we also avoid any header dependency chains where we must include
> some header file if we want to get another header file's
> definitions.
> 

Agreed on above. 

It really becomes clearer to know which c files belong
to clock provider driver, not only just considering header dependency.
For these points, it should be kept there.

Thanks for your detailed explanation

	Sean

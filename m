Return-Path: <sean.wang@mediatek.com>
Message-ID: <1514367817.30687.59.camel@mtkswgap22>
Subject: Re: [PATCH] clk: mediatek: adjust dependency of reset.c to avoid
 unexpectedly being built
From: Sean Wang <sean.wang@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <matthias.bgg@gmail.com>, <jdelvare@suse.de>,
	<jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>,
	<kevin-cw.chen@mediatek.com>, <shunli.wang@mediatek.com>,
	<chen.zhong@mediatek.com>, <arnd@arndb.de>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Date: Wed, 27 Dec 2017 17:43:37 +0800
In-Reply-To: <20171227011936.GT7997@codeaurora.org>
References: <5a6347a5196a5eba85dce9ac7c3b9392b832f1f8.1514259933.git.sean.wang@mediatek.com>
	 <20171227011936.GT7997@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: sean.wang@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-12-26 at 17:19 -0800, Stephen Boyd wrote:
> On 12/26, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > commit 74cb0d6dde8 ("clk: mediatek: fixup test-building of MediaTek clock
> > drivers") can let the build system looking into the directory where the
> > clock drivers resides and then allow test-building the drivers.
> > 
> > But the change also gives rise to certain incorrect behavior which is
> > reset.c being built even not depending on either COMPILE_TEST or
> > ARCH_MEDIATEK alternative dependency. To get rid of reset.c being built
> > unexpectedly on the other platforms, it would be a good change that the
> > file should be built depending on its own specific configuration rather
> > than just on generic RESET_CONTROLLER one.
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > Cc: Jean Delvare <jdelvare@suse.de>
> 
> I've typically seen vendor Kconfigs select the RESET_CONTROLLER
> framework if the vendor Kconfig is enabled. Any reason that same
> method isn't followed here?
> 

I just thought explicit dependency added in Kconfig seems a little good
no matter how the vendor Kconfig forces to select.

But, I believe reset controller is always present on every mediatek SoC,
at least it can be found on infracfg and pericfg subsystem, which is
really fundamental hardware block. So, it's still quite reasonable to
add "RESET_CONTROLLER" to vendor Kconfig.

Once we did it in vendor Kconfig, the Kconfig maybe could become
something like that.

config RESET_MEDIATEK
       bool "MediaTek Reset Driver"
       depends on ARCH_MEDIATEK || (RESET_CONTROLLER && COMPILE_TEST)
       help
         This enables the reset controller driver used on MediaTek SoCs.

where COMPILE_TEST still has to depend on RESET_CONTROLLER to avoid any
compiling error.

I'll make the next version based on above and relevant vendor Kconfig
changes

	Sean

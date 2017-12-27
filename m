Return-Path: <sboyd@codeaurora.org>
Date: Tue, 26 Dec 2017 17:19:36 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, jdelvare@suse.de,
	jamesjj.liao@mediatek.com, weiyi.lu@mediatek.com,
	kevin-cw.chen@mediatek.com, shunli.wang@mediatek.com,
	chen.zhong@mediatek.com, arnd@arndb.de,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: adjust dependency of reset.c to avoid
 unexpectedly being built
Message-ID: <20171227011936.GT7997@codeaurora.org>
References: <5a6347a5196a5eba85dce9ac7c3b9392b832f1f8.1514259933.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5a6347a5196a5eba85dce9ac7c3b9392b832f1f8.1514259933.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/26, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> commit 74cb0d6dde8 ("clk: mediatek: fixup test-building of MediaTek clock
> drivers") can let the build system looking into the directory where the
> clock drivers resides and then allow test-building the drivers.
> 
> But the change also gives rise to certain incorrect behavior which is
> reset.c being built even not depending on either COMPILE_TEST or
> ARCH_MEDIATEK alternative dependency. To get rid of reset.c being built
> unexpectedly on the other platforms, it would be a good change that the
> file should be built depending on its own specific configuration rather
> than just on generic RESET_CONTROLLER one.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Cc: Jean Delvare <jdelvare@suse.de>

I've typically seen vendor Kconfigs select the RESET_CONTROLLER
framework if the vendor Kconfig is enabled. Any reason that same
method isn't followed here?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

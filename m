Return-Path: <sboyd@codeaurora.org>
Date: Wed, 10 Jan 2018 13:45:21 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, jdelvare@suse.de,
	jamesjj.liao@mediatek.com, weiyi.lu@mediatek.com,
	kevin-cw.chen@mediatek.com, shunli.wang@mediatek.com,
	chen.zhong@mediatek.com, arnd@arndb.de,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mediatek: adjust dependency of reset.c to avoid
 unexpectedly being built
Message-ID: <20180110214521.GE28313@codeaurora.org>
References: <0a88c7902606e819438ef0f1fc5968960e718620.1515139760.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <0a88c7902606e819438ef0f1fc5968960e718620.1515139760.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/05, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Changes from v1->v2:
> Add 'select RESET_CONTROLLER' under COMMON_CLK_MEDIATEK and enable
> reset.c to be built when COMMON_CLK_MEDIATEK is selected. That should
> be quite reasonable because the reset controller is tightly embedded
> inside and exported from these clock subsystems. At least it can be found
> on infracfg and pericfg subsystem that both are really fundamental block
> lots of devices must depend on.
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
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

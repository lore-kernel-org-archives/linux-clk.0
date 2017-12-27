Return-Path: <sboyd@codeaurora.org>
Date: Tue, 26 Dec 2017 17:16:06 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: sean.wang@mediatek.com
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kbuild-all@01.org,
	Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2] clk: mediatek: Fix all warnings for missing struct
 clk_onecell_data
Message-ID: <20171227011606.GS7997@codeaurora.org>
References: <2a2569d80e92a45e8eef2b431abfb951853ab6e0.1514188437.git.sean.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <2a2569d80e92a45e8eef2b431abfb951853ab6e0.1514188437.git.sean.wang@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/25, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Even though the header file linux/clk-provider.h is already being properly
> included in clk-mtk.h, the definition of struct clk_onecell_data still
> must depend on CONFIG_COMMON_CLK defined and thus it's possible that
> below build warnings occur when CONFIG_COMMON_CLK is not being selected.
> 
> Therefore, these functions which need struct clk_onecell_data without
> declaring that structure first requires simply declaring that this struct
> exists prior to referencing it in clk-mtk.h
> 
> Changes from v1->v2:
> enhance v1 based on two useful solutions Jean Delvare kindly suggested.
> 
> All warnings (new ones prefixed by >>):
> 
> In file included from drivers/clk/mediatek/reset.c:22:0:
> >>drivers/clk/mediatek/clk-mtk.h:44:19: warning: 'struct clk_onecell_data'
> declared inside parameter list will not be visible outside of
> this definition or declaration
>   int num, struct clk_onecell_data *clk_data);
> 		  ^~~~~~~~~~~~~~~~
> drivers/clk/mediatek/clk-mtk.h:63:19: warning: 'struct clk_onecell_data'
> declared inside parameter list will not be visible outside of
> this definition or declaration
>   int num, struct clk_onecell_data *clk_data);
> 		  ^~~~~~~~~~~~~~~~
> drivers/clk/mediatek/clk-mtk.h:145:10: warning: 'struct clk_onecell_data'
> declared inside parameter list will not be visible outside of
> this definition or declaration
>   struct clk_onecell_data *clk_data);
> 	 ^~~~~~~~~~~~~~~~
> drivers/clk/mediatek/clk-mtk.h:164:11: warning: 'struct clk_onecell_data'
> declared inside parameter list will not be visible outside of
> this definition or declaration
>    struct clk_onecell_data *clk_data);
> 	  ^~~~~~~~~~~~~~~~
> drivers/clk/mediatek/clk-mtk.h:190:12: warning: 'struct clk_onecell_data'
> declared inside parameter list will not be visible outside of this
> definition or declaration
>     struct clk_onecell_data *clk_data);
> 	   ^~~~~~~~~~~~~~~~
> 
> Reported-by: kbuild test robot <fengguang.wu@intel.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Cc: kbuild-all@01.org
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: linux-clk@vger.kernel.org
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

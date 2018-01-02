Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45598 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751034AbeABSKt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 2 Jan 2018 13:10:49 -0500
Date: Tue, 2 Jan 2018 10:10:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [clk:clk-next 20/21] drivers/clk/sprd/div.c:42:9: error: too few
 arguments to function 'divider_recalc_rate'
Message-ID: <20180102181046.GE7997@codeaurora.org>
References: <201712290803.E0awnApy%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <201712290803.E0awnApy%fengguang.wu@intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12/29, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> head:   e717a189b1bc52a60f8c1177f277e4b6c2f0ae53
> commit: 4508d70e6a5e9ad186dd4110e59f33d20483eb31 [20/21] Merge branch 'clk-divider-container' into clk-next
> config: arm64-defconfig (attached as .config)
> compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 4508d70e6a5e9ad186dd4110e59f33d20483eb31
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm64 
> 
> All error/warnings (new ones prefixed by >>):
> 
>    drivers/clk/sprd/div.c: In function 'sprd_div_helper_recalc_rate':
> >> drivers/clk/sprd/div.c:42:9: error: too few arguments to function 'divider_recalc_rate'
>      return divider_recalc_rate(&common->hw, parent_rate, val, NULL, 0);
>             ^~~~~~~~~~~~~~~~~~~
>    In file included from drivers/clk/sprd/div.c:8:0:
>    include/linux/clk-provider.h:413:15: note: declared here
>     unsigned long divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate,
>                   ^~~~~~~~~~~~~~~~~~~
> >> drivers/clk/sprd/div.c:43:1: warning: control reaches end of non-void function [-Wreturn-type]
>     }
>     ^
> 

Thanks. Fixed up.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

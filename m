Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga03-in.huawei.com ([119.145.14.66]:6973 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752532AbcIMCqI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Sep 2016 22:46:08 -0400
Subject: Re: [PATCH] clk: hisilicon: add CRG driver for Hi3798CV200 SoC
References: <201609122155.oR2E2oL7%fengguang.wu@intel.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yanhaifeng@hisilicon.com>,
        <gaofei@hisilicon.com>, <hermit.wangheming@hisilicon.com>,
        <scott.bambrough@linaro.org>, <mark.gregotski@linaro.org>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Message-ID: <57D76853.4080900@hisilicon.com>
Date: Tue, 13 Sep 2016 10:45:39 +0800
MIME-Version: 1.0
In-Reply-To: <201609122155.oR2E2oL7%fengguang.wu@intel.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi all,

Sorry. I'll fixed this compiling error in the next version.

Regards,
Jiancheng

On 2016/9/12 21:55, kbuild test robot wrote:
> Hi Jiancheng,
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v4.8-rc6 next-20160912]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> [Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
> [Check https://git-scm.com/docs/git-format-patch for more information]
> 
> url:    https://github.com/0day-ci/linux/commits/Jiancheng-Xue/clk-hisilicon-add-CRG-driver-for-Hi3798CV200-SoC/20160912-175733
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 5.4.0-6) 5.4.0 20160609
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from drivers/clk/hisilicon/crg-hi3798cv200.c:22:0:
>>> drivers/clk/hisilicon/crg-hi3798cv200.c:245:25: error: 'hi3798cv200_clk_match_table' undeclared here (not in a function)
>     MODULE_DEVICE_TABLE(of, hi3798cv200_clk_match_table);
>                             ^
>    include/linux/module.h:213:21: note: in definition of macro 'MODULE_DEVICE_TABLE'
>     extern const typeof(name) __mod_##type##__##name##_device_table  \
>                         ^
>>> include/linux/module.h:213:27: error: '__mod_of__hi3798cv200_clk_match_table_device_table' aliased to undefined symbol 'hi3798cv200_clk_match_table'
>     extern const typeof(name) __mod_##type##__##name##_device_table  \
>                               ^
>>> drivers/clk/hisilicon/crg-hi3798cv200.c:245:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
>     MODULE_DEVICE_TABLE(of, hi3798cv200_clk_match_table);
>     ^
> 
> vim +/hi3798cv200_clk_match_table +245 drivers/clk/hisilicon/crg-hi3798cv200.c
> 
>    239		{ .compatible = "hisilicon,hi3798cv200-crg",
>    240			.data = &hi3798cv200_crg_funcs},
>    241		{ .compatible = "hisilicon,hi3798cv200-sysctrl",
>    242			.data = &hi3798cv200_sysctrl_funcs},
>    243		{ }
>    244	};
>  > 245	MODULE_DEVICE_TABLE(of, hi3798cv200_clk_match_table);
>    246	
>    247	static int hi3798cv200_crg_probe(struct platform_device *pdev)
>    248	{
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 


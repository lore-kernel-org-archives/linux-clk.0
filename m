Return-Path: <lidongpo@hisilicon.com>
Subject: Re: [PATCH 3/4] clk: hix5hd2: change ethernet clock type
To: kbuild test robot <lkp@intel.com>
References: <201608112002.qeCiGZLQ%fengguang.wu@intel.com>
CC: <kbuild-all@01.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
        <linux@armlinux.org.uk>, <zhangfei.gao@linaro.org>,
        <yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>,
        <davem@davemloft.net>, <arnd@arndb.de>, <andrew@lunn.ch>,
        <xuejiancheng@hisilicon.com>, <benjamin.chenhao@hisilicon.com>,
        <howell.yang@hisilicon.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From: Dongpo Li <lidongpo@hisilicon.com>
Message-ID: <57B1740E.6070501@hisilicon.com>
Date: Mon, 15 Aug 2016 15:49:34 +0800
MIME-Version: 1.0
In-Reply-To: <201608112002.qeCiGZLQ%fengguang.wu@intel.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi all,

On 2016/8/11 20:09, kbuild test robot wrote:
> Hi Dongpo,
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on v4.8-rc1 next-20160811]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Dongpo-Li/net-hix5hd2_gmac-add-tx-sg-feature-and-reset-clock-control-signals/20160811-170826
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: arm-multi_v7_defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 5.4.0-6) 5.4.0 20160609
> reproduce:
>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/clk/hisilicon/clk-hix5hd2.c: In function 'hix5hd2_clk_init':
>>> drivers/clk/hisilicon/clk-hix5hd2.c:260:25: error: passing argument 1 of 'hisi_reset_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      rstc = hisi_reset_init(np);
>                             ^
>    In file included from drivers/clk/hisilicon/clk-hix5hd2.c:15:0:
>    drivers/clk/hisilicon/reset.h:25:31: note: expected 'struct platform_device *' but argument is of type 'struct device_node *'
>     struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev);
>                                   ^

Sorry for my mistake, the interface changes in newer patch. I will fix my problem in the next patch version.


    Regards,
    Dongpo

.

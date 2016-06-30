Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Thu, 30 Jun 2016 15:04:25 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: kbuild test robot <lkp@intel.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, anson.huang@nxp.com,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-kernel@vger.kernel.org, kbuild-all@01.org,
	shawnguo@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 4/8] clk: core: support clocks which requires parents
 enable (part 2)
Message-ID: <20160630070425.GC29919@shlinux2>
References: <1467212351-16626-5-git-send-email-aisheng.dong@nxp.com>
 <201606300015.zJJwBdRV%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <201606300015.zJJwBdRV%fengguang.wu@intel.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 30, 2016 at 12:42:21AM +0800, kbuild test robot wrote:
> Hi,
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v4.7-rc5 next-20160629]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Dong-Aisheng/clk-core-support-clocks-which-requires-parents-enable/20160629-231445
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: x86_64-randconfig-i0-201626 (attached as .config)
> compiler: gcc-6 (Debian 6.1.1-1) 6.1.1 20160430
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All error/warnings (new ones prefixed by >>):
> 
>    include/linux/export.h:94:25: note: in expansion of macro '___EXPORT_SYMBOL'
>     #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
>                             ^~~~~~~~~~~~~~~~

Sorry, i somehow sent out a wrong re-based version.
Will send out V3 to fix it.

Regards
Dong Aisheng

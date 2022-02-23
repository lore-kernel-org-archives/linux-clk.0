Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B40C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 12:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240598AbiBWMtC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 07:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240595AbiBWMtC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 07:49:02 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91264A66C7
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645620514; x=1677156514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JchGT5xSCoWHgscsGyITFlYVQhmMDYGObdm75BrHowg=;
  b=YrN2VxBM1fkhoDHnFFTUo/MQz+JuyDi5996ogfQnEVeyMHj9n4O0yl7M
   G9X178msZVJTzuWGDCdOz6yzMM62tidjK5NGd2EDSvbWOVhu/wq11cVhA
   NMG5OPt0eC2JYEHVZH1CvoGWmi52L6xsegSIKfuym8PdtfjBmbSWPF5c1
   /cOvmiPXrnIebm8lpdHwVPIbIg9tp2vV7km65EP3+uAxehmisT4m/N+0g
   kZ0NC/ao4xyngjKz070gnqRxgZwN0Gy/Cpg0cDop4kQ0Bri6ej5j5Ykxp
   BPXNbtbDlQhv/iNh9CdgEmqjevgCQtD+Qcb1/Iov+vzOXdnfgjqCs0Goq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="252146578"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="252146578"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="591689382"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2022 04:48:30 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMr4I-0001Q2-5w; Wed, 23 Feb 2022 12:48:30 +0000
Date:   Wed, 23 Feb 2022 20:48:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 8/8] clk: imx: pll14xx: Support dynamic rates
Message-ID: <202202232005.F6GoajML-lkp@intel.com>
References: <20220223075601.3652543-9-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223075601.3652543-9-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sascha,

I love your patch! Perhaps something to improve:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on clk/clk-next v5.17-rc5 next-20220222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/clk-i-MX-PLL14xx-Support-dynamic-rates/20220223-155846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220223/202202232005.F6GoajML-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c2601acc01166ae3f20b60817e44d3e94a023c6f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sascha-Hauer/clk-i-MX-PLL14xx-Support-dynamic-rates/20220223-155846
        git checkout c2601acc01166ae3f20b60817e44d3e94a023c6f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/clk/imx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-pll14xx.c: In function 'imx_pll14xx_calc_settings':
   drivers/clk/imx/clk-pll14xx.c:149:16: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     149 |         mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
         |                ^~~~~~~~~
         |                FOLL_GET
>> drivers/clk/imx/clk-pll14xx.c:6:21: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'int' [-Wformat=]
       6 | #define pr_fmt(fmt) "pll14xx: " fmt
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in expansion of macro 'pr_fmt'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dynamic_func_call'
     152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynamic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:9: note: in expansion of macro 'dynamic_pr_debug'
     570 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clk/imx/clk-pll14xx.c:160:17: note: in expansion of macro 'pr_debug'
     160 |                 pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
         |                 ^~~~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:5,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/clk-provider.h:9,
                    from drivers/clk/imx/clk-pll14xx.c:9:
   drivers/clk/imx/clk-pll14xx.c: In function 'clk_pll1416x_set_rate':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'const char *' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:418:25: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:489:9: note: in expansion of macro 'printk'
     489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:489:16: note: in expansion of macro 'KERN_ERR'
     489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/clk/imx/clk-pll14xx.c:293:17: note: in expansion of macro 'pr_err'
     293 |                 pr_err("Invalid rate %lu for pll clk %s\n", __func__,
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'long unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:418:25: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:489:9: note: in expansion of macro 'printk'
     489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:489:16: note: in expansion of macro 'KERN_ERR'
     489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/clk/imx/clk-pll14xx.c:293:17: note: in expansion of macro 'pr_err'
     293 |                 pr_err("Invalid rate %lu for pll clk %s\n", __func__,
         |                 ^~~~~~
   include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:418:25: note: in definition of macro 'printk_index_wrap'
     418 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:489:9: note: in expansion of macro 'printk'
     489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:489:16: note: in expansion of macro 'KERN_ERR'
     489 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   drivers/clk/imx/clk-pll14xx.c:293:17: note: in expansion of macro 'pr_err'
     293 |                 pr_err("Invalid rate %lu for pll clk %s\n", __func__,
         |                 ^~~~~~
   drivers/clk/imx/clk-pll14xx.c:302:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     302 |                 tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
         |                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +6 drivers/clk/imx/clk-pll14xx.c

0c0c0d808f682f Sascha Hauer 2022-02-23 @6  #define pr_fmt(fmt) "pll14xx: " fmt
0c0c0d808f682f Sascha Hauer 2022-02-23  7  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

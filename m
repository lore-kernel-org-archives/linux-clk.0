Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BB5C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 12:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240576AbiBWMsC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 07:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240490AbiBWMsB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 07:48:01 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25755A6537
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645620454; x=1677156454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qR/6K++acmIKyE2EQVqpsJ/8y+Nz1OC3o6JR6GJKQvM=;
  b=Ek1Y3XoypPbgnDh+S4H3ZXRd7poBa7/lnKZjJSWk77S43vzSkX2YaFGR
   yTtU2W/yBqSvoBD8qZajjK+yc1HW3sRsa+ri9O46OxSkH3JRzdTBqw5Hg
   C3pV7e9vpjDgCwAvqtSn01tOPp76UZodDvNCw9+vL0vxvtkd5dSQB92l8
   RUyTL/Ut7q5G3FH6uBI/QCsXA0ch3nDAFtmvQReqao4dqXvV/oEEQp/iR
   6AO+HLMyBteNBErwN0VckNgKjmP18ZGimmiZ6wTGvBnyQcah96XLY5DrA
   4O0WqGhLB4Z8F1T8SOuFaIT5WK8FauMy16k2jrkhHz5vSOrXw+ZLG2BjE
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231927544"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="231927544"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 04:47:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="639294378"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Feb 2022 04:47:30 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMr3K-0001Or-0k; Wed, 23 Feb 2022 12:47:30 +0000
Date:   Wed, 23 Feb 2022 20:47:11 +0800
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
Subject: Re: [PATCH 7/8] clk: imx: pll14xx: Add pr_fmt
Message-ID: <202202231803.Xvmq9bEq-lkp@intel.com>
References: <20220223075601.3652543-8-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223075601.3652543-8-s.hauer@pengutronix.de>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220223/202202231803.Xvmq9bEq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0c0c0d808f682f365239da62a5670bbd74275b5f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sascha-Hauer/clk-i-MX-PLL14xx-Support-dynamic-rates/20220223-155846
        git checkout 0c0c0d808f682f365239da62a5670bbd74275b5f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/clk/imx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-pll14xx.c: In function 'clk_pll14xx_recalc_rate':
   drivers/clk/imx/clk-pll14xx.c:138:16: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     138 |         mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
         |                ^~~~~~~~~
         |                FOLL_GET
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
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'const char *' [-Wformat=]
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
   drivers/clk/imx/clk-pll14xx.c:181:17: note: in expansion of macro 'pr_err'
     181 |                 pr_err("Invalid rate %lu for pll clk %s\n", __func__,
         |                 ^~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'long unsigned int' [-Wformat=]
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
   drivers/clk/imx/clk-pll14xx.c:181:17: note: in expansion of macro 'pr_err'
     181 |                 pr_err("Invalid rate %lu for pll clk %s\n", __func__,
         |                 ^~~~~~
>> include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
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
   drivers/clk/imx/clk-pll14xx.c:181:17: note: in expansion of macro 'pr_err'
     181 |                 pr_err("Invalid rate %lu for pll clk %s\n", __func__,
         |                 ^~~~~~
   drivers/clk/imx/clk-pll14xx.c:190:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     190 |                 tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
         |                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30   4  
04d2c8c83d0e3a Joe Perches 2012-07-30  @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30   6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30   7  
04d2c8c83d0e3a Joe Perches 2012-07-30   8  #define KERN_EMERG	KERN_SOH "0"	/* system is unusable */
04d2c8c83d0e3a Joe Perches 2012-07-30   9  #define KERN_ALERT	KERN_SOH "1"	/* action must be taken immediately */
04d2c8c83d0e3a Joe Perches 2012-07-30  10  #define KERN_CRIT	KERN_SOH "2"	/* critical conditions */
04d2c8c83d0e3a Joe Perches 2012-07-30 @11  #define KERN_ERR	KERN_SOH "3"	/* error conditions */
04d2c8c83d0e3a Joe Perches 2012-07-30  12  #define KERN_WARNING	KERN_SOH "4"	/* warning conditions */
04d2c8c83d0e3a Joe Perches 2012-07-30  13  #define KERN_NOTICE	KERN_SOH "5"	/* normal but significant condition */
04d2c8c83d0e3a Joe Perches 2012-07-30  14  #define KERN_INFO	KERN_SOH "6"	/* informational */
04d2c8c83d0e3a Joe Perches 2012-07-30  15  #define KERN_DEBUG	KERN_SOH "7"	/* debug-level messages */
04d2c8c83d0e3a Joe Perches 2012-07-30  16  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3CEC433F5
	for <linux-clk@archiver.kernel.org>; Sun, 20 Mar 2022 04:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbiCTEeW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Mar 2022 00:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235846AbiCTEeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Mar 2022 00:34:22 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF961D80
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 21:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647750777; x=1679286777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whgXlqCf3cVmXjkJEHDDxRzXy8k6wwReLXwWWRFQ8jA=;
  b=UB4hOK2/ErGPBQjGDG/YMG1OWndKjndz0Pv30EbeJSnP38ZaCsiQPnzk
   eu1fLj6QJhm+QAj4nTEFpGMdttqO00jheoZj2XIcCWSSIO2mvn2EWIOmU
   v+O4YQWhLbJBqdTLKw3bbzuUWNnRzahwV0cmqvvpklN8U5D6u+uinz0Nj
   M2jjvTsthm+4Nc/KDxXucO7J4jM+IEX+C0k4Su54JThqv+zNJISUu0ywM
   N4X2exls78GH/T7/hOSNt1vycxcAbS5owAbhL5uA23jTPeWEJ847CodKS
   UkLxpur8Hhgpm1w+wsmU2j5/4w+qlW3I5BYczd1y6dGdG5t7hJg6A7aM+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="282172292"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="282172292"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 21:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="823503912"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2022 21:32:56 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nVnFP-000GZu-N0; Sun, 20 Mar 2022 04:32:55 +0000
Date:   Sun, 20 Mar 2022 12:32:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5 v2] clk: ux500: Implement the missing CLKOUT clocks
Message-ID: <202203201236.0AYTSuXv-lkp@intel.com>
References: <20220319225156.1451636-6-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319225156.1451636-6-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Linus,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.17-rc8 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/U8500-clkout-clocks-v2/20220320-070131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220320/202203201236.0AYTSuXv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b9b90d02e856e84100c5613ebb25d1ab7a1069ec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Linus-Walleij/U8500-clkout-clocks-v2/20220320-070131
        git checkout b9b90d02e856e84100c5613ebb25d1ab7a1069ec
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/ux500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/ux500/u8500_of_clk.c: In function 'u8500_clk_init':
>> drivers/clk/ux500/u8500_of_clk.c:131:24: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
     131 |         struct clk_hw *hw;
         |                        ^~


vim +/hw +131 drivers/clk/ux500/u8500_of_clk.c

   124	
   125	static void u8500_clk_init(struct device_node *np)
   126	{
   127		struct prcmu_fw_version *fw_version;
   128		struct device_node *child = NULL;
   129		const char *sgaclk_parent = NULL;
   130		struct clk *clk, *rtc_clk, *twd_clk;
 > 131		struct clk_hw *hw;

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

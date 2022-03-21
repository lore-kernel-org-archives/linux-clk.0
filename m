Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A8BC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Mar 2022 07:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344583AbiCUH3z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Mar 2022 03:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244518AbiCUH3y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 03:29:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B931229822
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647847708; x=1679383708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XiR2aCLOnGO8i8qifDIkgNyjS+AntjEKdLnXVQp0Zw=;
  b=BeeUYVT1OhvZr36QTYFFcsixv7ia8yxHA+NuNckNbEXyNgmwcEYwdwOr
   vY3m+JzntA61rl1trCRLPGzqqO5mBG0DZpZfGNDnUKSvbxnlG75Rw7Epj
   6AWAKz89N0+0ap8fuMhsoKE6CL6UYBSNPOiTW3w/iApa33bEiytfovz/X
   XzqXLoaGxcub6hqTfBS3RrGl6PrsDENpz52jaQx8THby0XXoXXJcP2uHN
   09+HS7l4YscE7GB9OyRLfsIOwiUE5EB07OGQ9lsSsZZNaqWSQBIiHtq8k
   Sw2r1E1CA82Rw8OiTtkyo6kJC1qGTy4/owKBR3yco8YYcNUHtBJ08pEeH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="255053261"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="255053261"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 00:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; 
   d="scan'208";a="648462972"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Mar 2022 00:28:20 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nWCSh-000HbD-J2; Mon, 21 Mar 2022 07:28:19 +0000
Date:   Mon, 21 Mar 2022 15:27:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5 v2] clk: ux500: Implement the missing CLKOUT clocks
Message-ID: <202203211549.CqMHSrT8-lkp@intel.com>
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
[also build test WARNING on v5.17 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/U8500-clkout-clocks-v2/20220320-070131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-buildonly-randconfig-r004-20220321 (https://download.01.org/0day-ci/archive/20220321/202203211549.CqMHSrT8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/b9b90d02e856e84100c5613ebb25d1ab7a1069ec
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Linus-Walleij/U8500-clkout-clocks-v2/20220320-070131
        git checkout b9b90d02e856e84100c5613ebb25d1ab7a1069ec
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/ux500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/ux500/u8500_of_clk.c:131:17: warning: variable 'hw' set but not used [-Wunused-but-set-variable]
           struct clk_hw *hw;
                          ^
   1 warning generated.


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

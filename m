Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C0AC61DA4
	for <linux-clk@archiver.kernel.org>; Sun, 19 Feb 2023 02:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjBSCc2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Feb 2023 21:32:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjBSCc1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Feb 2023 21:32:27 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A989912863
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 18:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676773945; x=1708309945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHNyUdAa5+H/vLBBw3zjDV1Tzi89Jy4ThXSGc7JElDk=;
  b=Ik3AnRFd9GHlOqh+K3Hi66j0WELcLrCmrWfA0w1LB/eNUVpXqxxmusp6
   oJpebHEFknHb0EsjpYJ6lZpyKh4zyKgFgOwspDeosTmCkDJ3el90RvARY
   AppMBclQ8z97+0amTb8JmG1BxPMuzha19Jr4m6rkm0ZZzsFjk1gz8QQ/Z
   tU7cFPo8OEPxe1bEbkdThLEW9s6c0op+4fut0Q3oWJ8W0MrUiNbtpitP8
   4jAV7nqPUPU/FmoEjiA51AFw/f7uKJnGbNP7HIazoEZ3Venmusda5mukO
   bGIQoqcd5zX4boT9ASI77UeeG50NwpMmJuf1fEFwi82R17sqfwub1AifY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="394704458"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="394704458"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 18:32:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10625"; a="916488102"
X-IronPort-AV: E=Sophos;i="5.97,309,1669104000"; 
   d="scan'208";a="916488102"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Feb 2023 18:32:22 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pTZV0-000Cwq-0q;
        Sun, 19 Feb 2023 02:32:22 +0000
Date:   Sun, 19 Feb 2023 10:31:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add devm_add_clk_disable_unprepare
Message-ID: <202302191007.tgr4xPrA-lkp@intel.com>
References: <e5d7afd3-2e1a-ad5a-a455-8882fae9cc47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5d7afd3-2e1a-ad5a-a455-8882fae9cc47@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Heiner,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/clk-add-devm_add_clk_disable_unprepare/20230219-070000
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/e5d7afd3-2e1a-ad5a-a455-8882fae9cc47%40gmail.com
patch subject: [PATCH] clk: add devm_add_clk_disable_unprepare
config: arm-buildonly-randconfig-r001-20230219 (https://download.01.org/0day-ci/archive/20230219/202302191007.tgr4xPrA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/c4da42247f42760cecce516094595706f88f4bc9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiner-Kallweit/clk-add-devm_add_clk_disable_unprepare/20230219-070000
        git checkout c4da42247f42760cecce516094595706f88f4bc9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302191007.tgr4xPrA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-devres.c:228:39: warning: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
           return devm_add_action_or_reset(dev, (void (*)(void *))clk_disable_unprepare, clk);
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +228 drivers/clk/clk-devres.c

   225	
   226	int devm_add_clk_disable_unprepare(struct device *dev, struct clk *clk)
   227	{
 > 228		return devm_add_action_or_reset(dev, (void (*)(void *))clk_disable_unprepare, clk);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82108C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 02:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbiBWC0n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 21:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbiBWC0m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 21:26:42 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A29A739178
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 18:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645583175; x=1677119175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtsmtrOEbepjpS0GbYNND8f9DW2Nk3u3mcQH0hclwms=;
  b=NSmRvsbjDImuhQ0g52ba2jO6i5hSaf3T36UG8OE9XyVmDhBBuGTkT67V
   Aw3Cug0AcpFMrXir2qSLHpROLWKuBO/nxRLkqGeIAqBhbZKJ/8ruxu+mf
   jYqe0ZJkGp1ZXw7ONGc060PFQphh5pZntx11mCkUHg/jmPhyFMe+MpQRm
   /+naO8kZjNUzBHkz30nVQl038IKcwfdFllC5zL3r1wTLTE0RzoZxuO5TR
   AxNYQi/rDNLqFjDAKDW0xktFvhUPUSunr/u34lFiUXDW+9I48Ty4AcFCN
   GOT+E/skmbUEKpVWxvi/J5nYNt6qDhX3hADYokmN53kYEWQYftYOjUh6U
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338301875"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="338301875"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 18:26:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="573661617"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2022 18:26:12 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMhM3-0000sI-RU; Wed, 23 Feb 2022 02:26:11 +0000
Date:   Wed, 23 Feb 2022 10:25:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>, kunit-dev@googlegroups.com
Subject: Re: [PATCH v5 01/11] clk: Introduce Kunit Tests for the framework
Message-ID: <202202231024.8SBLRlyr-lkp@intel.com>
References: <20220222131853.198625-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222131853.198625-2-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on next-20220217]
[cannot apply to drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next drm/drm-next tegra-drm/drm/tegra/for-next linus/master airlied/drm-next v5.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/clk-Improve-clock-range-handling/20220222-212043
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20220223/202202231024.8SBLRlyr-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/377d67441dca4a3d5df1d3b5a5b63c9a29f9b8b0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Improve-clock-range-handling/20220222-212043
        git checkout 377d67441dca4a3d5df1d3b5a5b63c9a29f9b8b0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_hw_create_clk" [drivers/clk/clk_test.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

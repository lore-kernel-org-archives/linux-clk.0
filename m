Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4034C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 18:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbjEESsc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 14:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbjEESsb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 14:48:31 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A00A203E0
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 11:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683312508; x=1714848508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MKcpZF9Oo6hevkCW4fYvfcPLdY+FU4pFWVz1xDxtgEQ=;
  b=TjZsJjFnK7fF5iXkI0nY801oMxj5DJ+KMbvbRAQG20LSTbiE/ZhqHA4J
   Y7SBvE+mPDN0lIV3J3bPlEs07pzGQQeojO4ZZdTEHmOEPBQbLLYvyGkY9
   AzIrfC0hN/M1lpbhpS07s74ayzd6WGVFCYa+XJYR60UZKZottjxvcgoNu
   XqddB/X2ASuXsSkjLIn2KgYHldOwX6XBtqIx51iU9bWbGAsLHHJUxngFI
   HZ0rgmTWt64p9SjTm6fzr6k5Am6DAJWUwM0TnISkNmCMbXxtvRJg4DxbN
   sKdLdM8qHlMz7aGBogJ5ab/A8P7gu1Vhg2F76D990Y36TbgaAnTEWCo2o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="338475866"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="338475866"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 11:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697706129"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="697706129"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 May 2023 11:48:25 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pv0Th-0000oR-0Z;
        Fri, 05 May 2023 18:48:25 +0000
Date:   Sat, 6 May 2023 02:47:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v4 17/68] clk: lochnagar: Add a determine_rate hook
Message-ID: <202305060216.rOqp4J6Z-lkp@intel.com>
References: <20221018-clk-range-checks-fixes-v4-17-971d5077e7d2@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v4-17-971d5077e7d2@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 145e5cddfe8b4bf607510b2dcf630d95f4db420f]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
base:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
patch link:    https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v4-17-971d5077e7d2%40cerno.tech
patch subject: [PATCH v4 17/68] clk: lochnagar: Add a determine_rate hook
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230506/202305060216.rOqp4J6Z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/273bc4689da3909aebca0a3479e18194a748ee92
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
        git checkout 273bc4689da3909aebca0a3479e18194a748ee92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060216.rOqp4J6Z-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk_test.ko] undefined!
ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-cdce706.ko] undefined!
>> ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-lochnagar.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

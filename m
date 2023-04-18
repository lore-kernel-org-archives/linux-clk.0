Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B451DC77B75
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 16:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbjDRQ6H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 12:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjDRQ6G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 12:58:06 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5084C13;
        Tue, 18 Apr 2023 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681837084; x=1713373084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EDMH85UnS/Tuh+qqYSvZvoao8ciQ8kqWvZDn6OpTaGo=;
  b=R4LcehIjPE4l4hNPsHvgKKALKsTy/gtE6ZD17WJ2PJ2DYVbjHs91b7Pc
   EYHXyZnrqyT/D7RohbMWe3M/yRHeH3vw7M3uAQUNiAGwRSg6kcdYyEp7K
   kvNLvTzx0Oxm0k/0ATHNTWG3bybtX/k6E8JjAkimhcvHpoFgT8Ri7tsbJ
   gNmxa7jVhHNWyBftpEbEFOXgR8YfqYysd1lNJ8LQUfscrw8SPWKdi6Edd
   rZl1Pp83YIfqD5bP63DkxPgcYPEtEjCGQE3eAbiGMi8MaNakV30bDVYix
   m1AXB7v6uZCzGYLkg5U/YI8TQw9i518IkJ0MQouFlGcRiS/047c6khBdB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431513564"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431513564"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 09:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780550900"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="780550900"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Apr 2023 09:58:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pooeR-000dlg-2o;
        Tue, 18 Apr 2023 16:57:55 +0000
Date:   Wed, 19 Apr 2023 00:57:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, git@amd.com,
        linux-clk@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        michal.simek@xilinx.com
Subject: Re: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking
 wizard
Message-ID: <202304190011.BMtXurPJ-lkp@intel.com>
References: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418102855.6791-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Shubhrajyoti,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20230417]
[cannot apply to xilinx-xlnx/master robh/for-next linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230418102855.6791-3-shubhrajyoti.datta%40amd.com
patch subject: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking wizard
config: arc-randconfig-r043-20230417 (https://download.01.org/0day-ci/archive/20230419/202304190011.BMtXurPJ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/143916412aa6a419e20fa37059004329e300ca95
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
        git checkout 143916412aa6a419e20fa37059004329e300ca95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/clk/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190011.BMtXurPJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/xilinx/clk-xlnx-clock-wizard.c: In function 'clk_wzrd_get_divisors':
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:102:41: warning: unsigned conversion from 'long long int' to 'long unsigned int' changes value from '4320000000' to '25032704' [-Woverflow]
     102 | #define VER_WZRD_VCO_MAX                4320000000
         |                                         ^~~~~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:332:26: note: in expansion of macro 'VER_WZRD_VCO_MAX'
     332 |                 vcomax = VER_WZRD_VCO_MAX;
         |                          ^~~~~~~~~~~~~~~~


vim +102 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

    88	
    89	#define WZRD_M_MIN			2
    90	#define WZRD_M_MAX			128
    91	#define WZRD_D_MIN			1
    92	#define WZRD_D_MAX			106
    93	#define WZRD_VCO_MIN			800000000
    94	#define WZRD_VCO_MAX			1600000000
    95	#define WZRD_O_MIN			1
    96	#define WZRD_O_MAX			128
    97	#define VER_WZRD_M_MIN			4
    98	#define VER_WZRD_M_MAX			432
    99	#define VER_WZRD_D_MIN			1
   100	#define VER_WZRD_D_MAX			123
   101	#define VER_WZRD_VCO_MIN		2160000000
 > 102	#define VER_WZRD_VCO_MAX		4320000000
   103	#define VER_WZRD_O_MIN			2
   104	#define VER_WZRD_O_MAX			511
   105	#define WZRD_MIN_ERR			20000
   106	#define WZRD_FRAC_POINTS		1000
   107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

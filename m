Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72A2C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  4 Apr 2022 11:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349726AbiDDLCU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Apr 2022 07:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236147AbiDDLCU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Apr 2022 07:02:20 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1BA0387BE
        for <linux-clk@vger.kernel.org>; Mon,  4 Apr 2022 04:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649070022; x=1680606022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4mS2wKWtJCLyy4sWKFEMFpKltQLm+lRH7DD0rHaVqNA=;
  b=W5uCQADV6Zd1nMoAc8271Qf3vpzcxXVBal7RGbCE9Bvb/9jnCdaHE5ji
   xZsJdS+XFwUuOX1Oe/gxSslU89Lc/hXtXATT78yMxyx8F0nG4/gsjDq3g
   PAjngAhjd9ZkR0ntVTa4/uQs94O8HbiiSDDF+A1O8XNAMQ0olluILkjfc
   +UPLeV9P/64l1sqJICiOCmy6Hw0tOmRNKcEa9DVxI3zA3cSTELFFT2V6L
   CtanxylhfAxe4Q9u7kp4tmgM/hlUhJRz024T9XSvlak33vNJdTBefYjP6
   5s8faKGIGfqKlTg9qaI/WyxALU8TV+nfrPi6icYuCIn8iRXCEPAXBptRc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="241075771"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="241075771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 04:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="657456155"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Apr 2022 04:00:12 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nbKRP-0001z7-8e;
        Mon, 04 Apr 2022 11:00:11 +0000
Date:   Mon, 4 Apr 2022 18:59:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org, Phil Elwell <phil@raspberrypi.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "Ivan T. Ivanov" <iivanov@suse.de>
Subject: Re: [PATCH] clk: bcm2835: Round UART input clock up
Message-ID: <202204041850.zEjvoN6Y-lkp@intel.com>
References: <20220404085822.84135-1-iivanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404085822.84135-1-iivanov@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi "Ivan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.18-rc1 next-20220404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-T-Ivanov/clk-bcm2835-Round-UART-input-clock-up/20220404-170105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: riscv-randconfig-r042-20220404 (https://download.01.org/0day-ci/archive/20220404/202204041850.zEjvoN6Y-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/79c34b5361c9ab155da3175cfc964b67b9a06eab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ivan-T-Ivanov/clk-bcm2835-Round-UART-input-clock-up/20220404-170105
        git checkout 79c34b5361c9ab155da3175cfc964b67b9a06eab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/bcm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/bcm/clk-bcm2835.c:997:15: warning: no previous prototype for 'bcm2835_clock_round' [-Wmissing-prototypes]
     997 | unsigned long bcm2835_clock_round(unsigned long clk)
         |               ^~~~~~~~~~~~~~~~~~~


vim +/bcm2835_clock_round +997 drivers/clk/bcm/clk-bcm2835.c

   996	
 > 997	unsigned long bcm2835_clock_round(unsigned long clk)
   998	{
   999		unsigned long scaler;
  1000	
  1001		/*
  1002		 * If increasing a clock by less than 0.1% changes it
  1003		 * from ..999.. to ..000.., round up.
  1004		 */
  1005		scaler = 1;
  1006		while (scaler * 100000 < clk)
  1007			scaler *= 10;
  1008		if ((clk + scaler - 1) / scaler % 1000 == 0)
  1009			clk = (clk / scaler + 1) * scaler;
  1010	
  1011		return clk;
  1012	}
  1013	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AD0C77B78
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 17:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232170AbjDRRI0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 13:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbjDRRII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 13:08:08 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D724486;
        Tue, 18 Apr 2023 10:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681837686; x=1713373686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=clbh2zDGy6dFpAHAbuLZHr1blTUTX9CnRVLHP8QGdRQ=;
  b=M7tzR3zhQLiMTXUUjf/dIeb52lhRVlff1WQgrnRIHk0QDqhKt1y9dHid
   HXCrbYc11tpu0KSMUSxZ6CXKmDAj46CydTmISfZNthYHRo2l/3Uz2Z2JD
   Iz98wy/F+TNC0phit3Bp2NifOkQq0Rcw38E/9Ny4r/tOqT7502dk8u6bX
   hfXi2bPCywb3yOchuux6vcGU+/zbN9D8yGMj3mj6nu0RI7POm/ETaIsJ9
   NOlaR2uKiGMZiGITT4p1D2d32vy2PeweeLaz/PY93gbeK1xh8qu0Vuwzs
   dGz0Q3y6gtZaAG6zdtKj5AgkbGyVqRCPxd0hkcrSgysCmps4+umkoy3Gh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431517791"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431517791"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 10:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="865496831"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="865496831"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Apr 2023 10:08:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pooo8-000dmJ-0x;
        Tue, 18 Apr 2023 17:07:56 +0000
Date:   Wed, 19 Apr 2023 01:07:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        devicetree@vger.kernel.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
        linux-clk@vger.kernel.org, robh+dt@kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        michal.simek@xilinx.com
Subject: Re: [PATCH v1 2/2] clocking-wizard: Add support for versal clocking
 wizard
Message-ID: <202304190059.Br8jz0UK-lkp@intel.com>
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
config: i386-randconfig-a012-20230417 (https://download.01.org/0day-ci/archive/20230419/202304190059.Br8jz0UK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/143916412aa6a419e20fa37059004329e300ca95
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shubhrajyoti-Datta/dt-bindings-clocking-wizard-add-versal-compatible/20230418-183046
        git checkout 143916412aa6a419e20fa37059004329e300ca95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190059.Br8jz0UK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:264:11: warning: variable 'value' is uninitialized when used here [-Wuninitialized]
                   regh = (value / 4);
                           ^~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:231:11: note: initialize the variable 'value' to silence this warning
           u32 value, regh, edged, p5en, p5fedge, regval, regval1;
                    ^
                     = 0
>> drivers/clk/xilinx/clk-xlnx-clock-wizard.c:332:12: warning: implicit conversion from 'long long' to 'unsigned long' changes value from 4320000000 to 25032704 [-Wconstant-conversion]
                   vcomax = VER_WZRD_VCO_MAX;
                          ~ ^~~~~~~~~~~~~~~~
   drivers/clk/xilinx/clk-xlnx-clock-wizard.c:102:27: note: expanded from macro 'VER_WZRD_VCO_MAX'
   #define VER_WZRD_VCO_MAX                4320000000
                                           ^~~~~~~~~~
   2 warnings generated.


vim +/value +264 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

   225	
   226	static int clk_wzrd_dynamic_reconfig(struct clk_hw *hw, unsigned long rate,
   227					     unsigned long parent_rate)
   228	{
   229		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   230		void __iomem *div_addr = divider->base + divider->offset;
   231		u32 value, regh, edged, p5en, p5fedge, regval, regval1;
   232		unsigned long flags = 0;
   233		int err;
   234	
   235		if (divider->lock)
   236			spin_lock_irqsave(divider->lock, flags);
   237		else
   238			__acquire(divider->lock);
   239	
   240		if (!divider->is_versal) {
   241			value = DIV_ROUND_CLOSEST(parent_rate, rate);
   242	
   243			/* Cap the value to max */
   244			min_t(u32, value, WZRD_DR_MAX_INT_DIV_VALUE);
   245	
   246			/* Set divisor and clear phase offset */
   247			writel(value, div_addr);
   248			writel(0x00, div_addr + WZRD_DR_DIV_TO_PHASE_OFFSET);
   249	
   250			/* Check status register */
   251			err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   252						 value, value & WZRD_DR_LOCK_BIT_MASK,
   253						 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   254			if (err)
   255				goto err_reconfig;
   256	
   257			/* Initiate reconfiguration */
   258			writel(WZRD_DR_BEGIN_DYNA_RECONF_5_2,
   259			       divider->base + WZRD_DR_INIT_REG_OFFSET);
   260			writel(WZRD_DR_BEGIN_DYNA_RECONF1_5_2,
   261			       divider->base + WZRD_DR_INIT_REG_OFFSET);
   262	
   263		} else {
 > 264			regh = (value / 4);
   265			regval1 = readl(div_addr);
   266			regval1 |= WZRD_CLKFBOUT_PREDIV2;
   267			regval1 = regval1 & ~(WZRD_CLKFBOUT_EDGE | WZRD_P5EN | WZRD_P5FEDGE);
   268			if (value % 4 > 1) {
   269				edged = 1;
   270				regval1 |= (edged << WZRD_EDGE_SHIFT);
   271			}
   272			p5fedge = value % 2;
   273			p5en = value % 2;
   274			regval1 = regval1 | p5en << WZRD_P5EN_SHIFT | p5fedge << WZRD_P5FEDGE_SHIFT;
   275			writel(regval1, div_addr);
   276	
   277			regval = regh | regh << WZRD_CLKFBOUT_H_SHIFT;
   278			writel(regval, div_addr + 4);
   279			/* Check status register */
   280			err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   281						 value, value & WZRD_DR_LOCK_BIT_MASK,
   282						 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   283			if (err)
   284				goto err_reconfig;
   285	
   286			/* Initiate reconfiguration */
   287			writel(WZRD_DR_BEGIN_DYNA_RECONF,
   288			       divider->base + WZRD_DR_INIT_VERSAL_OFFSET);
   289		}
   290		/* Check status register */
   291		err = readl_poll_timeout(divider->base + WZRD_DR_STATUS_REG_OFFSET,
   292					 value, value & WZRD_DR_LOCK_BIT_MASK,
   293					 WZRD_USEC_POLL, WZRD_TIMEOUT_POLL);
   294	err_reconfig:
   295		if (divider->lock)
   296			spin_unlock_irqrestore(divider->lock, flags);
   297		else
   298			__release(divider->lock);
   299		return err;
   300	}
   301	
   302	static long clk_wzrd_round_rate(struct clk_hw *hw, unsigned long rate,
   303					unsigned long *prate)
   304	{
   305		u8 div;
   306	
   307		/*
   308		 * since we don't change parent rate we just round rate to closest
   309		 * achievable
   310		 */
   311		div = DIV_ROUND_CLOSEST(*prate, rate);
   312	
   313		return *prate / div;
   314	}
   315	
   316	static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
   317					 unsigned long parent_rate)
   318	{
   319		struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
   320		unsigned long vco_freq, freq, diff, vcomin, vcomax;
   321		u32 m, d, o;
   322		u32 mmin, mmax, dmin, dmax, omin, omax;
   323	
   324		if (divider->is_versal) {
   325			mmin = VER_WZRD_M_MIN;
   326			mmax = VER_WZRD_M_MAX;
   327			dmin = VER_WZRD_D_MIN;
   328			dmax = VER_WZRD_D_MAX;
   329			omin = VER_WZRD_O_MIN;
   330			omax = VER_WZRD_O_MAX;
   331			vcomin = VER_WZRD_VCO_MIN;
 > 332			vcomax = VER_WZRD_VCO_MAX;
   333		} else {
   334			mmin = WZRD_M_MIN;
   335			mmax = WZRD_M_MAX;
   336			dmin = WZRD_D_MIN;
   337			dmax = WZRD_D_MAX;
   338			omin = WZRD_O_MIN;
   339			omax = WZRD_O_MAX;
   340			vcomin = WZRD_VCO_MIN;
   341			vcomax = WZRD_VCO_MAX;
   342		}
   343	
   344		for (m = mmin; m <= mmax; m++) {
   345			for (d = dmin; d <= dmax; d++) {
   346				vco_freq = DIV_ROUND_CLOSEST((parent_rate * m), d);
   347				if (vco_freq >= vcomin && vco_freq <= vcomax) {
   348					for (o = omin; o <= omax; o++) {
   349						freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
   350						diff = abs(freq - rate);
   351	
   352						if (diff < WZRD_MIN_ERR) {
   353							divider->m = m;
   354							divider->d = d;
   355							divider->o = o;
   356							return 0;
   357						}
   358					}
   359				}
   360			}
   361		}
   362		return -EBUSY;
   363	}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

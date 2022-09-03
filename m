Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7F7C38145
	for <linux-clk@archiver.kernel.org>; Sat,  3 Sep 2022 15:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiICPYx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 3 Sep 2022 11:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiICPYu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 3 Sep 2022 11:24:50 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263DF140E0;
        Sat,  3 Sep 2022 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662218689; x=1693754689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OUU011FZbdLoXmMTaSzRBkmckoLbRAk09nLoSqxKOnY=;
  b=Xn8nsvxCo/oAyD/anDBDNRl1324yzTDvyrO1H5/6/zhO8tfm91QsPIGK
   Z0VamNcEbbwYlictMWVua4etkLeVCmqlewp+rofxeYkjKPl3Irbswl8V+
   9Ll9MfNKYjHmkD20M7wR0YWI/ykKHe/nXbsWft3Sctd+0cNZlYIFcJrFX
   HPxU51F1K/AVRyKGboTVAm0/AuCYTdT1iOuniB6I3h0zeAs9Hc324asBe
   XOuW9uf7GjX4fWcQ7O6Yvf+KhWkrs2Et14D/X1PDH4y0GxrtPRY9KKYzv
   JD1/IpdFYLAA8STpNoIgRIsrtxdmcaNofFVPDAvAu8ow3vmC4aEU3KK+C
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="293753299"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="293753299"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 08:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="609267503"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Sep 2022 08:24:43 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUV0l-0001p9-0u;
        Sat, 03 Sep 2022 15:24:43 +0000
Date:   Sat, 3 Sep 2022 23:23:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org
Cc:     kbuild-all@lists.01.org, devicetree@vger.kernel.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/8] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <202209032301.fWPibuKq-lkp@intel.com>
References: <20220902213721.946138-5-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902213721.946138-5-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

I love your patch! Yet something to improve:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on robh/for-next clk/clk-next arm/for-next arm64/for-next/core rockchip/for-next soc/for-next linus/master v6.0-rc3]
[cannot apply to xilinx-xlnx/master next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/phy-Add-support-for-Lynx-10G-SerDes/20220903-053840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220903/202209032301.fWPibuKq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cbfe9294ef583cc8dffd9cebf9ff325bbcdb4cef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/phy-Add-support-for-Lynx-10G-SerDes/20220903-053840
        git checkout cbfe9294ef583cc8dffd9cebf9ff325bbcdb4cef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_pll_recalc_rate':
>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:255:25: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     255 |         u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
         |                         ^~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_pll_set_rate':
>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:340:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     340 |         cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
         |                ^~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_clk_init':
>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:466:9: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     466 |         kfree(ref_name);
         |         ^~~~~
         |         vfree
   cc1: some warnings being treated as errors


vim +/FIELD_GET +255 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c

   249	
   250	static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
   251						  unsigned long parent_rate)
   252	{
   253		struct lynx_clk *clk = lynx_pll_to_clk(hw);
   254		u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
 > 255		u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
   256		u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
   257		u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   258		unsigned long ret;
   259	
   260		/* Ensure that the parent matches our rfclk selector */
   261		if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
   262			ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
   263		else
   264			ret = 0;
   265	
   266		dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
   267			(u64)ret * HZ_PER_KHZ, parent_rate);
   268		return ret;
   269	}
   270	
   271	static long lynx_pll_round_rate(struct clk_hw *hw, unsigned long rate_khz,
   272					unsigned long *parent_rate)
   273	{
   274		int frate_sel, rfclk_sel;
   275		struct lynx_clk *clk = lynx_pll_to_clk(hw);
   276		u32 ratio;
   277	
   278		dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
   279			(u64)rate_khz * HZ_PER_KHZ, *parent_rate);
   280	
   281		frate_sel = lynx_frate_to_sel(rate_khz);
   282		if (frate_sel < 0)
   283			return frate_sel;
   284	
   285		/* Try the current parent rate */
   286		rfclk_sel = lynx_rfclk_to_sel(*parent_rate);
   287		if (rfclk_sel >= 0) {
   288			ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   289			if (ratio)
   290				return mult_frac(*parent_rate, ratio, HZ_PER_KHZ);
   291		}
   292	
   293		/* Try all possible parent rates */
   294		for (rfclk_sel = 0;
   295		     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
   296		     rfclk_sel++) {
   297			unsigned long new_parent_rate;
   298	
   299			ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   300			if (!ratio)
   301				continue;
   302	
   303			/* Ensure the reference clock can produce this rate */
   304			new_parent_rate = rfclk_sel_map[rfclk_sel];
   305			new_parent_rate = clk_hw_round_rate(clk->ref, new_parent_rate);
   306			if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
   307				continue;
   308	
   309			*parent_rate = new_parent_rate;
   310			return mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
   311		}
   312	
   313		return -EINVAL;
   314	}
   315	
   316	static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
   317				   unsigned long parent_rate)
   318	{
   319		int frate_sel, rfclk_sel;
   320		struct lynx_clk *clk = lynx_pll_to_clk(hw);
   321		u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
   322	
   323		dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
   324			(u64)rate_khz * HZ_PER_KHZ, parent_rate);
   325	
   326		frate_sel = lynx_frate_to_sel(rate_khz);
   327		if (frate_sel < 0)
   328			return frate_sel;
   329	
   330		rfclk_sel = lynx_rfclk_to_sel(parent_rate);
   331		if (rfclk_sel < 0)
   332			return rfclk_sel;
   333	
   334		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   335		if (!ratio)
   336			return -EINVAL;
   337	
   338		lynx_pll_stop(clk);
   339		cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
 > 340		cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
   341		cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
   342		lynx_write(clk, cr0, PLLaCR0(clk->idx));
   343		/* Don't bother resetting if it's off */
   344		if (cr0 & PLLaCR0_POFF)
   345			return 0;
   346		return lynx_pll_reset(clk);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

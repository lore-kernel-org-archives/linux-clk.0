Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060F2BD06
	for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2024 21:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712869774; cv=none; b=d+I0sAoQqxqDgKl5uk+GakplauKxqQ8bwA+OCIFutcNzCa33G53RZ2UZM2ATNIQVE0OVAi1cPcu0Chn/VCc3ivVRU7lgNHKdeZYBfwX8rFTBvKyTORR7Q2Ow7mBy6V8YIRavgDbEXuo3SZrD4DKqEZg2j3g4x+wLfaCO86xoUNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712869774; c=relaxed/simple;
	bh=qwxXwcTr2zHS5bsYfOOF3ptNAFvHZNdpgxP/ZUTYODg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhrccLsq/0eaBWJ221uaRrdG+uDgM8i4+5g4mXCnY1TMyggvEYr460iZIjy/ELFTrjJOvwLmON+wtKdkG9cS0R2UOoYy3dCSfP3TVqSnpE81zyaRS0R1z2oC+82vNUpIVSr29vkA65/O3qJ7ERd8CNTX7+Oai/C/OprCi8Wv7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfA1DOQG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfA1DOQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712869773; x=1744405773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qwxXwcTr2zHS5bsYfOOF3ptNAFvHZNdpgxP/ZUTYODg=;
  b=cfA1DOQGpP9Mv1wEmMIZjWS3vTkfiVevpRDsK6BUl/Ts2q8GvsFzaZXN
   Y2o6c4N4pG8g6TFuswzfitF9l82yDV53+M8lPp301zO1TU8wXLhfmSaov
   FwrxQT63JpxsURre2eYZiYyDQAkS7HNTyrA88Ha9uD9Lr6DQP9mV3jVJ0
   pzQivtIUWiDjrhGK5sut/YcN7k4tyDlRd2zRUCQI2gg4A5wvwYR8HCVEJ
   wKCTA/0bEXa6m6lGvEic/MNE8E2ARSZDQtPXrtQjvTLJDGwo+ML+5dZfL
   X4IVKNRs1oS2gmCURugOlMczIai1h4mRmaZaVUMRLptJ+ihHKqvms3yMZ
   A==;
X-CSE-ConnectionGUID: feVX2YmcQYuC76ssSILIAg==
X-CSE-MsgGUID: 4EHPdDJfSRuJjkBQ+zmWTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12160382"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="12160382"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 14:09:32 -0700
X-CSE-ConnectionGUID: 1beJnkpnR2+ZDYC+UP97Vg==
X-CSE-MsgGUID: fr4lI4BfQrmsQTRpExZYfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21008544"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Apr 2024 14:09:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv1fk-0008z8-0Z;
	Thu, 11 Apr 2024 21:09:28 +0000
Date: Fri, 12 Apr 2024 05:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: [clk:clk-sophgo 2/4] drivers/clk/sophgo/clk-cv1800.c:82:35: sparse:
 sparse: symbol 'clk_mpll_synthesizer' was not declared. Should it be static?
Message-ID: <202404120548.y9dZIi0e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-sophgo
head:   1cce3e61af6a89aa4b01189257fba73e46244b2d
commit: 80fd61ec46124eb83b29de3647a565f69979e753 [2/4] clk: sophgo: Add clock support for CV1800 SoC
config: openrisc-randconfig-r111-20240412 (https://download.01.org/0day-ci/archive/20240412/202404120548.y9dZIi0e-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240412/202404120548.y9dZIi0e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120548.y9dZIi0e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/sophgo/clk-cv1800.c:82:35: sparse: sparse: symbol 'clk_mpll_synthesizer' was not declared. Should it be static?
>> drivers/clk/sophgo/clk-cv1800.c:96:35: sparse: sparse: symbol 'clk_tpll_synthesizer' was not declared. Should it be static?
>> drivers/clk/sophgo/clk-cv1800.c:110:35: sparse: sparse: symbol 'clk_a0pll_synthesizer' was not declared. Should it be static?
>> drivers/clk/sophgo/clk-cv1800.c:124:35: sparse: sparse: symbol 'clk_disppll_synthesizer' was not declared. Should it be static?
>> drivers/clk/sophgo/clk-cv1800.c:138:35: sparse: sparse: symbol 'clk_cam0pll_synthesizer' was not declared. Should it be static?
>> drivers/clk/sophgo/clk-cv1800.c:152:35: sparse: sparse: symbol 'clk_cam1pll_synthesizer' was not declared. Should it be static?
   drivers/clk/sophgo/clk-cv1800.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/clk_mpll_synthesizer +82 drivers/clk/sophgo/clk-cv1800.c

    81	
  > 82	struct cv1800_clk_pll_synthesizer clk_mpll_synthesizer = {
    83		.en		= CV1800_CLK_BIT(REG_PLL_G6_SSC_SYN_CTRL, 2),
    84		.clk_half	= CV1800_CLK_BIT(REG_PLL_G6_SSC_SYN_CTRL, 0),
    85		.ctrl		= REG_MPLL_SSC_SYN_CTRL,
    86		.set		= REG_MPLL_SSC_SYN_SET,
    87	};
    88	static CV1800_FACTIONAL_PLL(clk_mpll, clk_bypass_mipimpll_parents,
    89				    REG_MPLL_CSR,
    90				    REG_PLL_G6_CTRL, 0,
    91				    REG_PLL_G6_STATUS, 0,
    92				    pll_limits,
    93				    &clk_mpll_synthesizer,
    94				    CLK_IS_CRITICAL);
    95	
  > 96	struct cv1800_clk_pll_synthesizer clk_tpll_synthesizer = {
    97		.en		= CV1800_CLK_BIT(REG_PLL_G6_SSC_SYN_CTRL, 3),
    98		.clk_half	= CV1800_CLK_BIT(REG_PLL_G6_SSC_SYN_CTRL, 0),
    99		.ctrl		= REG_TPLL_SSC_SYN_CTRL,
   100		.set		= REG_TPLL_SSC_SYN_SET,
   101	};
   102	static CV1800_FACTIONAL_PLL(clk_tpll, clk_bypass_mipimpll_parents,
   103				    REG_TPLL_CSR,
   104				    REG_PLL_G6_CTRL, 4,
   105				    REG_PLL_G6_STATUS, 1,
   106				    pll_limits,
   107				    &clk_tpll_synthesizer,
   108				    CLK_IS_CRITICAL);
   109	
 > 110	struct cv1800_clk_pll_synthesizer clk_a0pll_synthesizer = {
   111		.en		= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 2),
   112		.clk_half	= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 0),
   113		.ctrl		= REG_A0PLL_SSC_SYN_CTRL,
   114		.set		= REG_A0PLL_SSC_SYN_SET,
   115	};
   116	static CV1800_FACTIONAL_PLL(clk_a0pll, clk_bypass_mipimpll_parents,
   117				    REG_A0PLL_CSR,
   118				    REG_PLL_G2_CTRL, 4,
   119				    REG_PLL_G2_STATUS, 1,
   120				    pll_limits,
   121				    &clk_a0pll_synthesizer,
   122				    CLK_IS_CRITICAL);
   123	
 > 124	struct cv1800_clk_pll_synthesizer clk_disppll_synthesizer = {
   125		.en		= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 3),
   126		.clk_half	= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 0),
   127		.ctrl		= REG_DISPPLL_SSC_SYN_CTRL,
   128		.set		= REG_DISPPLL_SSC_SYN_SET,
   129	};
   130	static CV1800_FACTIONAL_PLL(clk_disppll, clk_bypass_mipimpll_parents,
   131				    REG_DISPPLL_CSR,
   132				    REG_PLL_G2_CTRL, 8,
   133				    REG_PLL_G2_STATUS, 2,
   134				    pll_limits,
   135				    &clk_disppll_synthesizer,
   136				    CLK_IS_CRITICAL);
   137	
 > 138	struct cv1800_clk_pll_synthesizer clk_cam0pll_synthesizer = {
   139		.en		= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 4),
   140		.clk_half	= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 0),
   141		.ctrl		= REG_CAM0PLL_SSC_SYN_CTRL,
   142		.set		= REG_CAM0PLL_SSC_SYN_SET,
   143	};
   144	static CV1800_FACTIONAL_PLL(clk_cam0pll, clk_bypass_mipimpll_parents,
   145				    REG_CAM0PLL_CSR,
   146				    REG_PLL_G2_CTRL, 12,
   147				    REG_PLL_G2_STATUS, 3,
   148				    pll_limits,
   149				    &clk_cam0pll_synthesizer,
   150				    CLK_IGNORE_UNUSED);
   151	
 > 152	struct cv1800_clk_pll_synthesizer clk_cam1pll_synthesizer = {
   153		.en		= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 5),
   154		.clk_half	= CV1800_CLK_BIT(REG_PLL_G2_SSC_SYN_CTRL, 0),
   155		.ctrl		= REG_CAM1PLL_SSC_SYN_CTRL,
   156		.set		= REG_CAM1PLL_SSC_SYN_SET,
   157	};
   158	static CV1800_FACTIONAL_PLL(clk_cam1pll, clk_bypass_mipimpll_parents,
   159				    REG_CAM1PLL_CSR,
   160				    REG_PLL_G2_CTRL, 16,
   161				    REG_PLL_G2_STATUS, 4,
   162				    pll_limits,
   163				    &clk_cam1pll_synthesizer,
   164				    CLK_IS_CRITICAL);
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

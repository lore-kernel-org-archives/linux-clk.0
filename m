Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA4728642D;
	Fri,  5 Dec 2025 03:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764906719; cv=none; b=Q3zl9B2ASWn9YrTDfV6W8W9Jgc82IJ2UZ0HAxeUOpYS+2QX9OtrUOSbMlpEtYj2DyPQ93ChA/2pOD+elRlPPEMYp1CbnhLPFde2A8AA4NNylqQS2roknG0sdACKzzRWTjWHeAanbNJ9XeNcq4ey90DKNT9q1hzhw8KfO6npShbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764906719; c=relaxed/simple;
	bh=d6Egk7OgFcUoOnILINix8GJYnjMxYTxMhL9kXIYWTi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHxuGGVCN4eN3dEhRO6BSZ7BpqJeNIqShjJuWGLyYzyWMbDl8yk2j0gyqWXvRgfbYWjCt9awcoHs0uk3w3kLAz0CqPrELQHne/AGasA1PFm8dIKfacNFOe3+aA2A24PqdA765CulKobpuaXxS3nZclMd56nNwCOsqg8V/PGVQJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBegZFTQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBegZFTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764906717; x=1796442717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6Egk7OgFcUoOnILINix8GJYnjMxYTxMhL9kXIYWTi8=;
  b=ZBegZFTQm+mD//RY5YCORFoNN8CpdwfJMwdaYQ7KX4MccVo2x/ZT8rO8
   62LROyWG5RgwM8yBLgAW2Oh88HH5oNUBuaZsiyuzASqEZXok8Cev1Bry+
   J0H0XD5ng3CKnYgGqm3xhNtCS23hpgvyzccDxhaOrHJFdpKbiuAUKEryL
   A7M+XkhENbznihvXRj2rcIakIS6pYeJZrrTId7qWXmCMkQeUJle3HhwCG
   MHK3hwhwYOv3M7o2XBh8LuB3cqqnHwVApC6Il+G+sJ21/M8EKtHmrB2uu
   R2HkxVbPKYdwAvyxFPOzUQSPfXH2YOaUpmXepC8NnSJ8RPU1eZL0MOVBH
   g==;
X-CSE-ConnectionGUID: oYmzUus0Tqq+3Wp+Rcx2mg==
X-CSE-MsgGUID: d7aKxnesRvKj8gEqj7pWRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70787985"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70787985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 19:51:56 -0800
X-CSE-ConnectionGUID: UoMEGpqkRLGcnBQ6P6gViw==
X-CSE-MsgGUID: ZXphhHdAQSaeHhhG6YTC+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="218537257"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2025 19:51:54 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRMrI-00000000EYb-0bWP;
	Fri, 05 Dec 2025 03:51:52 +0000
Date: Fri, 5 Dec 2025 11:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202512051151.N3iZUKEG-lkp@intel.com>
References: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-clk-microchip-fixes-v2-3-9d5a0daadd98@redhat.com>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251202-060924
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251201-clk-microchip-fixes-v2-3-9d5a0daadd98%40redhat.com
patch subject: [PATCH v2 3/3] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20251205/202512051151.N3iZUKEG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051151.N3iZUKEG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051151.N3iZUKEG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/microchip/clk-core.c: Assembler messages:
>> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
>> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
>> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
>> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
>> drivers/clk/microchip/clk-core.c:721: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:722: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'
   drivers/clk/microchip/clk-core.c:862: Error: unrecognized instruction `nop'


vim +721 drivers/clk/microchip/clk-core.c

ce6e11884659988 Purna Chandra Mandal 2016-05-13  682  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  683  static int spll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
ce6e11884659988 Purna Chandra Mandal 2016-05-13  684  			     unsigned long parent_rate)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  685  {
ce6e11884659988 Purna Chandra Mandal 2016-05-13  686  	struct pic32_sys_pll *pll = clkhw_to_spll(hw);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  687  	unsigned long ret, flags;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  688  	u32 mult, odiv, v;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  689  	int err;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  690  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  691  	ret = spll_calc_mult_div(pll, rate, parent_rate, &mult, &odiv);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  692  	if (!ret)
ce6e11884659988 Purna Chandra Mandal 2016-05-13  693  		return -EINVAL;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  694  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  695  	/*
ce6e11884659988 Purna Chandra Mandal 2016-05-13  696  	 * We can't change SPLL counters when it is in-active use
ce6e11884659988 Purna Chandra Mandal 2016-05-13  697  	 * by SYSCLK. So check before applying new counters/rate.
ce6e11884659988 Purna Chandra Mandal 2016-05-13  698  	 */
ce6e11884659988 Purna Chandra Mandal 2016-05-13  699  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  700  	/* Is spll_clk active parent of sys_clk ? */
ce6e11884659988 Purna Chandra Mandal 2016-05-13  701  	if (unlikely(clk_hw_get_parent(pic32_sclk_hw) == hw)) {
ce6e11884659988 Purna Chandra Mandal 2016-05-13  702  		pr_err("%s: failed, clk in-use\n", __func__);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  703  		return -EBUSY;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  704  	}
ce6e11884659988 Purna Chandra Mandal 2016-05-13  705  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  706  	spin_lock_irqsave(&pll->core->reg_lock, flags);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  707  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  708  	/* apply new multiplier & divisor */
ce6e11884659988 Purna Chandra Mandal 2016-05-13  709  	v = readl(pll->ctrl_reg);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  710  	v &= ~(PLL_MULT_MASK << PLL_MULT_SHIFT);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  711  	v &= ~(PLL_ODIV_MASK << PLL_ODIV_SHIFT);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  712  	v |= (mult << PLL_MULT_SHIFT) | (odiv << PLL_ODIV_SHIFT);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  713  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  714  	/* sys unlock before write */
ce6e11884659988 Purna Chandra Mandal 2016-05-13  715  	pic32_syskey_unlock();
ce6e11884659988 Purna Chandra Mandal 2016-05-13  716  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  717  	writel(v, pll->ctrl_reg);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  718  	cpu_relax();
ce6e11884659988 Purna Chandra Mandal 2016-05-13  719  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  720  	/* insert few nops (5-stage) to ensure CPU does not hang */
ce6e11884659988 Purna Chandra Mandal 2016-05-13 @721  	cpu_nop5();
ce6e11884659988 Purna Chandra Mandal 2016-05-13  722  	cpu_nop5();
ce6e11884659988 Purna Chandra Mandal 2016-05-13  723  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  724  	/* Wait until PLL is locked (maximum 100 usecs). */
ce6e11884659988 Purna Chandra Mandal 2016-05-13  725  	err = readl_poll_timeout_atomic(pll->status_reg, v,
ce6e11884659988 Purna Chandra Mandal 2016-05-13  726  					v & pll->lock_mask, 1, 100);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  727  	spin_unlock_irqrestore(&pll->core->reg_lock, flags);
ce6e11884659988 Purna Chandra Mandal 2016-05-13  728  
ce6e11884659988 Purna Chandra Mandal 2016-05-13  729  	return err;
ce6e11884659988 Purna Chandra Mandal 2016-05-13  730  }
ce6e11884659988 Purna Chandra Mandal 2016-05-13  731  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8QEsenX"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D0F90;
	Wed,  6 Dec 2023 05:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701869263; x=1733405263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XUkNikLFxkRI2x0E4jzYEYV2cFpsJJkbcOTQSt8BVn8=;
  b=V8QEsenXajFgrrToqa2o00PeS++EQG1zM1eQ985mYoii/phGkeWmAYY7
   FXwTxQ4o/OAi9X3RV1itFwzzkxyHEskFS+vTqzGuaGAUINr8yG3ZKxVR/
   oGXGavUoRrqKkexms/9WYm/XJmuoEMnlQ8Ge7W9wv7d7MMO3QR6T/Y9r7
   g5Xtq317X4ZA7q3thBfqAWpzVHRybyVvrei/YZAOul/msYHG5dWJRXGAu
   nUrmsOw9J0SSDl5et8BuaygibAvSDsDQEw9WqvSKuen6nEM9/soFamMwE
   Msrxv3wN0Ve4dADr+/gLcNBca3SW6ofrguSVwem4UP3hpifuR4VZ2DGQ+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="930984"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="930984"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 05:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721084909"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="721084909"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 06 Dec 2023 05:27:39 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rArw8-000Apo-2W;
	Wed, 06 Dec 2023 13:27:36 +0000
Date: Wed, 6 Dec 2023 21:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: gabriel.fernandez@foss.st.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] clk: stm32: introduce clocks for STM32MP257
 platform
Message-ID: <202312062107.FZNn2b0i-lkp@intel.com>
References: <20231128164851.588315-5-gabriel.fernandez@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128164851.588315-5-gabriel.fernandez@foss.st.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gabriel-fernandez-foss-st-com/clk-stm32mp1-move-stm32mp1-clock-driver-into-stm32-directory/20231129-005157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231128164851.588315-5-gabriel.fernandez%40foss.st.com
patch subject: [PATCH v4 4/5] clk: stm32: introduce clocks for STM32MP257 platform
config: arm-randconfig-r132-20231201 (https://download.01.org/0day-ci/archive/20231206/202312062107.FZNn2b0i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312062107.FZNn2b0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062107.FZNn2b0i-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/stm32/clk-stm32mp25.c:1003:5: sparse: sparse: symbol 'stm32mp25_cpt_gate' was not declared. Should it be static?
>> drivers/clk/stm32/clk-stm32mp25.c:1005:29: sparse: sparse: symbol 'stm32mp25_clock_data' was not declared. Should it be static?
>> drivers/clk/stm32/clk-stm32mp25.c:1011:29: sparse: sparse: symbol 'stm32mp25_reset_data' was not declared. Should it be static?

vim +/stm32mp25_cpt_gate +1003 drivers/clk/stm32/clk-stm32mp25.c

  1002	
> 1003	u16 stm32mp25_cpt_gate[GATE_NB];
  1004	
> 1005	struct clk_stm32_clock_data stm32mp25_clock_data = {
  1006		.gate_cpt	= stm32mp25_cpt_gate,
  1007		.gates		= stm32mp25_gates,
  1008		.muxes		= stm32mp25_muxes,
  1009	};
  1010	
> 1011	struct clk_stm32_reset_data stm32mp25_reset_data = {
  1012		.reset_lines	= stm32mp25_reset_cfg,
  1013		.nr_lines	= ARRAY_SIZE(stm32mp25_reset_cfg),
  1014	};
  1015	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

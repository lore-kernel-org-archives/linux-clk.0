Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VARcUW6w"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4DD188;
	Tue,  5 Dec 2023 22:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701844841; x=1733380841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y3f54WbYajDqZbyvq2c5qPICl/FDzPaPpf3pfWEP5jY=;
  b=VARcUW6w+NTEF2frBM7F5MIlezAzgNfnAzfLpuv/PqtleslO4G3WndMU
   wcAM7RA7uXOzXutXc1WLobF4ZZGDAKeQkL0uAQjtlJX7bV3FNCrS4FCzp
   4JHafJ6SaqY2aPpwSbNF4VQhXo6HufO1nXKEmUSnPQyUiftpz69unlS82
   SfSVrmGAtVf4G7Am7lWKhyNXXh3RzQ4j2TA/95Kn3L0gJIek8SzBReWzM
   mtVdo83YzKh6+qHOIkh7spcRpO6IXtWIFpLjeadUGfSJ3aoZlV3XaBvkv
   zEjHGZi6UeWBQ+Xk+k4pv+hSH5DNuEQuqOkg0dD33q6H3oCwswvbBbayT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="887032"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="887032"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 22:40:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102716537"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102716537"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 22:40:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAlaA-000AQC-35;
	Wed, 06 Dec 2023 06:40:32 +0000
Date: Wed, 6 Dec 2023 14:39:56 +0800
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
Subject: Re: [PATCH v4 2/5] clk: stm32mp1: use stm32mp13 reset driver
Message-ID: <202312061455.vpswjBcr-lkp@intel.com>
References: <20231128164851.588315-3-gabriel.fernandez@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128164851.588315-3-gabriel.fernandez@foss.st.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/gabriel-fernandez-foss-st-com/clk-stm32mp1-move-stm32mp1-clock-driver-into-stm32-directory/20231129-005157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231128164851.588315-3-gabriel.fernandez%40foss.st.com
patch subject: [PATCH v4 2/5] clk: stm32mp1: use stm32mp13 reset driver
config: arm-randconfig-r132-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061455.vpswjBcr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061455.vpswjBcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061455.vpswjBcr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/stm32/clk-stm32mp13.c:1516:29: sparse: sparse: symbol 'stm32mp13_reset_data' was not declared. Should it be static?
--
>> drivers/clk/stm32/clk-stm32mp1.c:2148:29: sparse: sparse: symbol 'stm32mp1_reset_data' was not declared. Should it be static?

vim +/stm32mp13_reset_data +1516 drivers/clk/stm32/clk-stm32mp13.c

  1515	
> 1516	struct clk_stm32_reset_data stm32mp13_reset_data = {
  1517		.nr_lines	= STM32MP1_RESET_ID_MASK,
  1518		.clear_offset	= RCC_CLR_OFFSET,
  1519	};
  1520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

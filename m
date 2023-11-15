Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A1B1864D;
	Wed, 15 Nov 2023 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL7CWhsS"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBE8109;
	Wed, 15 Nov 2023 05:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700053389; x=1731589389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c3R/w4Q9mPrmw9TpsBboXGPRusiqAdaY7g7slnnMa0M=;
  b=BL7CWhsSvGB2CbvublMFbDcPo/z+lCe4xnUPbqCxxKWldSz7j4w0nI+i
   rqeZAOg5z3bfzPWMOTa8yx3c+90P5S6ipnNQEVU5f807aKDODeZUYBE21
   ScXlgjtoEAKSVnG9J1Q4KIi7i2QLEecCcxCWFHRGIJUhWwtKX3Ud0c1k7
   emk/Wv2AY+SO/7BsruZLeU7pfG/jXkgaf/Qs0ar0agFLsD6d7m6WT75/f
   8PbK7JO9not1P46mje8INq4OdrkcZoJKGn/V/eiJ4rg5Y5vyIbrN04cja
   p+3MA1dFczF0pNH7AWr3ijRzYL3RcX8wwLKrCk6GfvqEnmMTOhRKbX+gp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="393727972"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="393727972"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 05:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938480420"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="938480420"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 05:03:03 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3FXp-0000L5-0W;
	Wed, 15 Nov 2023 13:03:01 +0000
Date: Wed, 15 Nov 2023 21:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com
Cc: oe-kbuild-all@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 4/5] clk: sophgo: Add SG2042 clock generator driver
Message-ID: <202311152042.tMDnRsFe-lkp@intel.com>
References: <1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang@outlook.com>

Hi Chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Wang/dt-bindings-clock-sophgo-Add-SG2042-clock-definitions/20231113-212401
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/1000e8d546514973364478271564356352a46ed5.1699879741.git.unicorn_wang%40outlook.com
patch subject: [PATCH 4/5] clk: sophgo: Add SG2042 clock generator driver
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231115/202311152042.tMDnRsFe-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231115/202311152042.tMDnRsFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311152042.tMDnRsFe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/sophgo/clk-sophgo-sg2042.c: In function '__sg2042_get_pll_ctl_setting':
>> drivers/clk/sophgo/clk-sophgo-sg2042.c:25:28: warning: integer overflow in expression of type 'long int' results in '-1094967296' [-Woverflow]
      25 | #define PLL_FREQ_MAX (3200 * MHZ)
         |                            ^
   drivers/clk/sophgo/clk-sophgo-sg2042.c:217:65: note: in expansion of macro 'PLL_FREQ_MAX'
     217 |                         if (foutvco < PLL_FREQ_MIN || foutvco > PLL_FREQ_MAX
         |                                                                 ^~~~~~~~~~~~


vim +25 drivers/clk/sophgo/clk-sophgo-sg2042.c

    23	
    24	#define PLL_FREQ_MIN (16 * MHZ)
  > 25	#define PLL_FREQ_MAX (3200 * MHZ)
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

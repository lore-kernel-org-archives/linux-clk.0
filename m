Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62519C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 13:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240618AbiBWNKD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 08:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237250AbiBWNKC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 08:10:02 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BE595A14
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 05:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645621775; x=1677157775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z0pOnIngaHQctwWQT9OpJguHuDyTKdtIQ2KjPmHmvAA=;
  b=cAJ6/TcB/w5ctoxrlZqiOmUQQdAJ/iktBbh2MLsbT/lZ9kMac3O4CFSw
   S6BIzKbCQ8GHBan/X4q5BBwKDikF+4OLarL+Rlb4OdxYxyt+goN4OYmB4
   xuHEoAslpsM2/FsmPoIfyhH15oCf+Kyo9ZPNL9unn3GZvExRXl+WfUvNr
   2Lzr7ZLKpFI7SMtF4A+jTOObuSP7g3ZOXDxCZ0+Ot8LlPW5B3e7DRmr+l
   /7uYSJ/fVo90dEAmyKjZofOtCzUSOww4r4Fagf6eCf8YlPzaiK872ydQh
   aLM/oeNexilkHwqa+bYTjqtlBo6RGSWM5b2iMrH+Fpo5OPqiX7752s0q/
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="249540358"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="249540358"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 05:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="548238032"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2022 05:09:31 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMrOc-0001Sy-Si; Wed, 23 Feb 2022 13:09:30 +0000
Date:   Wed, 23 Feb 2022 21:09:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 3/8] clk: imx: pll14xx: Use FIELD_GET/FIELD_PREP
Message-ID: <202202232030.DHNZfsc4-lkp@intel.com>
References: <20220223075601.3652543-4-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223075601.3652543-4-s.hauer@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sascha,

I love your patch! Yet something to improve:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on clk/clk-next v5.17-rc5 next-20220222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sascha-Hauer/clk-i-MX-PLL14xx-Support-dynamic-rates/20220223-155846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: hexagon-randconfig-r015-20220221 (https://download.01.org/0day-ci/archive/20220223/202202232030.DHNZfsc4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c12e6c700842e937d181c80ce6ada39017ed6268
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sascha-Hauer/clk-i-MX-PLL14xx-Support-dynamic-rates/20220223-155846
        git checkout c12e6c700842e937d181c80ce6ada39017ed6268
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clk/imx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/imx/clk-pll14xx.c:123:9: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           mdiv = FIELD_GET(MDIV_MASK, pll_div);
                  ^
   drivers/clk/imx/clk-pll14xx.c:143:9: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
                  ^
   drivers/clk/imx/clk-pll14xx.c:162:13: error: implicit declaration of function 'FIELD_GET' [-Werror,-Wimplicit-function-declaration]
           old_mdiv = FIELD_GET(MDIV_MASK, pll_div);
                      ^
>> drivers/clk/imx/clk-pll14xx.c:195:10: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
                   tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
                          ^
   drivers/clk/imx/clk-pll14xx.c:214:12: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) | FIELD_PREP(PDIV_MASK, rate->pdiv) |
                     ^
   drivers/clk/imx/clk-pll14xx.c:261:10: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
                   tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
                          ^
   drivers/clk/imx/clk-pll14xx.c:279:12: error: implicit declaration of function 'FIELD_PREP' [-Werror,-Wimplicit-function-declaration]
           div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) |
                     ^
   7 errors generated.


vim +/FIELD_GET +123 drivers/clk/imx/clk-pll14xx.c

   114	
   115	static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
   116							  unsigned long parent_rate)
   117	{
   118		struct clk_pll14xx *pll = to_clk_pll14xx(hw);
   119		u32 mdiv, pdiv, sdiv, pll_div;
   120		u64 fvco = parent_rate;
   121	
   122		pll_div = readl_relaxed(pll->base + DIV_CTL0);
 > 123		mdiv = FIELD_GET(MDIV_MASK, pll_div);
   124		pdiv = FIELD_GET(PDIV_MASK, pll_div);
   125		sdiv = FIELD_GET(SDIV_MASK, pll_div);
   126	
   127		fvco *= mdiv;
   128		do_div(fvco, pdiv << sdiv);
   129	
   130		return fvco;
   131	}
   132	
   133	static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
   134							  unsigned long parent_rate)
   135	{
   136		struct clk_pll14xx *pll = to_clk_pll14xx(hw);
   137		u32 mdiv, pdiv, sdiv, pll_div_ctl0, pll_div_ctl1;
   138		short int kdiv;
   139		u64 fvco = parent_rate;
   140	
   141		pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
   142		pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
   143		mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
   144		pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
   145		sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
   146		kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
   147	
   148		/* fvco = (m * 65536 + k) * Fin / (p * 65536) */
   149		fvco *= (mdiv * 65536 + kdiv);
   150		pdiv *= 65536;
   151	
   152		do_div(fvco, pdiv << sdiv);
   153	
   154		return fvco;
   155	}
   156	
   157	static inline bool clk_pll14xx_mp_change(const struct imx_pll14xx_rate_table *rate,
   158						  u32 pll_div)
   159	{
   160		u32 old_mdiv, old_pdiv;
   161	
   162		old_mdiv = FIELD_GET(MDIV_MASK, pll_div);
   163		old_pdiv = FIELD_GET(PDIV_MASK, pll_div);
   164	
   165		return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv;
   166	}
   167	
   168	static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
   169	{
   170		u32 val;
   171	
   172		return readl_poll_timeout(pll->base + GNRL_CTL, val, val & LOCK_STATUS, 0,
   173				LOCK_TIMEOUT_US);
   174	}
   175	
   176	static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
   177					 unsigned long prate)
   178	{
   179		struct clk_pll14xx *pll = to_clk_pll14xx(hw);
   180		const struct imx_pll14xx_rate_table *rate;
   181		u32 tmp, div_val;
   182		int ret;
   183	
   184		rate = imx_get_pll_settings(pll, drate);
   185		if (!rate) {
   186			pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
   187			       drate, clk_hw_get_name(hw));
   188			return -EINVAL;
   189		}
   190	
   191		tmp = readl_relaxed(pll->base + DIV_CTL0);
   192	
   193		if (!clk_pll14xx_mp_change(rate, tmp)) {
   194			tmp &= ~SDIV_MASK;
 > 195			tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
   196			writel_relaxed(tmp, pll->base + DIV_CTL0);
   197	
   198			return 0;
   199		}
   200	
   201		/* Bypass clock and set lock to pll output lock */
   202		tmp = readl_relaxed(pll->base + GNRL_CTL);
   203		tmp |= LOCK_SEL_MASK;
   204		writel_relaxed(tmp, pll->base + GNRL_CTL);
   205	
   206		/* Enable RST */
   207		tmp &= ~RST_MASK;
   208		writel_relaxed(tmp, pll->base + GNRL_CTL);
   209	
   210		/* Enable BYPASS */
   211		tmp |= BYPASS_MASK;
   212		writel(tmp, pll->base + GNRL_CTL);
   213	
   214		div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) | FIELD_PREP(PDIV_MASK, rate->pdiv) |
   215			FIELD_PREP(SDIV_MASK, rate->sdiv);
   216		writel_relaxed(div_val, pll->base + DIV_CTL0);
   217	
   218		/*
   219		 * According to SPEC, t3 - t2 need to be greater than
   220		 * 1us and 1/FREF, respectively.
   221		 * FREF is FIN / Prediv, the prediv is [1, 63], so choose
   222		 * 3us.
   223		 */
   224		udelay(3);
   225	
   226		/* Disable RST */
   227		tmp |= RST_MASK;
   228		writel_relaxed(tmp, pll->base + GNRL_CTL);
   229	
   230		/* Wait Lock */
   231		ret = clk_pll14xx_wait_lock(pll);
   232		if (ret)
   233			return ret;
   234	
   235		/* Bypass */
   236		tmp &= ~BYPASS_MASK;
   237		writel_relaxed(tmp, pll->base + GNRL_CTL);
   238	
   239		return 0;
   240	}
   241	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

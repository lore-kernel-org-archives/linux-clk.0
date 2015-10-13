Return-Path: <fengguang.wu@intel.com>
Date: Wed, 14 Oct 2015 01:23:44 +0800
From: kbuild test robot <lkp@intel.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org,
	Luis de Bethencourt <luisbg@osg.samsung.com>,
	Javier Martinez Canillas <javier@osg.samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
Message-ID: <201510140120.1VRJNjqC%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

Hi Javier,

[auto build test WARNING on clk/clk-next -- if it's inappropriate base, please suggest rules for selecting the more suitable base]

url:    https://github.com/0day-ci/linux/commits/Javier-Martinez-Canillas/clk-Allow-drivers-to-build-if-COMPILE_TEST-is-enabled/20151013-222133
reproduce:
        # apt-get install sparse
        make ARCH=x86_64 allmodconfig
        make C=1 CF=-D__CHECK_ENDIAN__


sparse warnings: (new ones prefixed by >>)

>> drivers/clk/clk-xgene.c:217:12: sparse: context imbalance in 'xgene_clk_enable' - different lock contexts for basic block
>> drivers/clk/clk-xgene.c:285:9: sparse: context imbalance in 'xgene_clk_disable' - different lock contexts for basic block
>> drivers/clk/clk-xgene.c:368:9: sparse: context imbalance in 'xgene_clk_set_rate' - different lock contexts for basic block
--
>> drivers/clk/keystone/gate.c:117:12: sparse: context imbalance in 'keystone_clk_enable' - different lock contexts for basic block
>> drivers/clk/keystone/gate.c:147:9: sparse: context imbalance in 'keystone_clk_disable' - different lock contexts for basic block

vim +/xgene_clk_enable +217 drivers/clk/clk-xgene.c

308964ca Loc Ho           2013-06-26  211  	spinlock_t	*lock;
308964ca Loc Ho           2013-06-26  212  	struct xgene_dev_parameters	param;
308964ca Loc Ho           2013-06-26  213  };
308964ca Loc Ho           2013-06-26  214  
308964ca Loc Ho           2013-06-26  215  #define to_xgene_clk(_hw) container_of(_hw, struct xgene_clk, hw)
308964ca Loc Ho           2013-06-26  216  
308964ca Loc Ho           2013-06-26 @217  static int xgene_clk_enable(struct clk_hw *hw)
308964ca Loc Ho           2013-06-26  218  {
308964ca Loc Ho           2013-06-26  219  	struct xgene_clk *pclk = to_xgene_clk(hw);
308964ca Loc Ho           2013-06-26  220  	unsigned long flags = 0;
308964ca Loc Ho           2013-06-26  221  	u32 data;
6ae5fd38 Stephen Boyd     2015-05-01  222  	phys_addr_t reg;
308964ca Loc Ho           2013-06-26  223  
308964ca Loc Ho           2013-06-26  224  	if (pclk->lock)
308964ca Loc Ho           2013-06-26  225  		spin_lock_irqsave(pclk->lock, flags);
308964ca Loc Ho           2013-06-26  226  
308964ca Loc Ho           2013-06-26  227  	if (pclk->param.csr_reg != NULL) {
836ee0f7 Stephen Boyd     2015-08-12  228  		pr_debug("%s clock enabled\n", clk_hw_get_name(hw));
6ae5fd38 Stephen Boyd     2015-05-01  229  		reg = __pa(pclk->param.csr_reg);
308964ca Loc Ho           2013-06-26  230  		/* First enable the clock */
308964ca Loc Ho           2013-06-26  231  		data = xgene_clk_read(pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  232  					pclk->param.reg_clk_offset);
308964ca Loc Ho           2013-06-26  233  		data |= pclk->param.reg_clk_mask;
308964ca Loc Ho           2013-06-26  234  		xgene_clk_write(data, pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  235  					pclk->param.reg_clk_offset);
6ae5fd38 Stephen Boyd     2015-05-01  236  		pr_debug("%s clock PADDR base %pa clk offset 0x%08X mask 0x%08X value 0x%08X\n",
836ee0f7 Stephen Boyd     2015-08-12  237  			clk_hw_get_name(hw), &reg,
308964ca Loc Ho           2013-06-26  238  			pclk->param.reg_clk_offset, pclk->param.reg_clk_mask,
308964ca Loc Ho           2013-06-26  239  			data);
308964ca Loc Ho           2013-06-26  240  
308964ca Loc Ho           2013-06-26  241  		/* Second enable the CSR */
308964ca Loc Ho           2013-06-26  242  		data = xgene_clk_read(pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  243  					pclk->param.reg_csr_offset);
308964ca Loc Ho           2013-06-26  244  		data &= ~pclk->param.reg_csr_mask;
308964ca Loc Ho           2013-06-26  245  		xgene_clk_write(data, pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  246  					pclk->param.reg_csr_offset);
6ae5fd38 Stephen Boyd     2015-05-01  247  		pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X mask 0x%08X value 0x%08X\n",
836ee0f7 Stephen Boyd     2015-08-12  248  			clk_hw_get_name(hw), &reg,
308964ca Loc Ho           2013-06-26  249  			pclk->param.reg_csr_offset, pclk->param.reg_csr_mask,
308964ca Loc Ho           2013-06-26  250  			data);
308964ca Loc Ho           2013-06-26  251  	}
308964ca Loc Ho           2013-06-26  252  
308964ca Loc Ho           2013-06-26  253  	if (pclk->lock)
308964ca Loc Ho           2013-06-26  254  		spin_unlock_irqrestore(pclk->lock, flags);
308964ca Loc Ho           2013-06-26  255  
308964ca Loc Ho           2013-06-26  256  	return 0;
308964ca Loc Ho           2013-06-26  257  }
308964ca Loc Ho           2013-06-26  258  
308964ca Loc Ho           2013-06-26  259  static void xgene_clk_disable(struct clk_hw *hw)
308964ca Loc Ho           2013-06-26  260  {
308964ca Loc Ho           2013-06-26  261  	struct xgene_clk *pclk = to_xgene_clk(hw);
308964ca Loc Ho           2013-06-26  262  	unsigned long flags = 0;
308964ca Loc Ho           2013-06-26  263  	u32 data;
308964ca Loc Ho           2013-06-26  264  
308964ca Loc Ho           2013-06-26  265  	if (pclk->lock)
308964ca Loc Ho           2013-06-26  266  		spin_lock_irqsave(pclk->lock, flags);
308964ca Loc Ho           2013-06-26  267  
308964ca Loc Ho           2013-06-26  268  	if (pclk->param.csr_reg != NULL) {
836ee0f7 Stephen Boyd     2015-08-12  269  		pr_debug("%s clock disabled\n", clk_hw_get_name(hw));
308964ca Loc Ho           2013-06-26  270  		/* First put the CSR in reset */
308964ca Loc Ho           2013-06-26  271  		data = xgene_clk_read(pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  272  					pclk->param.reg_csr_offset);
308964ca Loc Ho           2013-06-26  273  		data |= pclk->param.reg_csr_mask;
308964ca Loc Ho           2013-06-26  274  		xgene_clk_write(data, pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  275  					pclk->param.reg_csr_offset);
308964ca Loc Ho           2013-06-26  276  
308964ca Loc Ho           2013-06-26  277  		/* Second disable the clock */
308964ca Loc Ho           2013-06-26  278  		data = xgene_clk_read(pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  279  					pclk->param.reg_clk_offset);
308964ca Loc Ho           2013-06-26  280  		data &= ~pclk->param.reg_clk_mask;
308964ca Loc Ho           2013-06-26  281  		xgene_clk_write(data, pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  282  					pclk->param.reg_clk_offset);
308964ca Loc Ho           2013-06-26  283  	}
308964ca Loc Ho           2013-06-26  284  
308964ca Loc Ho           2013-06-26 @285  	if (pclk->lock)
308964ca Loc Ho           2013-06-26  286  		spin_unlock_irqrestore(pclk->lock, flags);
308964ca Loc Ho           2013-06-26  287  }
308964ca Loc Ho           2013-06-26  288  
308964ca Loc Ho           2013-06-26  289  static int xgene_clk_is_enabled(struct clk_hw *hw)
308964ca Loc Ho           2013-06-26  290  {
308964ca Loc Ho           2013-06-26  291  	struct xgene_clk *pclk = to_xgene_clk(hw);
308964ca Loc Ho           2013-06-26  292  	u32 data = 0;
308964ca Loc Ho           2013-06-26  293  
308964ca Loc Ho           2013-06-26  294  	if (pclk->param.csr_reg != NULL) {
836ee0f7 Stephen Boyd     2015-08-12  295  		pr_debug("%s clock checking\n", clk_hw_get_name(hw));
308964ca Loc Ho           2013-06-26  296  		data = xgene_clk_read(pclk->param.csr_reg +
308964ca Loc Ho           2013-06-26  297  					pclk->param.reg_clk_offset);
836ee0f7 Stephen Boyd     2015-08-12  298  		pr_debug("%s clock is %s\n", clk_hw_get_name(hw),
308964ca Loc Ho           2013-06-26  299  			data & pclk->param.reg_clk_mask ? "enabled" :
308964ca Loc Ho           2013-06-26  300  							"disabled");
308964ca Loc Ho           2013-06-26  301  	}
308964ca Loc Ho           2013-06-26  302  
308964ca Loc Ho           2013-06-26  303  	if (pclk->param.csr_reg == NULL)
308964ca Loc Ho           2013-06-26  304  		return 1;
308964ca Loc Ho           2013-06-26  305  	return data & pclk->param.reg_clk_mask ? 1 : 0;
308964ca Loc Ho           2013-06-26  306  }
308964ca Loc Ho           2013-06-26  307  
308964ca Loc Ho           2013-06-26  308  static unsigned long xgene_clk_recalc_rate(struct clk_hw *hw,
308964ca Loc Ho           2013-06-26  309  				unsigned long parent_rate)
308964ca Loc Ho           2013-06-26  310  {
308964ca Loc Ho           2013-06-26  311  	struct xgene_clk *pclk = to_xgene_clk(hw);
308964ca Loc Ho           2013-06-26  312  	u32 data;
308964ca Loc Ho           2013-06-26  313  
308964ca Loc Ho           2013-06-26  314  	if (pclk->param.divider_reg) {
308964ca Loc Ho           2013-06-26  315  		data = xgene_clk_read(pclk->param.divider_reg +
308964ca Loc Ho           2013-06-26  316  					pclk->param.reg_divider_offset);
308964ca Loc Ho           2013-06-26  317  		data >>= pclk->param.reg_divider_shift;
308964ca Loc Ho           2013-06-26  318  		data &= (1 << pclk->param.reg_divider_width) - 1;
308964ca Loc Ho           2013-06-26  319  
308964ca Loc Ho           2013-06-26  320  		pr_debug("%s clock recalc rate %ld parent %ld\n",
836ee0f7 Stephen Boyd     2015-08-12  321  			clk_hw_get_name(hw),
78e50c6d Matthias Brugger 2015-06-17  322  			parent_rate / data, parent_rate);
78e50c6d Matthias Brugger 2015-06-17  323  
308964ca Loc Ho           2013-06-26  324  		return parent_rate / data;
308964ca Loc Ho           2013-06-26  325  	} else {
308964ca Loc Ho           2013-06-26  326  		pr_debug("%s clock recalc rate %ld parent %ld\n",
836ee0f7 Stephen Boyd     2015-08-12  327  			clk_hw_get_name(hw), parent_rate, parent_rate);
308964ca Loc Ho           2013-06-26  328  		return parent_rate;
308964ca Loc Ho           2013-06-26  329  	}
308964ca Loc Ho           2013-06-26  330  }
308964ca Loc Ho           2013-06-26  331  
308964ca Loc Ho           2013-06-26  332  static int xgene_clk_set_rate(struct clk_hw *hw, unsigned long rate,
308964ca Loc Ho           2013-06-26  333  				unsigned long parent_rate)
308964ca Loc Ho           2013-06-26  334  {
308964ca Loc Ho           2013-06-26  335  	struct xgene_clk *pclk = to_xgene_clk(hw);
308964ca Loc Ho           2013-06-26  336  	unsigned long flags = 0;
308964ca Loc Ho           2013-06-26  337  	u32 data;
308964ca Loc Ho           2013-06-26  338  	u32 divider;
308964ca Loc Ho           2013-06-26  339  	u32 divider_save;
308964ca Loc Ho           2013-06-26  340  
308964ca Loc Ho           2013-06-26  341  	if (pclk->lock)
308964ca Loc Ho           2013-06-26  342  		spin_lock_irqsave(pclk->lock, flags);
308964ca Loc Ho           2013-06-26  343  
308964ca Loc Ho           2013-06-26  344  	if (pclk->param.divider_reg) {
308964ca Loc Ho           2013-06-26  345  		/* Let's compute the divider */
308964ca Loc Ho           2013-06-26  346  		if (rate > parent_rate)
308964ca Loc Ho           2013-06-26  347  			rate = parent_rate;
308964ca Loc Ho           2013-06-26  348  		divider_save = divider = parent_rate / rate; /* Rounded down */
308964ca Loc Ho           2013-06-26  349  		divider &= (1 << pclk->param.reg_divider_width) - 1;
308964ca Loc Ho           2013-06-26  350  		divider <<= pclk->param.reg_divider_shift;
308964ca Loc Ho           2013-06-26  351  
308964ca Loc Ho           2013-06-26  352  		/* Set new divider */
308964ca Loc Ho           2013-06-26  353  		data = xgene_clk_read(pclk->param.divider_reg +
308964ca Loc Ho           2013-06-26  354  				pclk->param.reg_divider_offset);
308964ca Loc Ho           2013-06-26  355  		data &= ~((1 << pclk->param.reg_divider_width) - 1);
308964ca Loc Ho           2013-06-26  356  		data |= divider;
308964ca Loc Ho           2013-06-26  357  		xgene_clk_write(data, pclk->param.divider_reg +
308964ca Loc Ho           2013-06-26  358  					pclk->param.reg_divider_offset);
836ee0f7 Stephen Boyd     2015-08-12  359  		pr_debug("%s clock set rate %ld\n", clk_hw_get_name(hw),
308964ca Loc Ho           2013-06-26  360  			parent_rate / divider_save);
308964ca Loc Ho           2013-06-26  361  	} else {
308964ca Loc Ho           2013-06-26  362  		divider_save = 1;
308964ca Loc Ho           2013-06-26  363  	}
308964ca Loc Ho           2013-06-26  364  
308964ca Loc Ho           2013-06-26  365  	if (pclk->lock)
308964ca Loc Ho           2013-06-26  366  		spin_unlock_irqrestore(pclk->lock, flags);
308964ca Loc Ho           2013-06-26  367  
308964ca Loc Ho           2013-06-26 @368  	return parent_rate / divider_save;
308964ca Loc Ho           2013-06-26  369  }
308964ca Loc Ho           2013-06-26  370  
308964ca Loc Ho           2013-06-26  371  static long xgene_clk_round_rate(struct clk_hw *hw, unsigned long rate,

:::::: The code at line 217 was first introduced by commit
:::::: 308964caeebc45eb7723c87818076f61fa1a2e1b clk: Add APM X-Gene SoC clock driver

:::::: TO: Loc Ho <lho@apm.com>
:::::: CC: Mike Turquette <mturquette@linaro.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

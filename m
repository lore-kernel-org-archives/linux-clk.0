Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8D9286413;
	Sat, 17 Jan 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768674680; cv=none; b=Zrkh1CcJdib5tjlRCIBffmLUwlr/u5oeLT+BYRaO3A1ZDGXxNwbB6UhbBJkbUNJbRLkOb791RnHzt0oK0UjSC7EC5nrokSrruoTijWetJbFUQ11KwNmiQ7/2hSRu4fu9OmcqgbLLt9qtq8/RqtEESLc+iLEgFevDz2RBTwep5aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768674680; c=relaxed/simple;
	bh=mO9HmmxW0mtzX9fJKfZURo/BVj/x5wMjEZDY6GI3kRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6i27efyU7J44d8pYryTbI1uHwuLPtQhXd78pEdr5+pHw2m4Vtm/lT7OP9BZVPPXUamW8FN9evM3lxszsEciEJWIBXi6kOL7jDT+hf1vnWlHrCClNM85c7sHwSYhdItNH5LZhbw0OWnET3q40onYgD6zFPx38hEywY+WL4BKpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHk20ZTf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHk20ZTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768674677; x=1800210677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mO9HmmxW0mtzX9fJKfZURo/BVj/x5wMjEZDY6GI3kRk=;
  b=RHk20ZTfX5lj3JBgO7uoXZAO/GM/tpWBQc1lREckegl3IjT0W4T6sBQq
   bqGmKQ0bFbVM3Z301spVGxAeE2YI8EwbzPkSXF4DEOha8OWq9uXG996/n
   wKXJx1vEJWN59/nrJYdZr/rlhG4VsD7HEAF5M1kzMwbBna3UX9MRopr+s
   oF5W23aElBSk2K8UO0GnTtVEAO5M8RLXDflAEOdtgcm7XBH1FrUs3b51d
   3REAsvr1D+bNq9JNmf2F7yneiMFBNYbzhrV1uiPeK8TG2s3I3mx4VzxTZ
   zmvTqy3azUeRvCEScahr2W8eDScSElb2YPcVfFI4wTOsL28ZK4Ig046+2
   Q==;
X-CSE-ConnectionGUID: V9QJ0RrHTV+1+8i+DkzxeQ==
X-CSE-MsgGUID: vXlbczYTR1yRb2XCv9xuJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73584434"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="73584434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 10:31:16 -0800
X-CSE-ConnectionGUID: X+PVpQx0QDGG/MG2zU/TdA==
X-CSE-MsgGUID: NFjCovPHQtOU/pr3rRKRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="210372574"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jan 2026 10:31:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhB4o-00000000M8K-07rm;
	Sat, 17 Jan 2026 18:31:10 +0000
Date: Sun, 18 Jan 2026 02:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, bmasney@redhat.com,
	alexander.sverdlin@gmail.com, varshini.rajendran@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	cristian.birsan@microchip.com,
	balamanikandan.gunasundar@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 25/31] clk: at91: sama5d4: switch to parent_data and
 parent_hw
Message-ID: <202601180222.Hbv6eIHq-lkp@intel.com>
References: <67141a009da082eacfc2b1959750b479f8e03c63.1768512290.git.ryan.wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67141a009da082eacfc2b1959750b479f8e03c63.1768512290.git.ryan.wanner@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.19-rc5 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ryan-wanner-microchip-com/clk-at91-pmc-add-macros-for-clk_parent_data/20260117-041915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/67141a009da082eacfc2b1959750b479f8e03c63.1768512290.git.ryan.wanner%40microchip.com
patch subject: [PATCH v5 25/31] clk: at91: sama5d4: switch to parent_data and parent_hw
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260118/202601180222.Hbv6eIHq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180222.Hbv6eIHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180222.Hbv6eIHq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/at91/sama5d4.c:177:13: warning: variable 'hw' is uninitialized when used here [-Wuninitialized]
     177 |         if (IS_ERR(hw))
         |                    ^~
   drivers/clk/at91/sama5d4.c:133:41: note: initialize the variable 'hw' to silence this warning
     133 |         struct clk_hw *smdck_hw, *usbck_hw, *hw;
         |                                                ^
         |                                                 = NULL
   1 warning generated.


vim +/hw +177 drivers/clk/at91/sama5d4.c

084b696bb509d59 Alexandre Belloni 2018-10-16  128  
084b696bb509d59 Alexandre Belloni 2018-10-16  129  static void __init sama5d4_pmc_setup(struct device_node *np)
084b696bb509d59 Alexandre Belloni 2018-10-16  130  {
0a39dac200eaef3 Claudiu Beznea    2026-01-16  131  	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  132  	const char *slck_name, *mainxtal_name;
0a39dac200eaef3 Claudiu Beznea    2026-01-16  133  	struct clk_hw *smdck_hw, *usbck_hw, *hw;
0a39dac200eaef3 Claudiu Beznea    2026-01-16  134  	struct clk_range range = CLK_RANGE(0, 0);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  135  	struct clk_parent_data parent_data[5];
084b696bb509d59 Alexandre Belloni 2018-10-16  136  	struct pmc_data *sama5d4_pmc;
084b696bb509d59 Alexandre Belloni 2018-10-16  137  	struct regmap *regmap;
084b696bb509d59 Alexandre Belloni 2018-10-16  138  	int i;
084b696bb509d59 Alexandre Belloni 2018-10-16  139  	bool bypass;
084b696bb509d59 Alexandre Belloni 2018-10-16  140  
084b696bb509d59 Alexandre Belloni 2018-10-16  141  	i = of_property_match_string(np, "clock-names", "slow_clk");
084b696bb509d59 Alexandre Belloni 2018-10-16  142  	if (i < 0)
084b696bb509d59 Alexandre Belloni 2018-10-16  143  		return;
084b696bb509d59 Alexandre Belloni 2018-10-16  144  
084b696bb509d59 Alexandre Belloni 2018-10-16  145  	slck_name = of_clk_get_parent_name(np, i);
084b696bb509d59 Alexandre Belloni 2018-10-16  146  
084b696bb509d59 Alexandre Belloni 2018-10-16  147  	i = of_property_match_string(np, "clock-names", "main_xtal");
084b696bb509d59 Alexandre Belloni 2018-10-16  148  	if (i < 0)
084b696bb509d59 Alexandre Belloni 2018-10-16  149  		return;
084b696bb509d59 Alexandre Belloni 2018-10-16  150  	mainxtal_name = of_clk_get_parent_name(np, i);
084b696bb509d59 Alexandre Belloni 2018-10-16  151  
6956eb33abb5dea Alexandre Belloni 2019-11-28  152  	regmap = device_node_to_regmap(np);
084b696bb509d59 Alexandre Belloni 2018-10-16  153  	if (IS_ERR(regmap))
084b696bb509d59 Alexandre Belloni 2018-10-16  154  		return;
084b696bb509d59 Alexandre Belloni 2018-10-16  155  
03a1ee1dad0e393 Michał Mirosław   2020-05-05  156  	sama5d4_pmc = pmc_data_allocate(PMC_PLLACK + 1,
084b696bb509d59 Alexandre Belloni 2018-10-16  157  					nck(sama5d4_systemck),
99767cd4406fd62 Michał Mirosław   2020-05-05  158  					nck(sama5d4_periph32ck), 0, 3);
084b696bb509d59 Alexandre Belloni 2018-10-16  159  	if (!sama5d4_pmc)
084b696bb509d59 Alexandre Belloni 2018-10-16  160  		return;
084b696bb509d59 Alexandre Belloni 2018-10-16  161  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  162  	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
084b696bb509d59 Alexandre Belloni 2018-10-16  163  						   100000000);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  164  	if (IS_ERR(main_rc_hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  165  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  166  
084b696bb509d59 Alexandre Belloni 2018-10-16  167  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
084b696bb509d59 Alexandre Belloni 2018-10-16  168  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  169  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  170  						 &AT91_CLK_PD_NAME(mainxtal_name), bypass);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  171  	if (IS_ERR(main_osc_hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  172  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  173  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  174  	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  175  	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  176  	mainck_hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
084b696bb509d59 Alexandre Belloni 2018-10-16 @177  	if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  178  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  179  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  180  	hw = at91_clk_register_pll(regmap, "pllack", NULL, &AT91_CLK_PD_HW(mainck_hw), 0,
084b696bb509d59 Alexandre Belloni 2018-10-16  181  				   &sama5d3_pll_layout, &plla_characteristics);
084b696bb509d59 Alexandre Belloni 2018-10-16  182  	if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  183  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  184  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  185  	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
084b696bb509d59 Alexandre Belloni 2018-10-16  186  	if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  187  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  188  
03a1ee1dad0e393 Michał Mirosław   2020-05-05  189  	sama5d4_pmc->chws[PMC_PLLACK] = hw;
03a1ee1dad0e393 Michał Mirosław   2020-05-05  190  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  191  	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, &AT91_CLK_PD_HW(mainck_hw));
084b696bb509d59 Alexandre Belloni 2018-10-16  192  	if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  193  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  194  
084b696bb509d59 Alexandre Belloni 2018-10-16  195  	sama5d4_pmc->chws[PMC_UTMI] = hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  196  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  197  	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  198  	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  199  	parent_data[2] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  200  	parent_data[3] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
7a110b9107ed8fe Claudiu Beznea    2020-11-19  201  	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  202  					   NULL, parent_data,
7a110b9107ed8fe Claudiu Beznea    2020-11-19  203  					   &at91sam9x5_master_layout,
8e842f02af7e2f6 Claudiu Beznea    2022-02-03  204  					   &mck_characteristics, &mck_lock);
7a110b9107ed8fe Claudiu Beznea    2020-11-19  205  	if (IS_ERR(hw))
7a110b9107ed8fe Claudiu Beznea    2020-11-19  206  		goto err_free;
7a110b9107ed8fe Claudiu Beznea    2020-11-19  207  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  208  	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL, &AT91_CLK_PD_HW(hw),
084b696bb509d59 Alexandre Belloni 2018-10-16  209  					  &at91sam9x5_master_layout,
7a110b9107ed8fe Claudiu Beznea    2020-11-19  210  					  &mck_characteristics, &mck_lock,
7029db09b2025f8 Claudiu Beznea    2021-10-11  211  					  CLK_SET_RATE_GATE, 0);
084b696bb509d59 Alexandre Belloni 2018-10-16  212  	if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  213  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  214  
084b696bb509d59 Alexandre Belloni 2018-10-16  215  	sama5d4_pmc->chws[PMC_MCK] = hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  216  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  217  	hw = at91_clk_register_h32mx(regmap, "h32mxck", NULL,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  218  				     &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]));
084b696bb509d59 Alexandre Belloni 2018-10-16  219  	if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  220  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  221  
084b696bb509d59 Alexandre Belloni 2018-10-16  222  	sama5d4_pmc->chws[PMC_MCK2] = hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  223  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  224  	parent_data[0] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  225  	parent_data[1] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  226  	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  227  	if (IS_ERR(usbck_hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  228  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  229  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  230  	smdck_hw = at91sam9x5_clk_register_smd(regmap, "smdclk", NULL, parent_data, 2);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  231  	if (IS_ERR(smdck_hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  232  		goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  233  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  234  	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  235  	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  236  	parent_data[2] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_PLLACK]);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  237  	parent_data[3] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_UTMI]);
0a39dac200eaef3 Claudiu Beznea    2026-01-16  238  	parent_data[4] = AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]);
084b696bb509d59 Alexandre Belloni 2018-10-16  239  	for (i = 0; i < 3; i++) {
084b696bb509d59 Alexandre Belloni 2018-10-16  240  		char name[6];
084b696bb509d59 Alexandre Belloni 2018-10-16  241  
084b696bb509d59 Alexandre Belloni 2018-10-16  242  		snprintf(name, sizeof(name), "prog%d", i);
084b696bb509d59 Alexandre Belloni 2018-10-16  243  
084b696bb509d59 Alexandre Belloni 2018-10-16  244  		hw = at91_clk_register_programmable(regmap, name,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  245  						    NULL, parent_data, 5, i,
c57aaaa28cf1a12 Claudiu Beznea    2020-07-22  246  						    &at91sam9x5_programmable_layout,
c57aaaa28cf1a12 Claudiu Beznea    2020-07-22  247  						    NULL);
084b696bb509d59 Alexandre Belloni 2018-10-16  248  		if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  249  			goto err_free;
99767cd4406fd62 Michał Mirosław   2020-05-05  250  
99767cd4406fd62 Michał Mirosław   2020-05-05  251  		sama5d4_pmc->pchws[i] = hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  252  	}
084b696bb509d59 Alexandre Belloni 2018-10-16  253  
0a39dac200eaef3 Claudiu Beznea    2026-01-16  254  	/* Set systemck parent hws. */
0a39dac200eaef3 Claudiu Beznea    2026-01-16  255  	sama5d4_systemck[0].parent_hw = sama5d4_pmc->chws[PMC_MCK];
0a39dac200eaef3 Claudiu Beznea    2026-01-16  256  	sama5d4_systemck[1].parent_hw = sama5d4_pmc->chws[PMC_MCK];
0a39dac200eaef3 Claudiu Beznea    2026-01-16  257  	sama5d4_systemck[2].parent_hw = smdck_hw;
0a39dac200eaef3 Claudiu Beznea    2026-01-16  258  	sama5d4_systemck[3].parent_hw = usbck_hw;
0a39dac200eaef3 Claudiu Beznea    2026-01-16  259  	sama5d4_systemck[4].parent_hw = usbck_hw;
0a39dac200eaef3 Claudiu Beznea    2026-01-16  260  	sama5d4_systemck[5].parent_hw = sama5d4_pmc->pchws[0];
0a39dac200eaef3 Claudiu Beznea    2026-01-16  261  	sama5d4_systemck[6].parent_hw = sama5d4_pmc->pchws[1];
0a39dac200eaef3 Claudiu Beznea    2026-01-16  262  	sama5d4_systemck[7].parent_hw = sama5d4_pmc->pchws[2];
084b696bb509d59 Alexandre Belloni 2018-10-16  263  	for (i = 0; i < ARRAY_SIZE(sama5d4_systemck); i++) {
0a39dac200eaef3 Claudiu Beznea    2026-01-16  264  		hw = at91_clk_register_system(regmap, sama5d4_systemck[i].n, NULL,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  265  					      &AT91_CLK_PD_HW(sama5d4_systemck[i].parent_hw),
68b3b6f1773d2d1 Claudiu Beznea    2022-12-08  266  					      sama5d4_systemck[i].id,
68b3b6f1773d2d1 Claudiu Beznea    2022-12-08  267  					      sama5d4_systemck[i].flags);
084b696bb509d59 Alexandre Belloni 2018-10-16  268  		if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  269  			goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  270  
084b696bb509d59 Alexandre Belloni 2018-10-16  271  		sama5d4_pmc->shws[sama5d4_systemck[i].id] = hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  272  	}
084b696bb509d59 Alexandre Belloni 2018-10-16  273  
084b696bb509d59 Alexandre Belloni 2018-10-16  274  	for (i = 0; i < ARRAY_SIZE(sama5d4_periphck); i++) {
084b696bb509d59 Alexandre Belloni 2018-10-16  275  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
cb4f4949b1c76f2 Alexandre Belloni 2019-04-02  276  							 &sama5d4_pcr_layout,
084b696bb509d59 Alexandre Belloni 2018-10-16  277  							 sama5d4_periphck[i].n,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  278  							 NULL,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  279  							 &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK]),
084b696bb509d59 Alexandre Belloni 2018-10-16  280  							 sama5d4_periphck[i].id,
68b3b6f1773d2d1 Claudiu Beznea    2022-12-08  281  							 &range, INT_MIN,
68b3b6f1773d2d1 Claudiu Beznea    2022-12-08  282  							 sama5d4_periphck[i].flags);
084b696bb509d59 Alexandre Belloni 2018-10-16  283  		if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  284  			goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  285  
084b696bb509d59 Alexandre Belloni 2018-10-16  286  		sama5d4_pmc->phws[sama5d4_periphck[i].id] = hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  287  	}
084b696bb509d59 Alexandre Belloni 2018-10-16  288  
084b696bb509d59 Alexandre Belloni 2018-10-16  289  	for (i = 0; i < ARRAY_SIZE(sama5d4_periph32ck); i++) {
084b696bb509d59 Alexandre Belloni 2018-10-16  290  		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
cb4f4949b1c76f2 Alexandre Belloni 2019-04-02  291  							 &sama5d4_pcr_layout,
084b696bb509d59 Alexandre Belloni 2018-10-16  292  							 sama5d4_periph32ck[i].n,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  293  							 NULL,
0a39dac200eaef3 Claudiu Beznea    2026-01-16  294  							 &AT91_CLK_PD_HW(sama5d4_pmc->chws[PMC_MCK2]),
084b696bb509d59 Alexandre Belloni 2018-10-16  295  							 sama5d4_periph32ck[i].id,
68b3b6f1773d2d1 Claudiu Beznea    2022-12-08  296  							 &range, INT_MIN, 0);
084b696bb509d59 Alexandre Belloni 2018-10-16  297  		if (IS_ERR(hw))
084b696bb509d59 Alexandre Belloni 2018-10-16  298  			goto err_free;
084b696bb509d59 Alexandre Belloni 2018-10-16  299  
084b696bb509d59 Alexandre Belloni 2018-10-16  300  		sama5d4_pmc->phws[sama5d4_periph32ck[i].id] = hw;
084b696bb509d59 Alexandre Belloni 2018-10-16  301  	}
084b696bb509d59 Alexandre Belloni 2018-10-16  302  
084b696bb509d59 Alexandre Belloni 2018-10-16  303  	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama5d4_pmc);
084b696bb509d59 Alexandre Belloni 2018-10-16  304  
084b696bb509d59 Alexandre Belloni 2018-10-16  305  	return;
084b696bb509d59 Alexandre Belloni 2018-10-16  306  
084b696bb509d59 Alexandre Belloni 2018-10-16  307  err_free:
7425f246f725e51 Michał Mirosław   2020-05-05  308  	kfree(sama5d4_pmc);
084b696bb509d59 Alexandre Belloni 2018-10-16  309  }
428d97e18594bc2 Tudor Ambarus     2021-02-03  310  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

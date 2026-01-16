Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C3932C92B;
	Fri, 16 Jan 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768564625; cv=none; b=goAgwTd23bHdX861y1Qyn29lXpz5DWCH3i+wKK/KCYV9SCtltTY44/Ebc6jLMhNYvkBAFvUdtNuEeEyZLBozbP5sFPBn0dyd1wPR1CIFHQlcQ0sJnY/2s1rGJcr84JzCVMPrpUrtrAM6oqf9tvsBKT2bpjV34CSFMYzTm4gfJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768564625; c=relaxed/simple;
	bh=1GlgSbn/pQ5C9Qm6aV11sSWl3mVMardfOsZ+NnSUPVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFDe4Qf9Qli3HSuMCpr2NUkJgiEEardog6xKaLhg5d82mszMpKEnteI9bnVKx80s6rxdaqPC4msCYSLbP+NCXn5gUlYsxBksc1rQAQXFYpGT72mQOVs5LxnSWRKZWb+FBy2gdeRV0J99vs/KphW5SOTS6CJwZthLg87AteKklVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REBy+/5G; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REBy+/5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768564622; x=1800100622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1GlgSbn/pQ5C9Qm6aV11sSWl3mVMardfOsZ+NnSUPVo=;
  b=REBy+/5GN43EzFgXh00kVuTPczDxDJJFO/Qte1xGQqz6i2A+Clz5ugQS
   yteQLk0X4QqOFzuWL2AQ6ff9BhAEGvlZ8jONBgaMjDIL1n1GeLtzCnDnP
   76DU3yPJ9oPmsVwuD8aKZKVyv53da7SAHjRJnwq4cSlzl2oCbRjCvKNik
   Xy/sXZ0Rr32vuBLVP3Ny5BnI+xOK/9NBjTAeAs3bGN49sknCIfCVgd0dW
   pvUY+ySoWepdDZC9x3WHHzgs6BjMdBXR7VqNl1sOQjEdl1vt5GLa3DFo/
   PDYiFk1KJ37j0BHnpvjZKx3k/oHwpRM0xcLjwWo1QPhFE024lvWCjRB+q
   g==;
X-CSE-ConnectionGUID: lfW5MgXaRoWfP6dkVNfDOg==
X-CSE-MsgGUID: SCZKPXB8TnuYKwwu18zihw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80182886"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="80182886"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 03:57:01 -0800
X-CSE-ConnectionGUID: vw4YWlMnRGO/n9dWQLrVig==
X-CSE-MsgGUID: grzFcJIMQfWluXvmgN3lkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="236487248"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jan 2026 03:56:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgiRi-00000000Kns-3yzE;
	Fri, 16 Jan 2026 11:56:54 +0000
Date: Fri, 16 Jan 2026 19:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org,
	mpe@kernel.org, mpe@oss.tenstorrent.com,
	npiggin@oss.tenstorrent.com, agross@kernel.org,
	agross@oss.tenstorrent.com
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <202601161951.u4TyUnmn-lkp@intel.com>
References: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>

Hi Anirudh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Anirudh-Srinivasan/dt-bindings-soc-tenstorrent-Add-tenstorrent-atlantis-syscon/20260116-074618
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20260115-atlantis-clocks-v1-3-7356e671f28b%40oss.tenstorrent.com
patch subject: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
config: s390-randconfig-r132-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161951.u4TyUnmn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161951.u4TyUnmn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161951.u4TyUnmn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/tenstorrent/atlantis-ccu.c: In function 'atlantis_ccu_clocks_register':
>> drivers/clk/tenstorrent/atlantis-ccu.c:744:4: error: a label can only be part of a statement and a declaration is not a statement
     744 |    struct atlantis_clk_mux *mux =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:783:4: error: a label can only be part of a statement and a declaration is not a statement
     783 |    struct atlantis_clk_divider *div =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:801:4: error: a label can only be part of a statement and a declaration is not a statement
     801 |    struct atlantis_clk_gate *gate =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:818:4: error: a label can only be part of a statement and a declaration is not a statement
     818 |    struct atlantis_clk_fixed_factor *factor =
         |    ^~~~~~
   drivers/clk/tenstorrent/atlantis-ccu.c:840:4: error: a label can only be part of a statement and a declaration is not a statement
     840 |    struct atlantis_clk_gate_shared *gate_shared =
         |    ^~~~~~


vim +744 drivers/clk/tenstorrent/atlantis-ccu.c

   710	
   711	static int atlantis_ccu_clocks_register(struct device *dev,
   712						struct atlantis_ccu *ccu,
   713						const struct atlantis_ccu_data *data)
   714	{
   715		struct regmap *regmap = ccu->regmap;
   716		struct clk_hw_onecell_data *clk_data;
   717		int i, ret;
   718		size_t num_clks = data->num;
   719	
   720		clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
   721					GFP_KERNEL);
   722		if (!clk_data)
   723			return -ENOMEM;
   724	
   725		ccu->clk_data = clk_data;
   726	
   727		for (i = 0; i < data->num; i++) {
   728			struct clk_hw *hw = data->hws[i];
   729			const char *name = hw->init->name;
   730			struct atlantis_clk_common *common =
   731				hw_to_atlantis_clk_common(hw);
   732			common->regmap = regmap;
   733	
   734			/* Fixup missing handle to parent for gates/muxes/dividers */
   735			if (hw->init->parent_hws && hw->init->num_parents == 1) {
   736				const struct atlantis_clk_common *parent =
   737					hw_to_atlantis_clk_common(
   738						hw->init->parent_hws[0]);
   739				hw->init->parent_hws[0] = clk_data->hws[parent->clkid];
   740			}
   741	
   742			switch (common->clk_type) {
   743			case ATLANTIS_CLK_MUX:
 > 744				struct atlantis_clk_mux *mux =
   745					hw_to_atlantis_clk_mux(hw);
   746	
   747				hw = devm_clk_hw_register_mux_parent_data_table(
   748					ccu->dev, name, hw->init->parent_data,
   749					hw->init->num_parents, hw->init->flags,
   750					ccu->base + mux->config.reg_offset,
   751					mux->config.shift, mux->config.width, 0, NULL,
   752					&lock);
   753	
   754				if (IS_ERR(hw)) {
   755					dev_err(dev, "Cannot register clock %d - %s\n",
   756						i, name);
   757					return ret;
   758				}
   759	
   760				if (data == &atlantis_ccu_rcpu_data) {
   761					switch (common->clkid) {
   762					case CLK_RCPU_ROOT:
   763						ret = clk_hw_set_parent(
   764							hw,
   765							clk_data->hws[CLK_RCPU_PLL]);
   766						if (ret)
   767							dev_err(ccu->dev,
   768								"Failed to set RCPU ROOT MUX parent: %d\n",
   769								ret);
   770						break;
   771					case CLK_NOCC_CLK:
   772						ret = clk_hw_set_parent(
   773							hw, clk_data->hws[CLK_NOC_PLL]);
   774						if (ret)
   775							dev_err(ccu->dev,
   776								"Failed to set NOCC Mux parent: %d\n",
   777								ret);
   778						break;
   779					}
   780				}
   781				break;
   782			case ATLANTIS_CLK_DIVIDER:
   783				struct atlantis_clk_divider *div =
   784					hw_to_atlantis_clk_divider(hw);
   785	
   786				hw = devm_clk_hw_register_divider_parent_hw(
   787					ccu->dev, name, common->hw.init->parent_hws[0],
   788					div->common.hw.init->flags,
   789					ccu->base + div->config.reg_offset,
   790					div->config.shift, div->config.width,
   791					div->config.flags, &lock);
   792	
   793				if (IS_ERR(hw)) {
   794					dev_err(dev, "Cannot register clock %d - %s\n",
   795						i, name);
   796					return ret;
   797				}
   798	
   799				break;
   800			case ATLANTIS_CLK_GATE:
   801				struct atlantis_clk_gate *gate =
   802					hw_to_atlantis_clk_gate(hw);
   803	
   804				hw = devm_clk_hw_register_gate_parent_hw(
   805					ccu->dev, name, common->hw.init->parent_hws[0],
   806					hw->init->flags,
   807					ccu->base + gate->config.reg_offset,
   808					ffs(gate->config.enable) - 1, 0, &lock);
   809	
   810				if (IS_ERR(hw)) {
   811					dev_err(dev, "Cannot register clock %d - %s\n",
   812						i, name);
   813					return ret;
   814				}
   815	
   816				break;
   817			case ATLANTIS_CLK_FIXED_FACTOR:
   818				struct atlantis_clk_fixed_factor *factor =
   819					hw_to_atlantis_clk_fixed_factor(hw);
   820	
   821				if (hw->init->parent_data) {
   822					hw = devm_clk_hw_register_fixed_factor_index(
   823						dev, name,
   824						hw->init->parent_data[0].index,
   825						hw->init->flags, factor->config.mult,
   826						factor->config.div);
   827				} else {
   828					hw = devm_clk_hw_register_fixed_factor_parent_hw(
   829						dev, name, hw->init->parent_hws[0],
   830						hw->init->flags, factor->config.mult,
   831						factor->config.div);
   832				}
   833				if (IS_ERR(hw)) {
   834					dev_err(dev, "Cannot register clock %d - %s\n",
   835						i, name);
   836					return ret;
   837				}
   838				break;
   839			case ATLANTIS_CLK_GATE_SHARED:
   840				struct atlantis_clk_gate_shared *gate_shared =
   841					hw_to_atlantis_clk_gate_shared(hw);
   842				gate_shared->config.refcount_lock = &refcount_lock;
   843	
   844				ret = devm_clk_hw_register(dev, hw);
   845	
   846				if (ret) {
   847					dev_err(dev, "Cannot register clock %d - %s\n",
   848						i, name);
   849					return ret;
   850				}
   851	
   852				break;
   853			default:
   854	
   855				ret = devm_clk_hw_register(dev, hw);
   856	
   857				if (ret) {
   858					dev_err(dev, "Cannot register clock %d - %s\n",
   859						i, name);
   860					return ret;
   861				}
   862	
   863				break;
   864			}
   865			clk_data->hws[common->clkid] = hw;
   866		}
   867	
   868		clk_data->num = num_clks;
   869	
   870		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
   871		if (ret)
   872			dev_err(dev, "failed to add clock hardware provider (%d)\n",
   873				ret);
   874	
   875		return ret;
   876	}
   877	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

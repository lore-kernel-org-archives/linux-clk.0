Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1E83537E0;
	Tue, 24 Mar 2026 23:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393652; cv=none; b=aEJ/zaJU3OK0oHGmz7kBWQUPQ6CaHnkB1CKvfEZG5pV3QYntd4e83ga/4GZgzTsVnERiYS9bh7N0a94d+8YwOr8zIt5TOXQDjfKvOlTUCxNrug0BqawvsTyh6U9A0r5ecJcvUWm+ZThn/79zHTzuEgBQxU9k84WQnlAYXvRjlPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393652; c=relaxed/simple;
	bh=Fk4wnbWrvlRCpYY7EBpy23iVhDEFFSBBmhNUHDrnqG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ed5j6OkGRw8KHNHJ8uSC6RxP5dGum19ypDJPEX2KC4yABHAcGtb7BAAXonQT2pCTxOu8rXo0cpg56oJ850cquyGpQIC8Tmqm+ETAXM4x/tlTThUwsaR7p2M/0qpVKCwgaSyst2CIgdhoZZSTC3qI8BmIZqPUuCC5t52WmimDDTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDSKXnum; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDSKXnum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774393651; x=1805929651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fk4wnbWrvlRCpYY7EBpy23iVhDEFFSBBmhNUHDrnqG4=;
  b=aDSKXnumR8zhloF71Id+ISuPShHU6Dz1GIfvMd7DGvb+nnPSxTZjzchu
   pYQvTt7VZFZnm3UJMpJTua5JBEc8alMW040s6PCzXEm4isgV2rpk//lfZ
   ZFn94XPWhagmoJ8DDJH7IqsIkm4JOPz2maPxK9gn0fOg6nXUWf8B0gE9Z
   jDjoVGmye5TqY/4b9B/4P4GyeI+KIGIgSEVh0y7EP7uuDH7sWRqsRvkjC
   Jc7Zq9eVhueDhbb4N5ESaTHpHHnd7iIAc6xnteLj5Vbs4hCDd8K8O93Pm
   EbISxbukq5vLX3wcAOmdP/a/9hSfPoKzrFdKfFddwNKMvFmuulMJj+xjN
   w==;
X-CSE-ConnectionGUID: +Eikmg69SaOmS+4uStbeXA==
X-CSE-MsgGUID: yd1refesTlaNnzCsyOJLyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75618051"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75618051"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 16:07:31 -0700
X-CSE-ConnectionGUID: SrpYwx6GQpubSXWUutx8/A==
X-CSE-MsgGUID: wFIBomXZTwmmjw22K+0L0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224511070"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Mar 2026 16:07:26 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5AqJ-000000005YH-1gIj;
	Tue, 24 Mar 2026 23:07:23 +0000
Date: Wed, 25 Mar 2026 07:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
	afaerber@suse.com, jyanchou@realtek.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: Re: [PATCH v5 09/10] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <202603250636.b3J5aCGL-lkp@intel.com>
References: <20260324025332.3416977-10-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324025332.3416977-10-eleanor.lin@realtek.com>

Hi Yu-Chun,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on robh/for-next linus/master v7.0-rc5 next-20260324]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20260324-171912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260324025332.3416977-10-eleanor.lin%40realtek.com
patch subject: [PATCH v5 09/10] clk: realtek: Add RTD1625-CRT clock controller driver
config: nios2-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603250636.b3J5aCGL-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250636.b3J5aCGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250636.b3J5aCGL-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/clk/realtek/common.o: in function `rtk_clk_probe':
>> drivers/clk/realtek/common.c:54: undefined reference to `rtk_reset_controller_add'
>> drivers/clk/realtek/common.c:54:(.text+0x134): relocation truncated to fit: R_NIOS2_CALL26 against `rtk_reset_controller_add'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RTK_CLK_COMMON
   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_REALTEK [=y] && RESET_CONTROLLER [=n]
   Selected by [y]:
   - COMMON_CLK_RTD1625 [=y] && COMMON_CLK [=y] && COMMON_CLK_REALTEK [=y]


vim +54 drivers/clk/realtek/common.c

105a817ead5cd3 Cheng-Yu Lee 2026-03-24  12  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  13  int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  14  {
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  15  	int i, ret;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  16  	struct regmap *regmap;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  17  	struct device *dev = &pdev->dev;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  18  	struct rtk_reset_initdata reset_initdata = {0};
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  19  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  20  	regmap = device_node_to_regmap(pdev->dev.of_node);
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  21  	if (IS_ERR(regmap))
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  22  		return dev_err_probe(dev, PTR_ERR(regmap), "failed to get regmap\n");
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  23  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  24  	for (i = 0; i < desc->num_clks; i++)
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  25  		desc->clks[i]->regmap = regmap;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  26  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  27  	for (i = 0; i < desc->clk_data->num; i++) {
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  28  		struct clk_hw *hw = desc->clk_data->hws[i];
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  29  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  30  		if (!hw)
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  31  			continue;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  32  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  33  		ret = devm_clk_hw_register(dev, hw);
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  34  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  35  		if (ret) {
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  36  			dev_warn(dev, "failed to register hw of clk%d: %d\n", i,
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  37  				 ret);
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  38  			desc->clk_data->hws[i] = NULL;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  39  		}
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  40  	}
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  41  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  42  	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  43  					  desc->clk_data);
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  44  	if (ret)
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  45  		return dev_err_probe(dev, ret, "failed to add clock provider\n");
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  46  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  47  	if (!desc->num_reset_descs)
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  48  		return 0;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  49  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  50  	reset_initdata.regmap = regmap;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  51  	reset_initdata.num_descs = desc->num_reset_descs;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  52  	reset_initdata.descs = desc->reset_descs;
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  53  
105a817ead5cd3 Cheng-Yu Lee 2026-03-24 @54  	return rtk_reset_controller_add(dev, &reset_initdata);
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  55  }
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  56  EXPORT_SYMBOL_GPL(rtk_clk_probe);
105a817ead5cd3 Cheng-Yu Lee 2026-03-24  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

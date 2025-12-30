Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B023E2253A0;
	Tue, 30 Dec 2025 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117890; cv=none; b=Kf3+LSfPKLBG4VyuuA2ciAmLq5cMTnDIN8/tMJyGUyj+a/Y3vLjuHV06Lx0dIki/CXsPLVjURvP+reT8UV6nUUfLMZQ/RFd141ObojC6/OuiWAwyId/RKDpXfTDEEFmzTIqPy+hcQXdcX2xtM+lBsqulYtlsEaMOHZuqJNsWq5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117890; c=relaxed/simple;
	bh=femHz0CPADDJuwSSUbqa9MTD6FCPDtNEfk7uOnIXIIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMAlWKKzG6cF78IrvpM0+f+5tF0h9S2lNVt5CaOciV9VvVT2/pyq4zNOcPDMGPtdZGRAPl1VNdP2sQvAIm5pVSK3xLO+DpSzoipdqwibpvRhxbL1pAU2CYLmy15YPRy0LsO6mx/j1YPGK1ogvhU8NVfau8LpFSW9ZFDYSt0e0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwN/UDcs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwN/UDcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767117889; x=1798653889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=femHz0CPADDJuwSSUbqa9MTD6FCPDtNEfk7uOnIXIIk=;
  b=lwN/UDcsIopMeVG6WSD3pMCl07o7yjp4TXSbpvUR5dJvjB69GeZQrJPD
   bAnRkd2JZYwpdg6UAXiiW7avblbH7eBAgXBu02vggSDKEdoWqZ8L7cnOk
   POvuwbJr9OPYPgrXRTDHxQDRIpaZpczVwPHDxbuWQ6CI9avT3hp+E/Qui
   JQAFSTcOQD86HXwaYDjc+UI/ZVM9BqK4QxASMFPv4ft3Zqk9NE6ZvqGea
   T7n8wczYLcJj4FZLk57IHgHfysOreRIgCWNtTzXbnr2hpUfasBZpqvvUD
   4FSe56wKL7MjfS0ClfVu2ZuS/zigSUW7IYY9S+KTzMgaXSCWD9zmWC/jj
   Q==;
X-CSE-ConnectionGUID: cO1Mb+IKSmWjNG/DReYXNw==
X-CSE-MsgGUID: m6vMEs6dRLK6TCqbBfkdlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79827240"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="79827240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 10:04:49 -0800
X-CSE-ConnectionGUID: ruEmPDTXST6gMPKcLXbXng==
X-CSE-MsgGUID: /4Nwu/kjS5WUlaVpSWHB1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="200482399"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Dec 2025 10:04:45 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vae5K-000000000b7-0jqz;
	Tue, 30 Dec 2025 18:04:42 +0000
Date: Wed, 31 Dec 2025 02:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
	jyanchou@realtek.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.tai@realtek.com, cy.huang@realtek.com,
	stanley_chang@realtek.com, eleanor.lin@realtek.com
Subject: Re: [PATCH 3/9] clk: realtek: Introduce a common probe()
Message-ID: <202512310112.MJuwgWEO-lkp@intel.com>
References: <20251229075313.27254-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-4-eleanor.lin@realtek.com>

Hi Yu-Chun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20251229-155549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251229075313.27254-4-eleanor.lin%40realtek.com
patch subject: [PATCH 3/9] clk: realtek: Introduce a common probe()
config: i386-buildonly-randconfig-001-20251230 (https://download.01.org/0day-ci/archive/20251231/202512310112.MJuwgWEO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310112.MJuwgWEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310112.MJuwgWEO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/clk/realtek/common.c:7:
   drivers/clk/realtek/common.c: In function 'rtk_clk_probe':
>> drivers/clk/realtek/common.c:58:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      58 |                         "Missing reset banks data though num_reset_banks is %lu\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/clk/realtek/common.c:57:17: note: in expansion of macro 'dev_err'
      57 |                 dev_err(dev,
         |                 ^~~~~~~
   drivers/clk/realtek/common.c:58:79: note: format string is defined here
      58 |                         "Missing reset banks data though num_reset_banks is %lu\n",
         |                                                                             ~~^
         |                                                                               |
         |                                                                               long unsigned int
         |                                                                             %u


vim +58 drivers/clk/realtek/common.c

    12	
    13	int rtk_clk_probe(struct platform_device *pdev, const struct rtk_clk_desc *desc)
    14	{
    15		int i, ret;
    16		struct device *dev = &pdev->dev;
    17		struct rtk_reset_initdata reset_initdata = { 0 };
    18	
    19		struct regmap *regmap = device_node_to_regmap(pdev->dev.of_node);
    20	
    21		if (IS_ERR(regmap)) {
    22			ret = PTR_ERR(regmap);
    23			dev_err(dev, "Failed to get regmap: %d\n", ret);
    24			return ret;
    25		}
    26	
    27		for (i = 0; i < desc->num_clks; i++)
    28			desc->clks[i]->regmap = regmap;
    29	
    30		for (i = 0; i < desc->clk_data->num; i++) {
    31			struct clk_hw *hw = desc->clk_data->hws[i];
    32	
    33			if (!hw)
    34				continue;
    35	
    36			ret = devm_clk_hw_register(dev, hw);
    37	
    38			if (ret) {
    39				dev_warn(dev, "failed to register hw of clk%d: %d\n", i,
    40					 ret);
    41				desc->clk_data->hws[i] = NULL;
    42			}
    43		}
    44	
    45		ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
    46						  desc->clk_data);
    47	
    48		if (ret) {
    49			dev_err(dev, "Failed to add clock provider\n");
    50			return ret;
    51		}
    52	
    53		if (!desc->num_reset_banks)
    54			return 0;
    55	
    56		if (!desc->reset_banks) {
    57			dev_err(dev,
  > 58				"Missing reset banks data though num_reset_banks is %lu\n",
    59				desc->num_reset_banks);
    60			return -EINVAL;
    61		}
    62	
    63		reset_initdata.regmap = regmap;
    64		reset_initdata.num_banks = desc->num_reset_banks;
    65		reset_initdata.banks = desc->reset_banks;
    66	
    67		return rtk_reset_controller_add(dev, &reset_initdata);
    68	}
    69	EXPORT_SYMBOL_GPL(rtk_clk_probe);
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

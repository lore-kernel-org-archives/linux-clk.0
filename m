Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6642D5C8E;
	Wed, 21 Jan 2026 00:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768956859; cv=none; b=kyZq2DmBvz+v3rHDllueMKbMluTxoqE/E5HAGnuNNMUfrZVcjZEybueYAMNVUj2aLwKuMy808IYDWk7SElj/iQhqn8GLBCMdIi06+RY9j9gj+LFA+u83ofquRP5tiqD4l08NZiW0tIn2jnu5F83NG3KABbSm2+6zwuAXb4yVbEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768956859; c=relaxed/simple;
	bh=9pWCVK3QXu7/JDN+Rupb0lJCx+tff8zsyZ4UxoK5qvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgCv0wjVHXezVwjnFBJ6yQnZebLm3IHhHZFZbN0rGRxvI+VBK8h4Zf/ww5qbtGpT/bgyvOY7JOkj8SyVBiEE6Tq1J3WCpGfgNdiw6gZ23jDD9nBvhnx9alXc61SHN2EEhMMF6EWJJu2cBbDKo/J1KPB9lLKOY3sSKep75iEcVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+NDeE4p; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+NDeE4p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768956858; x=1800492858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pWCVK3QXu7/JDN+Rupb0lJCx+tff8zsyZ4UxoK5qvc=;
  b=d+NDeE4pyO+YW4QhJZfW6MC9+01NPlrllgufYQ6obmVJisG5y3FV/0Ro
   4xIzvsidUtRROUbKmH1bXSymGqAb7oC9C08nLfQ5OLd6J8Dj40/wbcXmo
   wGzzz5sOF0m+GUlepCdZkRCj8msvM0K4Sc4PG4f0y6uO2GCJarknQewGN
   6YEpvI5Y64BI8I5HaoWvO4RYiYeeI/66YFullq0dmHmqwP8DTMAeNMnCM
   AthDQjaR8unoB/7a37xE/emMOoJIIjixn5pZbW332MqPuEFhTZOFyxKMR
   aaHWjDmmyIJl8FoQUaF1k5GOP96MsKuKZTrEMmeWHriU9Wd/QmM61psAA
   Q==;
X-CSE-ConnectionGUID: wlJwax5YRKmQRhVbS2ZArw==
X-CSE-MsgGUID: VNHYl46qRhORrJNsm/TU+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70083913"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70083913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 16:54:18 -0800
X-CSE-ConnectionGUID: T6pXfileQh2Hvencj4ZGnw==
X-CSE-MsgGUID: lutOVu1WRGa0QJvh1JHUjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="236942667"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 16:54:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viMU7-00000000Pmx-2Jwl;
	Wed, 21 Jan 2026 00:54:11 +0000
Date: Wed, 21 Jan 2026 08:53:51 +0800
From: kernel test robot <lkp@intel.com>
To: Nadi Ke <kanadenady@gmail.com>, sboyd@kernel.org,
	mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nadi Ke <kanadenady@gmail.com>
Subject: Re: [PATCH v1 2/2] clk: sprd: Add SC9832E clock driver
Message-ID: <202601210710.tDbyuXMU-lkp@intel.com>
References: <20260120144436.233998-3-kanadenady@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120144436.233998-3-kanadenady@gmail.com>

Hi Nadi,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.19-rc6 next-20260120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nadi-Ke/dt-bindings-clock-sprd-Add-SC9832E-clock-controller/20260121-001334
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260120144436.233998-3-kanadenady%40gmail.com
patch subject: [PATCH v1 2/2] clk: sprd: Add SC9832E clock driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601210710.tDbyuXMU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601210710.tDbyuXMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210710.tDbyuXMU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/sprd/sc9832e-clk.c:1041:24: error: use of undeclared identifier 'sc9832e_clk_ids'; did you mean 'sc9832e_pll_hws'?
    1041 |         match = of_match_node(sc9832e_clk_ids, pdev->dev.of_node);
         |                               ^~~~~~~~~~~~~~~
         |                               sc9832e_pll_hws
   drivers/clk/sprd/sc9832e-clk.c:162:35: note: 'sc9832e_pll_hws' declared here
     162 | static struct clk_hw_onecell_data sc9832e_pll_hws = {
         |                                   ^
>> drivers/clk/sprd/sc9832e-clk.c:1041:24: error: passing 'struct clk_hw_onecell_data' to parameter of incompatible type 'const struct of_device_id *'
    1041 |         match = of_match_node(sc9832e_clk_ids, pdev->dev.of_node);
         |                               ^~~~~~~~~~~~~~~
   include/linux/of.h:379:29: note: passing argument to parameter 'matches' here
     379 |         const struct of_device_id *matches, const struct device_node *node);
         |                                    ^
   drivers/clk/sprd/sc9832e-clk.c:1058:21: error: use of undeclared identifier 'sc9832e_clk_ids'; did you mean 'sc9832e_pll_hws'?
    1058 |                 .of_match_table = sc9832e_clk_ids,
         |                                   ^~~~~~~~~~~~~~~
         |                                   sc9832e_pll_hws
   drivers/clk/sprd/sc9832e-clk.c:162:35: note: 'sc9832e_pll_hws' declared here
     162 | static struct clk_hw_onecell_data sc9832e_pll_hws = {
         |                                   ^
   drivers/clk/sprd/sc9832e-clk.c:1058:21: error: initializing 'const struct of_device_id *' with an expression of incompatible type 'struct clk_hw_onecell_data'
    1058 |                 .of_match_table = sc9832e_clk_ids,
         |                                   ^~~~~~~~~~~~~~~
   4 errors generated.


vim +1041 drivers/clk/sprd/sc9832e-clk.c

  1034	
  1035	static int sc9832e_clk_probe(struct platform_device *pdev)
  1036	{
  1037		const struct of_device_id *match;
  1038		const struct sprd_clk_desc *desc;
  1039		int ret;
  1040	
> 1041		match = of_match_node(sc9832e_clk_ids, pdev->dev.of_node);
  1042		if (!match)
  1043			return -ENODEV;
  1044	
  1045		desc = match->data;
  1046	
  1047		ret = sprd_clk_regmap_init(pdev, desc);
  1048		if (ret)
  1049			return ret;
  1050	
  1051		return sprd_clk_probe(&pdev->dev, desc->hw_clks);
  1052	}
  1053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

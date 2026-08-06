Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49832314B72;
	Thu,  6 Aug 2026 13:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021382; cv=none; b=G1/e+P2x9EqM6+8wu1LysoaVGO0l0n1kS0h3iPFjxPD86kRIoECnpMa4b+6mGKqcNYP3bY5KLTlG1lvQ3ElIhbWdzPpgXxDYFdNEe955HUlINUAUEqTYrejuEO6Mjsa0Y+mZjjaBUSKQz/wUAoZlA2tRNroPSZor65I1L9L43yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021382; c=relaxed/simple;
	bh=hYrDjwLvku5ojxnuYUcL4exJBEemvK5kPuchBihDAsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImToNPnoiH9NF3/aed9sNwubULx38nCc6M+4ggf9LA/4HisiabscqWZ0wF2ARBbvv/5VcbFKuDtuQH9TJbdT3LFVsG6MMcxgSYCIsxlLKakHgXkq20Y+5lOgOPS1B4lX7uzmLEzfROzrTCPOnTpov3lQDPsKIyM6aATyh2J6t3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk+IH3VC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk+IH3VC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786021380; x=1817557380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hYrDjwLvku5ojxnuYUcL4exJBEemvK5kPuchBihDAsA=;
  b=Nk+IH3VCB6zBZB0VIQnM/Fj9L63yxbgqtjo77NXSuoQR8aGsvV7wTPP0
   aHTmKp/qw7nw/DDs0eHUmFkoIJU0DJMgrLL6ya85v6RVgqS5+2XXA6YzR
   3vrU7pPDOYBdUmS/lxinSnDc1mn99ZfEYz58loj6DKVehQIMvOwvD4QcB
   bzWmL/SQu8wOXCVvQENqXEWWfFCAxdJZ1KcmdieW2DhnlAFcMg/IWBh7O
   i9jFak22JxAgNM4B0VRfFgiVPERyNK90KJgxPmJqjuGqj0Tubi0nDgHeH
   nRH5SDsvS4NmhstG4kzKLP7WjTZMui2IWovRGs49L/A91r2uI7ol5E609
   Q==;
X-CSE-ConnectionGUID: 0qc2FoNGTGyyRXgSGarbrg==
X-CSE-MsgGUID: 0mixByz4RDK7AcBInrpu7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86557025"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86557025"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:02:59 -0700
X-CSE-ConnectionGUID: KgO1AvBZRVaZfc1qBgY8aA==
X-CSE-MsgGUID: TVod3CvVQr+UPuOI1r6eLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260837214"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Aug 2026 06:02:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrxkE-00000000FAj-1p8p;
	Thu, 06 Aug 2026 13:02:46 +0000
Date: Thu, 6 Aug 2026 21:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: fix memory leak on module removal
Message-ID: <202608062020.IFIwVdEc-lkp@intel.com>
References: <20260629142348.273766-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629142348.273766-1-akkun11.open@gmail.com>

Hi Akari,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v7.2-rc6 next-20260805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akari-Tsuyukusa/clk-mediatek-fix-memory-leak-on-module-removal/20260805-032732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260629142348.273766-1-akkun11.open%40gmail.com
patch subject: [PATCH] clk: mediatek: fix memory leak on module removal
config: sparc-randconfig-001-20260806 (https://download.01.org/0day-ci/archive/20260806/202608062020.IFIwVdEc-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608062020.IFIwVdEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608062020.IFIwVdEc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/mediatek/clk-mt8173-infracfg.c: In function 'clk_mt8173_infracfg_probe':
>> drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: 'clk_data' undeclared (first use in this function); did you mean 'clk_gate'?
     131 |         platform_set_drvdata(pdev, clk_data);
         |                                    ^~~~~~~~
         |                                    clk_gate
   drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: note: each undeclared identifier is reported only once for each function it appears in


vim +131 drivers/clk/mediatek/clk-mt8173-infracfg.c

    78	
    79	static void clk_mt8173_infra_init_early(struct device_node *node)
    80	{
    81		int i;
    82	
    83		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
    84		if (!infra_clk_data)
    85			return;
    86	
    87		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
    88			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
    89	
    90		mtk_clk_register_factors(infra_early_divs,
    91					 ARRAY_SIZE(infra_early_divs), infra_clk_data);
    92	
    93		of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
    94	}
    95	CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
    96			      clk_mt8173_infra_init_early);
    97	
    98	static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
    99	{
   100		struct device_node *node = pdev->dev.of_node;
   101		int r, i;
   102	
   103		if (!infra_clk_data) {
   104			infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
   105			if (!infra_clk_data)
   106				return -ENOMEM;
   107		} else {
   108			for (i = 0; i < CLK_INFRA_NR_CLK; i++)
   109				if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
   110					infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
   111		}
   112	
   113		r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
   114					   ARRAY_SIZE(infra_gates), infra_clk_data);
   115		if (r)
   116			return r;
   117	
   118		r = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
   119					      ARRAY_SIZE(cpu_muxes), infra_clk_data);
   120		if (r)
   121			goto unregister_gates;
   122	
   123		r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
   124		if (r)
   125			goto unregister_cpumuxes;
   126	
   127		r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
   128		if (r)
   129			goto unregister_clk_hw;
   130	
 > 131		platform_set_drvdata(pdev, clk_data);
   132		return 0;
   133	
   134	unregister_clk_hw:
   135		of_clk_del_provider(node);
   136	unregister_cpumuxes:
   137		mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), infra_clk_data);
   138	unregister_gates:
   139		mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), infra_clk_data);
   140		return r;
   141	}
   142	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

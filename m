Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D013BAE4;
	Sat, 14 Sep 2024 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726350988; cv=none; b=sDNfdGu2glIX7OJAsx9BUFPV2xihwtXNtBAFh8Vaa8FFl/ctPwhnu1wt+la/TP9pLfe7jLEZshEAwmKhCX2ms/x9s3gfXMxzX7eAxFEcUqMSo7wGbD8dMyFxgHwwX09ui3Qv2T7+zcn2i30I42XqMYhGrUC4ciKWLWJw1GzHzy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726350988; c=relaxed/simple;
	bh=HONKP6meiWzmmstQSCCpRW26Os2viDXcDHatYCQHqUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jh5eIRn3B3t/Bdz2c288VhHXWnmRGasM0GOA9tc2EURvrXVex6+W224yIr6bifxTG1MyJEmjmISzJf6PaTNFNEFABulrf1biICrU2/9jbW8jxSER2x3Sa2szJ5WnaN462MjIclRsbQrZsaBDMoWQWqruvpBqSkqeBoU8Xywkjfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYGvtrDz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYGvtrDz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726350986; x=1757886986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HONKP6meiWzmmstQSCCpRW26Os2viDXcDHatYCQHqUA=;
  b=gYGvtrDzu9Hdh7D6NEyTdAhRRdRoDpusTKNEm29cTsnv+A0xyArDSug3
   rNiaictPLnbv1ayDBbnYm2exBpgxtHsoR9D8cKvXm9L3kRqF43/l/E5m/
   ORymBI5dYsKPH5esHCOrO9aTHaAnbgjbBopIe1adCg66w5xXZTULAiC3D
   iG82WrX3y5cVCjSB8ml0ELRfTj7cN8iWnYD1BIOTEYY7JSnZmGOJEFUdS
   u0JGfEtggvhbm0CIHGr1KPepQUhYGLrGDN+DtjYNjmviLl97jYr1rz941
   CsFIuK/sG2IqBdqfzXD0VquyH3wh0TQeE5wINmsCL0/exN3TQaZ4pC+Pm
   A==;
X-CSE-ConnectionGUID: BO/ubuFZRPu0kxpvxQ9rsw==
X-CSE-MsgGUID: DqGwdjInTVSAOMH8d7skTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25102542"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25102542"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 14:56:25 -0700
X-CSE-ConnectionGUID: oQhkDjMORsWVs6ZybRMHvQ==
X-CSE-MsgGUID: KJj93yJAT3aGsFj54wp6ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="73237146"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Sep 2024 14:56:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spakc-0008Aa-1W;
	Sat, 14 Sep 2024 21:56:18 +0000
Date: Sun, 15 Sep 2024 05:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, huangtao@rock-chips.com,
	andy.yan@rock-chips.com, Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>, Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: Re: [PATCH v10 4/5] clk: rockchip: implement linked gate clock
 support
Message-ID: <202409150520.vkJNLGY9-lkp@intel.com>
References: <20240913184720.57381-5-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913184720.57381-5-sebastian.reichel@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on clk/clk-next next-20240913]
[cannot apply to linus/master v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/clk-rockchip-support-clocks-registered-late/20240914-024907
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240913184720.57381-5-sebastian.reichel%40collabora.com
patch subject: [PATCH v10 4/5] clk: rockchip: implement linked gate clock support
config: arm64-randconfig-r123-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150520.vkJNLGY9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240915/202409150520.vkJNLGY9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150520.vkJNLGY9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/rockchip/gate-link.c:72:24: sparse: sparse: symbol 'rk_clk_gate_link_driver' was not declared. Should it be static?

vim +/rk_clk_gate_link_driver +72 drivers/clk/rockchip/gate-link.c

    71	
  > 72	struct platform_driver rk_clk_gate_link_driver = {
    73		.probe		= rk_clk_gate_link_probe,
    74		.driver		= {
    75			.name	= "rockchip-gate-link-clk",
    76			.pm = &rk_clk_gate_link_pm_ops,
    77			.suppress_bind_attrs = true,
    78		},
    79	};
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

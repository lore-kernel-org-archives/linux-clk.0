Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFCB2D1F64;
	Tue, 31 Mar 2026 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993490; cv=none; b=ujNo+Au9t3AJzVmTt5F1w7OBz80/1aoSLrMW8Lmvm3+zQ11jHr3jcvuqMCZOAABlVEJzCE48kSHk/7MlT0EEIcevLVjwGuHSPVFOQXHFfD3jVAgww1YrkDmvS4gDqPCaNnJ6Rq+QT+ljEfPqRPh6rC1eLrQ6Vrs24UcjzUtbDZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993490; c=relaxed/simple;
	bh=zN6GYbagqAYr2qAqSuqrWYaEmoWrx6tHAdofzApd9FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFMcF1el3fTajl5L33g02VGYPIps3Jrw5lppZG1aW3nqYeswLEwCzCpsSKmPjQhksSgqhzGvx2QojtHeOVuZrdj5cBA2/FGjycZE36xvxBg/bBi5I8DAuRa8+oSgYpkSBIr3/u8bLbmsC/iGfeZNyY6lNoxrtgC3j18xoMLaidk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlvMJo/T; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlvMJo/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774993488; x=1806529488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zN6GYbagqAYr2qAqSuqrWYaEmoWrx6tHAdofzApd9FE=;
  b=GlvMJo/TfZ0ClzHvlkp6qXYNN5dN5cO/8+d3i0dzrfkpP9EO5OKR0jXz
   /KDcwbeBdngEXB466JBL2f3b2sDEcrDCdFBY4JnPWAaBCzI5edZdciZvQ
   kDTaBnvhbVjLxqIgNgBu25feV7sB4eDWsI/avBrkOWAuw76EWk/et3jGj
   SKE1dRo2UI2aWnZeIek3wgGeI1Xyq2CeTF+7TYQpctZc9zYJAS89Fr2nu
   eejpAOj4QjOlu62Ta/Kf6YBczFcRwOc1XA0MLyP5ANHsXUtT00dlmYuGZ
   yK0rQSDHD0OfVA5hDdcovFW2JgxL4JcGJopZ6oSuc0VYEWEcXmg0cZ6MY
   A==;
X-CSE-ConnectionGUID: zGc0OdvXQmm3cpG7GjST3A==
X-CSE-MsgGUID: BEaSJMtbSYyh1M++49QVXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86719915"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="86719915"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 14:44:48 -0700
X-CSE-ConnectionGUID: Xk77XjqhQceVh2I0SH4A6g==
X-CSE-MsgGUID: w9KlcQYcQAWwjaiVTKtaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="222089295"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Mar 2026 14:44:47 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7gtA-000000004K5-0ymW;
	Tue, 31 Mar 2026 21:44:44 +0000
Date: Wed, 1 Apr 2026 05:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
Message-ID: <202604010519.tShwh1pt-lkp@intel.com>
References: <20260330210217.11168-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330210217.11168-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/clk-hisilicon-clkdivider-hi6220-use-kzalloc_flex/20260331-195943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260330210217.11168-1-rosenp%40gmail.com
patch subject: [PATCHv2] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
config: arm64-randconfig-002-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010519.tShwh1pt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010519.tShwh1pt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010519.tShwh1pt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/hisilicon/clkdivider-hi6220.c:39 struct member 'table' not described in 'hi6220_clk_divider'
>> Warning: drivers/clk/hisilicon/clkdivider-hi6220.c:39 struct member 'table' not described in 'hi6220_clk_divider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

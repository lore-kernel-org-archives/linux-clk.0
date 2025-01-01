Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4BF2E62B;
	Wed,  1 Jan 2025 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735721547; cv=none; b=tN6gxyk4yqDWmlN0NJTEpbHCrHh2yYTG2b47oW5wJgLLYKKxLo/kC7dyLUbkznlxzXRuNGLNLPFsUOhVl+80Jr+QiIval39QJOm+cFUsXsvggvrBEPby05Is9VfC5nzAv15NxxwYPvSg+ecLzo8hC9737tlWigJ/hfYGLCVRTZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735721547; c=relaxed/simple;
	bh=KNs/VmlZrBNy+SxjTAeclhV0yPPmJLGdpnQz8sDLqU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3p7PolMWaL9ViV/QJ1yNNEjh6TECqAfOPc9bHZh3XimyxDZ3Vxq2tzN43BppNsrKNLH3rr600558wGmQ90Gu3K40xRhaU8RSpcc/kk2CyPVTG6MpsEr8N7T7Rp6hR0wfPnKA7RaoVC6mqrj4EjhFpsX/beBDqEVkmU2ZQkJ1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZ0bUilD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZ0bUilD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735721544; x=1767257544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KNs/VmlZrBNy+SxjTAeclhV0yPPmJLGdpnQz8sDLqU8=;
  b=LZ0bUilDF9gOr7/2wdiIufKprOwZlpCkQsFbyv+Den/EgD8Nmn0qhlaH
   yiBSSCt9de/FdpaV9OoDMZxRc3Z5EoP2QRXvBaI/0XkWOMLSwAZG0MOGv
   xmpG4HJ2CjHoWPKzFNGGEBhO8bXw7WWPbxnRLYr3Pv5UTR0FOHKP1J/kj
   c3yezKqCmH4178O5cUOOvftQBZXIVL1TzzocNUVD2y6S6UKeVSVs0HXHR
   VrfDt8v2y/HaQC3Si+J/2h+GWFT2oMYrFGa/VDusuA9HNUvmepBvl3c7R
   NiI/ZQ4qTEcxES1EfSZ65VmYABhADVNtPIV5WfVGV/jMhQ53hsa5hzouJ
   g==;
X-CSE-ConnectionGUID: ly7Q7VpuTtmzB1r9XjC3LA==
X-CSE-MsgGUID: 09kbM6AWT6e8zmsIXrFAoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47339210"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="47339210"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 00:52:24 -0800
X-CSE-ConnectionGUID: dMs57LHbTDO6IbH/IFjm6A==
X-CSE-MsgGUID: eHyBvkm6RgOxvJrve0dvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124497082"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jan 2025 00:52:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSuSh-0007jH-1o;
	Wed, 01 Jan 2025 08:52:19 +0000
Date: Wed, 1 Jan 2025 16:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Handrigan <paulha@opensource.cirrus.com>,
	linux-clk@vger.kernel.org, sboyd@kernel.org,
	mturquette@baylibre.com, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, patches@opensource.cirrus.com,
	Paul Handrigan <paulha@opensource.cirrus.com>
Subject: Re: [PATCH v4 2/2] clk: cs2600: Add Fractional-N clock driver
Message-ID: <202501011656.Td8LworZ-lkp@intel.com>
References: <20241230221246.3927158-3-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230221246.3927158-3-paulha@opensource.cirrus.com>

Hi Paul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Handrigan/dt-binding-clock-cs2600-Add-support-for-the-CS2600/20241231-061424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241230221246.3927158-3-paulha%40opensource.cirrus.com
patch subject: [PATCH v4 2/2] clk: cs2600: Add Fractional-N clock driver
config: um-randconfig-r061-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011656.Td8LworZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501011656.Td8LworZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/clk/clk-cs2600.c:300:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
   drivers/clk/clk-cs2600.c:272:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.

vim +300 drivers/clk/clk-cs2600.c

   277	
   278	static int cs2600_set_multi_ratio(struct cs2600 *cs2600, unsigned long rate,
   279					  unsigned long parent_rate,
   280					  unsigned int *ratio)
   281	{
   282		struct regmap *regmap = cs2600->regmap;
   283		u64 product = (u64)rate;
   284	
   285		if ((rate / parent_rate) > CS2600_PLL_MULTIPLY_MAX) {
   286			dev_err(cs2600->dev, "Ratio is too large %lu\n",
   287				rate / parent_rate);
   288			return -EINVAL;
   289		}
   290	
   291		if ((rate / parent_rate) > CS2600_HI_RES_MAX) {
   292			regmap_clear_bits(regmap, CS2600_PLL_CFG3, CS2600_RATIO_CFG);
   293			product <<= CS2600_20_12_SHIFT;
   294	
   295		} else {
   296			regmap_set_bits(regmap, CS2600_PLL_CFG3, CS2600_RATIO_CFG);
   297			product <<= CS2600_12_20_SHIFT;
   298		}
   299	
 > 300		do_div(product, parent_rate);
   301		*ratio = product;
   302	
   303		return 0;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

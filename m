Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CA71DD520;
	Fri, 24 Jan 2025 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737754419; cv=none; b=jxQtLf6mbGLD8wPhIVMleXKMPZ3CYZ7OmSOZgqaXGCa8dyqZzI2xjj0ZQUNQQlL8k8gHVUCLIAGBlBzlKl7kMJsuAiS7Ags49A+8yoNT+2vvgIIinJ6UOFvJv95kHSeqHva6x/BGZGjCF9XsR5Bg5EQuAdplTKpYr6W1G3yX3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737754419; c=relaxed/simple;
	bh=ZV+CoJSZ+wVV/344CBzff1eeJ9Hjk9q/8p3TD4Hsxtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNZm0KVUCARxneYHxKo2/CAWKINBMMobEko1/GwnRX6yML0HTtdYDrXXwSZcnFYwnisCxEocEoTLni4x1Km/2FOTI/todgL66tq0AnXKSQjKJmoxzKU0H+8F14ItjQg9mDQR4vdsxuoV4rjZluBlE8j7xuXLAPPc6tX1MEAYwhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB3lCqBi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB3lCqBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737754418; x=1769290418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZV+CoJSZ+wVV/344CBzff1eeJ9Hjk9q/8p3TD4Hsxtw=;
  b=gB3lCqBinbT/6DedKJFMqqWC4OaVE/+FBZwdsFbSvnHvYJOta/nvdp/S
   IbU9G79JaUUObSY9K3AlK8ykfHp+wq575u/rmloQ31PF5Sri5et03quO+
   TbGhHwSLCSqd0wb6XuebXgcC6qs6ES3NuVeE0oczsnUT9ce2OSPMcxslR
   G9qX2x62ENRZigbnzCJa8Ku9+65EGOKHiPQxa7NOfGQ78kO0N31SLuCnO
   b+EQK+z6Ql1dRDWy71u0Y6YA+9fpumxs2UbtYLu/BpTobqERjHuBDgUDu
   jC559vArQBpMvky7rKaQBceSbyCWLfnE747RmBBwv4UDfa5+t4cPGawpT
   A==;
X-CSE-ConnectionGUID: foMx31PrRSGwM28OfVohKA==
X-CSE-MsgGUID: DTKQe8jUT2yM4Lv5V6p4Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49718509"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49718509"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 13:33:37 -0800
X-CSE-ConnectionGUID: g4+/9ZLtQsOQaUV3ZgoZ4w==
X-CSE-MsgGUID: CHXgLetET/Spk4p+CUHLlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="107782823"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jan 2025 13:33:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbRIw-000d9T-2h;
	Fri, 24 Jan 2025 21:33:30 +0000
Date: Sat, 25 Jan 2025 05:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/3] clk: scmi: Support spread spectrum
Message-ID: <202501250520.evxxfDdY-lkp@intel.com>
References: <20250124-clk-ssc-v1-3-2d39f6baf2af@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-clk-ssc-v1-3-2d39f6baf2af@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5ffa57f6eecefababb8cbe327222ef171943b183]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/clk-Introduce-clk_set_spread_spectrum/20250124-212050
base:   5ffa57f6eecefababb8cbe327222ef171943b183
patch link:    https://lore.kernel.org/r/20250124-clk-ssc-v1-3-2d39f6baf2af%40nxp.com
patch subject: [PATCH 3/3] clk: scmi: Support spread spectrum
config: i386-buildonly-randconfig-005-20250125 (https://download.01.org/0day-ci/archive/20250125/202501250520.evxxfDdY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250520.evxxfDdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250520.evxxfDdY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/clk-scmi.c:298: warning: cannot understand function prototype: 'const char * const scmi_clk_ssc_allowlist[] = '


vim +298 drivers/clk/clk-scmi.c

   286	
   287	/**
   288	 * scmi_clk_ops_alloc() - Alloc and configure clock operations
   289	 * @dev: A device reference for devres
   290	 * @feats_key: A bitmap representing the desired clk_ops capabilities
   291	 *
   292	 * Allocate and configure a proper set of clock operations depending on the
   293	 * specifically required SCMI clock features.
   294	 *
   295	 * Return: A pointer to the allocated and configured clk_ops on success,
   296	 *	   or NULL on allocation failure.
   297	 */
 > 298	static const char * const scmi_clk_ssc_allowlist[] = {
   299		"fsl,imx95",
   300		NULL
   301	};
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

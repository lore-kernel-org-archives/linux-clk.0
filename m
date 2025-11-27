Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9F2417F0;
	Thu, 27 Nov 2025 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764209499; cv=none; b=Ba8PUQheOXcgFDDVMr6C/Sfw+I2WDEcm2t7j/g0hWw1hTnQ3JO0a/yAqimnO963q32vLGBTGXhTL8rbrvEbn7pLcwYOgi35PeW56OuIct6/2eH3IaYMfZi8yZayi1kSI95Yj5dxGSSPi2YxR542DlIeVsZh9F1qMmtmVaAGrsRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764209499; c=relaxed/simple;
	bh=5E01bNotG3ZMjR0/19DqpOfft1W17AahjuYPghUyM6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0jHbck4k3sKRL0wbR+5LUmTvW65SAS1Dh6Z/HVHLY3TLyVvTcaR3Al1uQtcdQyGCQd8t/wuCAyY2ORNSrxnJCdf3q3xhFJpn4dgoa3g8DlsdgKt+yyOEzaIlIV1NJTRrdRlQDwQqDMQMFlpU76OgALjE1zc9Umf+VM9lNYETBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T4aJTPeI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T4aJTPeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764209498; x=1795745498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5E01bNotG3ZMjR0/19DqpOfft1W17AahjuYPghUyM6g=;
  b=T4aJTPeIOaejXPPi1c5QyZEPds+BiEC9YqXZxcuU6VY359bVXzoi9KqL
   Xyv7F8hbadj0KTtpQzBPllKE1qHED+Tsqd+LPbLITWW5ILOIgo8lyLAB2
   48LZRyr7fIQ4YnA1/qHFOmQYPK1bZk5q+ES32XpsJZ+bZbdwREYykp6Vf
   tpmBkI8qQMLyYCKe/ULasmkS8PO8rnQnPFAOW7iuLJlosNXXSSNgbCbgB
   lvLyViBHAOLa8qjo7w5FosP3tZ1n9sSc28lGGkvML0F9/OLNFz05iQcKO
   A7YEFVr9TJTZ3JQKmybi/FUvoarLsQZpoN33kDmlKhxeMiTK2tjSJ2OGG
   w==;
X-CSE-ConnectionGUID: ARCwObT3T7iR/62bLy8f6g==
X-CSE-MsgGUID: twmT1SXoTm6u6RPMfnYw4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65964926"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65964926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:11:38 -0800
X-CSE-ConnectionGUID: BX/zon0+RU+n3nZmXdtKCQ==
X-CSE-MsgGUID: PaujO7HXSFa7jualy7EUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192232103"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2025 18:11:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORTp-000000003ZV-3AyR;
	Thu, 27 Nov 2025 02:11:33 +0000
Date: Thu, 27 Nov 2025 10:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202511270924.0uDTpEE9-lkp@intel.com>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-035403
base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9%40redhat.com
patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
config: loongarch-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpEE9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.h' file not found
      12 | #include <asm/traps.h>
         |          ^~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]


vim +12 drivers/clk/microchip/clk-core.c

ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps.h>
ce6e1188465998 Purna Chandra Mandal 2016-05-13  13  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

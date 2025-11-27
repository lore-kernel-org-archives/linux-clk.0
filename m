Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB6430F548;
	Thu, 27 Nov 2025 05:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764221330; cv=none; b=pfRR7orqKmPNo1ZtUFdcRnq0jwWgB+as/T5Xuo9mhzs1HHM4pcienQ0MaViud9SsACzAUlQdNeLMXbNxRc+6/oPoyrC/lU787Lqa5Dhp3MjJsCsIBrb8XTUCvh9gW0Z4jh6wMzC4AdrGO73ePqOqhlmBXTCbEnbEosNgErGn9+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764221330; c=relaxed/simple;
	bh=mJIn4/Ei8yV4P4BBKl4Lx81F+DYLseB4FZmvbYAOimc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOdJOiDIl7eJdac76fautwIek5luJohRrJoUOcBccwVrnbP2bSoz5EYHw143YLivb4A165jwX7CU9OSD+ptnlJMBmCAmyP5YNy8m/a9h1wxwwLjMweT2elnaQ3L6bWE1t3JpDbe3X6TbdiAVi8M7O59lL2G+l7Ib9PcB830cDlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVv8LlD9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVv8LlD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764221328; x=1795757328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mJIn4/Ei8yV4P4BBKl4Lx81F+DYLseB4FZmvbYAOimc=;
  b=LVv8LlD9CtCF2dN8VsiZfsg/2YMCVaaMagUD/dikUQlUYZikyC25/Yny
   ydcugSMXj9eUJXyq+grQb0pdU5rSUZIxAGOUBcf3kK5iqTqi3hOP23f7j
   Mu8UfZ27CSXCbY8LMUYcMzrfZ1sUAsRjeWsNWm0vnMnfTaZ5/36gHaJ2n
   xesPVrTCsDGhFvWC3ZeYjRhLsS54cGA6sZ+25vH4E4A53gqvg21uT55Fb
   Pfd/grkCAd/QvcOpXpnxFM8VYaTvEKWIdWYO5Wv8KTvmH56mEGGFT54il
   HxIMttz/prsDNo5KFNtSxSf93UkWMnkG8ufETCQScXN6wpltzu3YEFfzp
   A==;
X-CSE-ConnectionGUID: m659F7lkRZOlI4SbeDPlpw==
X-CSE-MsgGUID: afp+gyeWQNaGmWQwaqFFdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77628320"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="77628320"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 21:28:47 -0800
X-CSE-ConnectionGUID: dDAwnpKRS0GHDQX3dKOIcA==
X-CSE-MsgGUID: rNH9wd2NTYa5D0aVFQxXdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="198088013"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 21:28:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOUYd-000000003kb-16PH;
	Thu, 27 Nov 2025 05:28:43 +0000
Date: Thu, 27 Nov 2025 13:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <202511271350.JgAhe4RA-lkp@intel.com>
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
config: riscv-randconfig-001-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271350.JgAhe4RA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271350.JgAhe4RA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511271350.JgAhe4RA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/microchip/clk-core.c:12:10: fatal error: asm/traps.h: No such file or directory
      12 | #include <asm/traps.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +12 drivers/clk/microchip/clk-core.c

ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps.h>
ce6e1188465998 Purna Chandra Mandal 2016-05-13  13  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

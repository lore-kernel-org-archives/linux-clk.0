Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2251A2F7455;
	Mon,  9 Feb 2026 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651456; cv=none; b=E6VuyYHkWcPyzZLXxoHdkDqoBCORSyv8Fdl6W0l7xZnAC/RhoVUB9oQB7xfHLyRjAadjSr+5gEn5aEeJF3zRxVhtQZReXPMUVKtAxrUyLTs1f1D0tX2Ip3cs4bV0Q9410tJjMognucunxbHi2A5MlLERk4OVNfpk5eZiwYPINW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651456; c=relaxed/simple;
	bh=5qoZV77a6+kSnikdliIA4iXaH+PJyUpecip8OHKWf4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e87E59onc81FnJ3R6NFZ7qlntii61w4i6XEfZbUT0qX8cEtcCRWItTF/VHZmblCvOTFwxTArTbKxX0yHjLX25b8CtTJ6w+wcZhXKQCy3QVJtV3+9DwvIsMw4rOnho4S4sS+09T6qB4/Asahv6+33yJPVFME3tKJZpa73VLu2FCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgEsj2Oj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgEsj2Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651456; x=1802187456;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5qoZV77a6+kSnikdliIA4iXaH+PJyUpecip8OHKWf4Q=;
  b=AgEsj2Oj1fX2tAw/WG+ivFh5afl1RZDwcNodBpG1D/VrinOpK2lHdwwU
   3G60e80YARVk0saOXl1HDNUUlC1GSzDiGLcXDCl0hj7W5Jm4EDaZIJQvG
   qa1UFQ5PiIRZ8Alv8wds8qJEZTuU6HXV1vVwTRpz68PxaTqePscnCFTX2
   DKOHgnr5xjlH3DE2q9bsvtm6DVQ89qH3qy6jjNdnXLG+lIog/DMcCIetg
   +tk+PcfrQVE7Ot4VItlEFoMmWpU49PFTSCJgLDbl7UXAbw1oqx++wd/hj
   ufxIZq/QzeR2+DlEj8db1QhierYMFYL5+k1tt/7W9/IejhkvZbNFcrWIx
   g==;
X-CSE-ConnectionGUID: hO+KO4tiSD6cCZNORe/LuQ==
X-CSE-MsgGUID: jxdcxTXmQEmwivIfV/+jpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71665094"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71665094"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:37:36 -0800
X-CSE-ConnectionGUID: 1DdUKmTlT5KKa66KH8UVeA==
X-CSE-MsgGUID: xdwATXuRS4WvoUbhgnVvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211627456"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 07:37:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTKM-00000000o4u-24xk;
	Mon, 09 Feb 2026 15:37:30 +0000
Date: Mon, 9 Feb 2026 23:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 08/13] clk: amlogic: Add PLL driver
Message-ID: <202602092354.9sJeoo5S-lkp@intel.com>
References: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d310797262f0ddf129e76c2aad2b950adaf1fda]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-Add-Amlogic-A9-standardized-model-clock-control-units/20260209-135334
base:   4d310797262f0ddf129e76c2aad2b950adaf1fda
patch link:    https://lore.kernel.org/r/20260209-a9_clock_driver-v1-8-a9198dc03d2a%40amlogic.com
patch subject: [PATCH 08/13] clk: amlogic: Add PLL driver
config: arm-randconfig-003-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092354.9sJeoo5S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092354.9sJeoo5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092354.9sJeoo5S-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.o: in function `aml_pll_available_rates_show':
>> drivers/clk/amlogic/clk-pll.c:554: undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:567: undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:554: undefined reference to `__aeabi_uldivmod'


vim +554 drivers/clk/amlogic/clk-pll.c

   536	
   537	static int aml_pll_get_best_rate(unsigned long rate, unsigned long step_rate,
   538					 u64 min_vco_rate, u64 max_vco_rate,
   539					 u8 od_max, enum round_type round,
   540					 unsigned long *out_rate)
   541	{
   542		int i;
   543		u64 vco_rate;
   544		unsigned long now_rate, best_rate = 0;
   545	
   546		for (i = 0; i <= od_max; i++) {
   547			vco_rate = rate << i;
   548			if (vco_rate < min_vco_rate)
   549				continue;
   550	
   551			if (vco_rate > max_vco_rate)
   552				break;
   553	
 > 554			if (vco_rate % step_rate == 0) {
   555				best_rate = rate;
   556	
   557				break;
   558			}
   559	
   560			if (round == ROUND_DOWN) {
   561				vco_rate = vco_rate - (vco_rate % step_rate);
   562				now_rate = vco_rate >> i;
   563				if ((rate - now_rate) < (rate - best_rate))
   564					best_rate = now_rate;
   565			} else {
   566				vco_rate = vco_rate + step_rate;
 > 567				vco_rate = vco_rate - (vco_rate % step_rate);
   568				now_rate = vco_rate >> i;
   569				if ((now_rate - rate) < (best_rate - rate))
   570					best_rate = now_rate;
   571			}
   572		}
   573	
   574		if (!best_rate)
   575			return -EINVAL;
   576	
   577		*out_rate = best_rate;
   578	
   579		return 0;
   580	}
   581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

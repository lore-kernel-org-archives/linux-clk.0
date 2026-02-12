Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626C25F98B;
	Thu, 12 Feb 2026 17:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770917412; cv=none; b=XewPqkJFM+TcH1EsYvbNFTiN/TXMQKL4RJgDYs2WGsd0cAaKYkfO6+hSZowKd0uXZpNBaN22HUZ/aCuTTyO6pN49PFbuuCh4Gn8V3rjjwxvo0cX6o5hM/k4nKHnjEfVrsDMYaRb4yn/1VF1ozzzBTNRLgv/j1BbcFIkLXuOnJsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770917412; c=relaxed/simple;
	bh=XBOcgJBc1RSlYmqobhoDkxo7B2GCI8X28c2EJGVXf2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zmf45x9pukCyR1OycidU11iGsLltjIJRGMHPW1OUh1a/uDKpneRF7Owf0hvL2UODK+Lor4WDMf8ED6FuBtIEMTBgxj5N1SDdeQbeRgqfLwJkX+A4v5xBCIdxD6pacCG6xOC72rgJpbccXvczcC8UWaVYr3Te0sV+VKwGyQklp04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQobrbAL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQobrbAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770917410; x=1802453410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XBOcgJBc1RSlYmqobhoDkxo7B2GCI8X28c2EJGVXf2M=;
  b=cQobrbALT5yR7C+vFMsWe2lPKljuZcJHgcvM6vPPULU+VLuIpld1fDHY
   /5WYftu8cu8kdC5sKgnsVpAIJTGEHD8Zu8uJJv0wX5eFOqgFa+wrYIQpD
   KSOfwksqMPDj6lyUfMYo4J94WmOChWpGzCGnCwlnKmmBHHNzM7T/mesAg
   K9TukLbEzEHfXWVa8TkjqrpOFtgwQOVo98Wj/AbKxLV/gIgkVHI3Yq0xq
   AiJ9NzfBC3aRO280dHsoPzhZ0DSoO0uTTwk6HcxXmorhwsykJx4vOGALj
   USE8OZwypURMC8IjisTTjmU7zvjjolGiwrSMZZBDxDRUexmrFtcsSiVSX
   Q==;
X-CSE-ConnectionGUID: 2N27QHWvTty0w9METonVDQ==
X-CSE-MsgGUID: 8cxlhQcRQ+edBBEXdC+5Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71124772"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="71124772"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 09:30:09 -0800
X-CSE-ConnectionGUID: vokpPQzjS12/nvQhQb0tIA==
X-CSE-MsgGUID: xGkuYLYkQLemyQ69LEKpyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="243258862"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Feb 2026 09:30:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqaVv-00000000rwq-1LsJ;
	Thu, 12 Feb 2026 17:30:03 +0000
Date: Fri, 13 Feb 2026 01:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v2 3/9] bus: rifsc: use new CONFIG_STM32_FIREWALL_DEBUG
 switch
Message-ID: <202602130151.3v3igg2M-lkp@intel.com>
References: <20260212-stm32_risab-v2-3-02ef2859b596@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-stm32_risab-v2-3-02ef2859b596@foss.st.com>

Hi Gatien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/dt-bindings-bus-document-the-RISAB-firewall-peripheral/20260212-182006
base:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
patch link:    https://lore.kernel.org/r/20260212-stm32_risab-v2-3-02ef2859b596%40foss.st.com
patch subject: [PATCH v2 3/9] bus: rifsc: use new CONFIG_STM32_FIREWALL_DEBUG switch
config: loongarch-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130151.3v3igg2M-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130151.3v3igg2M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130151.3v3igg2M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/stm32_rifsc.c:436:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     436 | static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp21_res_names = {
         |                     ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/bus/stm32_rifsc.c:424:8: note: previous definition is here
     424 | struct stm32_rifsc_resources_names {
         |        ^
   drivers/bus/stm32_rifsc.c:441:21: warning: attribute declaration must precede definition [-Wignored-attributes]
     441 | static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp25_res_names = {
         |                     ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/bus/stm32_rifsc.c:424:8: note: previous definition is here
     424 | struct stm32_rifsc_resources_names {
         |        ^
   2 warnings generated.


vim +436 drivers/bus/stm32_rifsc.c

   435	
 > 436	static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp21_res_names = {
   437		.device_names = stm32mp21_rifsc_risup_names,
   438		.initiator_names = stm32mp21_rifsc_rimu_names,
   439	};
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

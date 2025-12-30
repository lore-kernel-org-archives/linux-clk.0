Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44D1E8329;
	Tue, 30 Dec 2025 20:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767125937; cv=none; b=shMdjiAujyDfX2jEJi5Kjn3orrQOVXUJ00nj8nUI6EPbHbkAYvCEUcjnIxU04TgHEQVAUtFnkYdXrzgo1UrzOM9DFUfk77PlS/dLeZXt9wOx3Sjp4MYKAzLgGJt+0N8Eaa+fMNNaV6XWkPritQhz/YLpAJBrQItFOX2VwzxP4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767125937; c=relaxed/simple;
	bh=0IH2d6n06/PtQC0NQfXK5mHr1ajMLfWNqsF4W74Sorg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpNJFbjHBlwcW6BfhEITGkx4g+5wIHhjNawF7ZLMpCKMv8eTPn8Vt6BflqjcTwXPPSGqoJKKZmMA8QXAsn2bv7W4wMA2ATB8GTUkcG6x6ZE0g5VEZXBM9q2CyNYMZ1n9zRTkFOpfp8ZwZtfB6ZWo455BIGeuz4l2IhZbhsdHnnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0zrAwUb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0zrAwUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767125935; x=1798661935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0IH2d6n06/PtQC0NQfXK5mHr1ajMLfWNqsF4W74Sorg=;
  b=h0zrAwUbKvUh5rLFv7xOuaGmYxhwjRzrq8SB1WvmcMVN55Rx4KasL0Oo
   WoGGS6lWHqwEQPVNrJ9nH0iLq3RG9knL7+jLymEjmdeRS7QOyP7x0ooOE
   qWsnGxqSkhGkOdvHTbpPfM2zTFiuuNWzlftKNdI6bmkYMD7xtUjqNmKr5
   gljzNPn9TphJB+SgXZLff9b7UGo5X9t5868J0s9TMcUbkDGEH9on/QlwS
   OexO7yjlRNKf5MgXdFBvwzQvM5WUph15/vfgssBV7JWe9BQGGMsP6W4ed
   pU8iIvtuHjAOwtOQV4g+gEIMnizpggtI3+l/BWUT1qQttKkl1Rh29aIzS
   w==;
X-CSE-ConnectionGUID: Kt7hlXmgSAmmjhqG96qptQ==
X-CSE-MsgGUID: iDNbu93zTlyEPYh2sFI5mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="86293631"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="86293631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 12:18:54 -0800
X-CSE-ConnectionGUID: 5R+pX459R/yXjV8yqd/QVA==
X-CSE-MsgGUID: I79DhSofSV26XM3mhe1CBw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2025 12:18:51 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vagB7-000000000gH-238c;
	Tue, 30 Dec 2025 20:18:49 +0000
Date: Wed, 31 Dec 2025 04:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
	jyanchou@realtek.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.tai@realtek.com, cy.huang@realtek.com,
	stanley_chang@realtek.com, eleanor.lin@realtek.com
Subject: Re: [PATCH 4/9] clk: realtek: Add support for phase locked loops
 (PLLs)
Message-ID: <202512310333.lXVsAtZ9-lkp@intel.com>
References: <20251229075313.27254-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-5-eleanor.lin@realtek.com>

Hi Yu-Chun,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20251229-155549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251229075313.27254-5-eleanor.lin%40realtek.com
patch subject: [PATCH 4/9] clk: realtek: Add support for phase locked loops (PLLs)
config: i386-buildonly-randconfig-001-20251230 (https://download.01.org/0day-ci/archive/20251231/202512310333.lXVsAtZ9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310333.lXVsAtZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310333.lXVsAtZ9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/clk/realtek/clk-pll.o:(.rodata+0x80): multiple definition of `clk_pll_ops'; drivers/clk/qcom/clk-pll.o:(.rodata+0x100): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

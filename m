Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5B36C588;
	Wed, 14 Jan 2026 06:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768371514; cv=none; b=bV5Mr+s5EfIsJpafdKH1gP8A/TGdy3+qVWqZdsdVibFSWP4rOV4dSoSXIV4fENPbhsCDFTUeXgxZFDwCfxa9+rew4IUCW57Br1iqVLrkyFPiyoHWdxz/ps8lE16N+Q20GP3orwb0Zjw4abFjWRNGXYZg9w6zNusHsuLUklko/kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768371514; c=relaxed/simple;
	bh=nxSzcvzzHWdNAdgrMcbrS7ggZ6h97hhB6Q4JayxrBCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Usle8NQsNQklE6oNnQwrdrDkwJdOiu6ZahajuBNjIgdgfKg/1WU/x9YWoLHd6ZGHGobf/IQOtDoGgcufx+QBjESZIISmvzHVsoLIASx/U3hs2s/ewuCncSFmDJ9KCB2pr2rFIw/3u8U8mKne+UFzzNxeup/qBK2/yQCc1FfxKy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+6g8WGo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+6g8WGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768371507; x=1799907507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nxSzcvzzHWdNAdgrMcbrS7ggZ6h97hhB6Q4JayxrBCU=;
  b=n+6g8WGoY40HeDRMVhJC88f+mzimot+jaq1aMwNG8+UWcxVhO0D6l8uH
   NQPJYFBPNxRZ8fP/TvEcgKYeaBHLMMdKZqckFJaTMaa9NRbwEe8LHKqr+
   EZ/5laLg4L9orewcj2s8wgmBDOXl4EZV5igrzri5TN6Gyup4/5wTmb9vK
   mWoqDOFhSwDgEkxfvOWOfVn89amT1r7YAotkRiUkWdhqTGpxy3eIBs0Z1
   9Ft1xh0IOLoDZx8N1sDOqnfFlOQzNdrjz/FHXRwGneKKw4e/Eg6heVAvD
   oL64Wm/tux6tXRnDIDocjkxruYPwEFcZqE2ahvYROj9YVKgNaWw83GDDE
   Q==;
X-CSE-ConnectionGUID: Gg0LH/xLRQqYNK5UoSU8Ww==
X-CSE-MsgGUID: z1b0tmleTZicQBgan8LJ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69717670"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69717670"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 22:18:20 -0800
X-CSE-ConnectionGUID: o25ooGa8RS+SpnjyHfhupg==
X-CSE-MsgGUID: vvV9pNS8S/ylru/27TlyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204224659"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 22:18:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfuCs-00000000Fum-0xFe;
	Wed, 14 Jan 2026 06:18:14 +0000
Date: Wed, 14 Jan 2026 14:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
	jyanchou@realtek.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: Re: [PATCH v2 5/9] clk: realtek: Add support for gate clock
Message-ID: <202601141328.Q3kIKTpo-lkp@intel.com>
References: <20260113112333.821-6-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113112333.821-6-eleanor.lin@realtek.com>

Hi Yu-Chun,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20260113-192709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260113112333.821-6-eleanor.lin%40realtek.com
patch subject: [PATCH v2 5/9] clk: realtek: Add support for gate clock
config: arm64-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141328.Q3kIKTpo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141328.Q3kIKTpo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141328.Q3kIKTpo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: clk_regmap_gate_ops
   >>> defined at clk-regmap.c
   >>>            drivers/clk/meson/clk-regmap.o:(clk_regmap_gate_ops) in archive vmlinux.a
   >>> defined at clk-regmap-gate.c
   >>>            drivers/clk/realtek/clk-regmap-gate.o:(.rodata+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: clk_regmap_gate_ro_ops
   >>> defined at clk-regmap.c
   >>>            drivers/clk/meson/clk-regmap.o:(clk_regmap_gate_ro_ops) in archive vmlinux.a
   >>> defined at clk-regmap-gate.c
   >>>            drivers/clk/realtek/clk-regmap-gate.o:(.rodata+0xc8) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

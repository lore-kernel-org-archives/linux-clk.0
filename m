Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2222C17C7C;
	Mon, 16 Dec 2024 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734321865; cv=none; b=JLaf7pzmHGcMjTLw+CFDnmZ1poc42m4BF6V8Q/S27kaMlbGIdaQXH1QrUAweRYvNhwtYxeW1jR1RoGIRmlyvS0/ItdJq396OADK3Ui+o8/1hP6uGswjczQrFEaVN2rhTG3FxS9o2nkucQfqlAqJGNDUhl13xX2RWvBkOA7PXGTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734321865; c=relaxed/simple;
	bh=L9O1CUhqES2iPppXt2s+dnCXTdYr//DdxI8fhsvVtJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESUcT0KlnarMVoWpzbxCKW4Wtwie3DRrOebvYs/9Vy5P77drHVWIZY3YuzXGO0j+91uifw71ImJ1D9AA5g48fbyEp2DJunqgZR/ZSxYeKJLKg7uwcnxRipQ1VWyg1VHXsblGDZdWM2tkh1k8BjSCtNA9zqL+ntGxOBN43woUd+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaModl1/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaModl1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734321863; x=1765857863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L9O1CUhqES2iPppXt2s+dnCXTdYr//DdxI8fhsvVtJ0=;
  b=DaModl1/En5WfhwBJnbZf0y++L+J3YxqIDeh08xXBCMIMwc0PzNtkXby
   m282rk5zJJSXEC7LSkHbiTqDLOMPhYBFQHd7ji7SUNfd8T9OXqsYXwdrd
   E0ISXYFKBjHH07XkcF3QMGSJLXMxLPlVLYT6wEXSTAwyAotJL8XrocvMF
   eT9EiBeVIvNW30BbmsbaOCfp74L8D7auZK8oEMOdx72PKM4v0g2LF0qBD
   S53P3H1RrbSIPl0s7XGih6eF7SsIEjwOdiklfsbYtK48yjnLCLDs3qCRJ
   ljnNIo50kGRPAFkwuaEuHt582Xz5da83CwIRu0oheK6z31es4LfGJm22q
   g==;
X-CSE-ConnectionGUID: uIVH5DdCTriSMOlqi5xLcw==
X-CSE-MsgGUID: xQvA6sJRToqSxB/aQrVW6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45179660"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45179660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 20:04:23 -0800
X-CSE-ConnectionGUID: txI5LGo+S1eGhaMmUkW/aw==
X-CSE-MsgGUID: ZL9/0NoDQzWNrXs/70EmXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97130289"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2024 20:04:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN2LC-000E0I-0Y;
	Mon, 16 Dec 2024 04:04:18 +0000
Date: Mon, 16 Dec 2024 12:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Handrigan <paulha@opensource.cirrus.com>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paul Handrigan <paulha@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] clk: cs2600: Add Fractional-N clock driver
Message-ID: <202412161152.7xKtUJQr-lkp@intel.com>
References: <20241211003236.2523604-3-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211003236.2523604-3-paulha@opensource.cirrus.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.13-rc3 next-20241213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Handrigan/dt-binding-clock-cs2600-Add-support-for-the-CS2600/20241211-083439
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241211003236.2523604-3-paulha%40opensource.cirrus.com
patch subject: [PATCH 2/2] clk: cs2600: Add Fractional-N clock driver
config: i386-randconfig-016-20241215 (https://download.01.org/0day-ci/archive/20241216/202412161152.7xKtUJQr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161152.7xKtUJQr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161152.7xKtUJQr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/clk/clk-cs2600.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

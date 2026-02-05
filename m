Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F332BF23;
	Thu,  5 Feb 2026 21:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770327999; cv=none; b=PQ+K1veIxluA6Jslpx5F55ShNeH5f9sk+UWpU82FPjULzeMoUkowp6niBTLJyWHdvmVC27pXjyYGUB/qAWYDv37V44OkJlpsb3YUIEaAQKVTYE8Qj5igLffD06Gi3iB3lTUVvYG7g/SPcKroa8YS0EyZ2SQaFhFpl8nW6MjUSFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770327999; c=relaxed/simple;
	bh=0jhX6zKSC95EE9efVfTENFlaDkA+U6Y1etKjI43bDVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVH+FlGq0kpwi4y7c3h2aK0Afnec9cWdOahhHGFTGxVwS3n72qefagqFldnZL8UMzmuPQmw1F62tK3jysnBLue5mrshTOD31j51eIvtUJhqzq6shQJpVwI4YbE8RyX8NdcPsz4Zmqdxzsh9/j0byn2MTZbxkXXXktw/fNBqI2JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDIk+8cr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDIk+8cr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770327998; x=1801863998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jhX6zKSC95EE9efVfTENFlaDkA+U6Y1etKjI43bDVA=;
  b=DDIk+8crNC8y/LmFRzus/UZ2xZYxBpl0pNNrR0M2dLwCchdHcnYyfdIz
   sInTEp7ZNhZCVid/vrknaQmIgO2Hm2HwdVK+Ebz53pbvt+CTnbJljijTr
   dt5JIeqImk8Ch8K/80twIsJCCLxAnFWBOMn+VUG05w38oM0oEfgrXD+Kq
   SIUpppSirCMhO1OItfH6WV7BmcQ/CExkaQ3n7v3WCYq+vvJ8Ez/Lr7Qk5
   LZF4KXDpkfr8/CD/GKVLzRVouoALEKMJN/QwiHVRml7pp/WiRx7CgdRtZ
   +3M3400AFwpqlhMnIkMByxK/82bEQsSyOTnZkcXHznxSo7foerpcafE0U
   Q==;
X-CSE-ConnectionGUID: XnUFovZ7RxGzIukBJVrR4w==
X-CSE-MsgGUID: H6iUAysSTb6mdePwJOhi+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="89119531"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="89119531"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 13:46:37 -0800
X-CSE-ConnectionGUID: w3KStVOaSpmiIopV9wV5QQ==
X-CSE-MsgGUID: qR9vmdVIReGoCba8Bkws3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="210730692"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Feb 2026 13:46:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo7BH-00000000kEq-0A68;
	Thu, 05 Feb 2026 21:46:31 +0000
Date: Fri, 6 Feb 2026 05:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, bmasney@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com, Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: Re: [PATCH v10 2/3] clock: eswin: Add eic7700 clock driver
Message-ID: <202602060520.p4Hg35Ja-lkp@intel.com>
References: <20260205093453.1143-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205093453.1143-1-dongxuyang@eswincomputing.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc8 next-20260205]
[cannot apply to clk/clk-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/dongxuyang-eswincomputing-com/dt-bindings-clock-eswin-Documentation-for-eic7700-SoC/20260205-174013
base:   linus/master
patch link:    https://lore.kernel.org/r/20260205093453.1143-1-dongxuyang%40eswincomputing.com
patch subject: [PATCH v10 2/3] clock: eswin: Add eic7700 clock driver
config: arc-randconfig-r053-20260206 (https://download.01.org/0day-ci/archive/20260206/202602060520.p4Hg35Ja-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060520.p4Hg35Ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060520.p4Hg35Ja-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/clk/eswin/clk.c: In function 'eswin_clk_register_clks':
>> drivers/clk/eswin/clk.c:519:4: error: a label can only be part of a statement and a declaration is not a statement
       const struct eswin_fixed_factor_clock *factor;
       ^~~~~
   drivers/clk/eswin/clk.c:528:4: error: a label can only be part of a statement and a declaration is not a statement
       const struct eswin_mux_clock *mux = &info->data.mux;
       ^~~~~
   drivers/clk/eswin/clk.c:538:4: error: a label can only be part of a statement and a declaration is not a statement
       const struct eswin_divider_clock *div = &info->data.div;
       ^~~~~
   drivers/clk/eswin/clk.c:554:4: error: a label can only be part of a statement and a declaration is not a statement
       const struct eswin_gate_clock *gate = &info->data.gate;
       ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [m]:
   - AMD_XGBE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI || PCI [=n]) && HAS_IOMEM [=y] && (X86 || ARM64 || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=m]


vim +519 drivers/clk/eswin/clk.c

   506	
   507	int eswin_clk_register_clks(struct device *dev, struct eswin_clk_info *clks,
   508				    int nums, struct eswin_clock_data *data)
   509	{
   510		struct eswin_clk_info *info;
   511		const struct clk_hw *phw = NULL;
   512		struct clk_hw *hw;
   513		int i;
   514	
   515		for (i = 0; i < nums; i++) {
   516			info = &clks[i];
   517			switch (info->type) {
   518			case CLK_FIXED_FACTOR:
 > 519				const struct eswin_fixed_factor_clock *factor;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

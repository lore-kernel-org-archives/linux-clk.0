Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855371CCB4A;
	Sun,  5 Jan 2025 18:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736100073; cv=none; b=IJLU3LpzYKm6VHorNvc25il5wMbxatYB+GG6sXjwcKxwYJMYgcOQ1kwJ1jqtFMSNK48pmkqC1H8nPfkMWp/p+t/anta39xrHqXx3z0VxXixi2fhONCNgyJAoh0mGdi7fHJ5bGNQFno2g2QoRhrMPjecyrUrDEbn4oREMmeb3bmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736100073; c=relaxed/simple;
	bh=cspNj5F8aDJyAAQ4b/34Sfk3+U9AtmMxeKqzn6Bn/sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxSRV02AvYJ9cPbtBvDkMM8NMKPVRG5Qmv0W8XkJ2zPZLE7hLB+w6RMPiEyCUiEEjltTsu3aA84EYqkNRhQhQ046stHnZOwZaO1SNTcSBX6ckxN/TQLU67Qug07n7gFhEqi3Bvd+x97MUVXwj1afd/2uBaK77WDvlyA5wvwwy8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgCwKr+4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgCwKr+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736100072; x=1767636072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cspNj5F8aDJyAAQ4b/34Sfk3+U9AtmMxeKqzn6Bn/sg=;
  b=VgCwKr+4Q4rBCGv/GCWqNCITUjCUdarSIcPpsDOr3w1WCoxQK5XyVD/l
   mksc2Wmj56NQvIL2CQUCdKwq2PA6oIKB1HnfvkWf8dbIctKSeqFcM9G9n
   +T/vtXJwmRmbR8vylmJj2GpZA/Z6QXvz3mS+BozA/YDfbHnZA5qqMq2Hj
   ILcSc3mbdVnQ9XIlUPFQQTDsKhTqrnmvJMGldhdbDu16BPfaFy8DwiLrw
   0rp3M9+s9U00cWiKNrplKiDqwMTLWFUUZIOnj0aKsidMDkinm5buwYdJI
   X1IDwbk6dwQHsPK6Xossu260tMx+BVCNfu7v1NYIAY8+l8oNDeyFAF6nv
   Q==;
X-CSE-ConnectionGUID: TRVYYtwpQY+gUq8QNOLmwA==
X-CSE-MsgGUID: PKETaqDXTNGvmYFecfdF0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36414376"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="36414376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 10:01:11 -0800
X-CSE-ConnectionGUID: GDMyISq1QWqYzeHEk2plfQ==
X-CSE-MsgGUID: 3KYqPRWERYqSP0EY+2XogA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="133085080"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jan 2025 10:01:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUUvw-000Btv-2D;
	Sun, 05 Jan 2025 18:01:04 +0000
Date: Mon, 6 Jan 2025 02:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jian Hu <jian.hu@amlogic.com>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller
 driver
Message-ID: <202501060104.R3FJGgmC-lkp@intel.com>
References: <20241231060047.2298871-6-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-6-jian.hu@amlogic.com>

Hi Jian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-add-Amlogic-T7-PLL-clock-controller/20241231-141835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20241231060047.2298871-6-jian.hu%40amlogic.com
patch subject: [PATCH 5/5] clk: meson: t7: add t7 clock peripherals controller driver
config: arm64-randconfig-r112-20250105 (https://download.01.org/0day-ci/archive/20250106/202501060104.R3FJGgmC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce: (https://download.01.org/0day-ci/archive/20250106/202501060104.R3FJGgmC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060104.R3FJGgmC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/clk/meson/t7-peripherals.c:1276:26: sparse: sparse: Initializer entry defined twice
   drivers/clk/meson/t7-peripherals.c:1277:26: sparse:   also defined here

vim +1276 drivers/clk/meson/t7-peripherals.c

  1262	
  1263	 static u32 eth_rmii_table[] = { 0, 7 };
  1264	
  1265	static struct clk_regmap eth_rmii_sel = {
  1266		.data = &(struct clk_regmap_mux_data) {
  1267			.offset = CLKCTRL_ETH_CLK_CTRL,
  1268			.mask = 0x3,
  1269			.shift = 9,
  1270			.table = eth_rmii_table
  1271		},
  1272		.hw.init = &(struct clk_init_data){
  1273			.name = "eth_rmii_sel",
  1274			.ops = &clk_regmap_mux_ops,
  1275			.parent_data = &(const struct clk_parent_data) {
> 1276				.fw_name = "fdiv2",
  1277				.fw_name = "rmii_pad"
  1278			},
  1279			.num_parents = 2
  1280		},
  1281	};
  1282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

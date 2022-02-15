Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F77C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 13:57:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238105AbiBON6E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 08:58:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbiBON6E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 08:58:04 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A44410DA;
        Tue, 15 Feb 2022 05:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644933474; x=1676469474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HGOSE+LOV5OOgyqDrdV4dc8uHG8GQB0nFIrmMYZ8WHQ=;
  b=nNYWpGjygM4mg1zHhxOQqMznOgbKDywzHrLdnIo6yUDMuZMxiLR1qvqP
   83BSJEvcMuUthEBSmU1E/8wA+tIu9eehv3arqRAp2PQswqQDoeFyB1HUw
   2x12pa2jz9xpLeFsR/NB/2DFjAwDjS8+J/xuBwasZ17YdTP4rPY2DUFo7
   pVpDUAx2gAD7h13mx4GJieP+ltGJnBPp5YDTBptqLYzGmbpSCcZ5Cgeem
   FNNd6LA+0Kzs+J/++hEsWgD0nxx1774U6Pl2X/YqArhVqXc6tlsLc725E
   T5Omvj26R68WMUwOwDWoB7DwjA1PB6fj/TklJ4ctojq68+Mozv/bqXmt/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="313628648"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="313628648"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 05:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="681042809"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2022 05:57:51 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nJyL0-0009id-Cg; Tue, 15 Feb 2022 13:57:50 +0000
Date:   Tue, 15 Feb 2022 21:57:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Message-ID: <202202152152.8a7M9Tkv-lkp@intel.com>
References: <20220215084412.8090-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215084412.8090-2-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/dt-bindings-clk-Introduce-critical-clocks-property/20220215-164757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: x86_64-randconfig-a002-20220214 (https://download.01.org/0day-ci/archive/20220215/202202152152.8a7M9Tkv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/aded04bc3dec13df3f940621d94d84e32ff8a5ea
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/dt-bindings-clk-Introduce-critical-clocks-property/20220215-164757
        git checkout aded04bc3dec13df3f940621d94d84e32ff8a5ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/clk.c:3881:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret, i, index;
               ^
   1 warning generated.


vim +/ret +3881 drivers/clk/clk.c

  3874	
  3875	static void
  3876	__clk_register_critical_clock(struct device_node *np, struct clk_core *core,
  3877				      struct clk_hw *hw)
  3878	{
  3879		struct of_phandle_args clkspec;
  3880		u32 clksize, clktotal;
> 3881		int ret, i, index;
  3882	
  3883		if (!np)
  3884			return;
  3885	
  3886		if (!core->ops->match_clkspec)
  3887			return;
  3888	
  3889		if (of_property_read_u32(np, "#clock-cells", &clksize))
  3890			return;
  3891	
  3892		/* Clock node with #clock-cells = <0> uses critical-clocks; */
  3893		if (clksize == 0) {
  3894			if (of_property_read_bool(np, "critical-clocks") &&
  3895			    !core->ops->match_clkspec(hw, &clkspec))
  3896				core->flags |= CLK_IS_CRITICAL;
  3897			return;
  3898		}
  3899	
  3900		clkspec.np = np;
  3901		clktotal = of_property_count_u32_elems(np, "critical-clocks");
  3902		clktotal /= clksize;
  3903		for (index = 0; index < clktotal; index++) {
  3904			for (i = 0; i < clksize; i++) {
  3905				ret = of_property_read_u32_index(np, "critical-clocks",
  3906								 (index * clksize) + i,
  3907								 &(clkspec.args[i]));
  3908			}
  3909			if (!core->ops->match_clkspec(hw, &clkspec))
  3910				core->flags |= CLK_IS_CRITICAL;
  3911		}
  3912	}
  3913	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

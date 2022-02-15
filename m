Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6E3C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 11:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237129AbiBOLZE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 06:25:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237095AbiBOLZA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 06:25:00 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AED10855A;
        Tue, 15 Feb 2022 03:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644924290; x=1676460290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=88QwmHFN8Z6K7oOwYMh4aqsIoXvzf3hWSa4cBd71bys=;
  b=MxfY3XnNR6117+l6QN1lFDyhgs2RaYWes1plX7Ki7M23BinDptVpnv2T
   r4nlzK1i1dx/H+89AscJWSPQk5xQ3mZUVNRxwS1O6JQ39XdsFI4aLBM8H
   prS89P96qz+Dm52PeSaPg3+vXYI6GOY6nSrS44u2x8HPlM7zG1an+YCrY
   K11p6iheMvB9aMMosZgLAQYP9zheB+GnAn96t3jsIR5XVo+n+kA7Qtg8c
   4Ti41h6OHlOu7AzFy8xNms4pvu6QMcboPV+VcYYGoa7IHQcgFw6BqC0Um
   LbclriYvJ0CGeiWJjmP6gXQlduSi7CcLVpri4mtfwuXexAevsmJQs/RZQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="247926524"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="247926524"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 03:24:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; 
   d="scan'208";a="528799645"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Feb 2022 03:24:46 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nJvws-0009bb-5o; Tue, 15 Feb 2022 11:24:46 +0000
Date:   Tue, 15 Feb 2022 19:23:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Message-ID: <202202151824.QGNvG2R8-lkp@intel.com>
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
[also build test WARNING on v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Vasut/dt-bindings-clk-Introduce-critical-clocks-property/20220215-164757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: nds32-allnoconfig (https://download.01.org/0day-ci/archive/20220215/202202151824.QGNvG2R8-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/aded04bc3dec13df3f940621d94d84e32ff8a5ea
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Vasut/dt-bindings-clk-Introduce-critical-clocks-property/20220215-164757
        git checkout aded04bc3dec13df3f940621d94d84e32ff8a5ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nds32 SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/clk.c: In function '__clk_register_critical_clock':
>> drivers/clk/clk.c:3881:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    3881 |         int ret, i, index;
         |             ^~~


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

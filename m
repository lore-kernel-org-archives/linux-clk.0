Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9099BC43334
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 17:14:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240311AbiGNROe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 13:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240090AbiGNROd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 13:14:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F2512773
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657818872; x=1689354872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A5aOarOg9nbeS6YM7v+CNYARmFvw6oE29T5SERmxCSk=;
  b=lLljNohy/yHbWV/4sXPElT2oes05X1GSkM/aqvoIj2RVLZbrbaQkwyC+
   mKvZ2WbASOZCcWBb49qYXiPaicDgU2KqfQW8v168/EO3Ux0Vfrye2I/ue
   G8X+jXqqhjbhnQd09VSxUXab/Wq/yxbiNfT5wGdu27nPev381pd3vgL2f
   9r8x0FokO9Gm4mBy5aqE0s8G6e+vUqw0aKUJVaILqW2zH4igy4pUANV+T
   NfTmmglsLJYoDvrcueD9754KreF6T76M6y/HmnQR3t9NKZMR0owpTU8+L
   8gzx3VziNQO4a6dx6vvGAZc4YLxnUqXIHKSNiEiv01Q7CtZyM2dHDpHb4
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="265368378"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="265368378"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 10:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="698885558"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jul 2022 10:14:29 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oC2Q0-0000uT-LO;
        Thu, 14 Jul 2022 17:14:28 +0000
Date:   Fri, 15 Jul 2022 01:13:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v6 02/28] clk: bcm: rpi: Add a function to retrieve the
 maximum
Message-ID: <202207150118.KCuvlljp-lkp@intel.com>
References: <20220711152424.701311-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711152424.701311-3-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on drm-misc/drm-misc-next linus/master]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220711-232652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-randconfig-r013-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150118.KCuvlljp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/461ea72e08a9200c6874414e709885d73fe0cfb9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220711-232652
        git checkout 461ea72e08a9200c6874414e709885d73fe0cfb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/bcm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/bcm/clk-raspberrypi.c:257:15: warning: no previous prototype for function 'rpi_firmware_clk_get_max_rate' [-Wmissing-prototypes]
   unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
                 ^
   drivers/clk/bcm/clk-raspberrypi.c:257:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
   ^
   static 
   1 warning generated.


vim +/rpi_firmware_clk_get_max_rate +257 drivers/clk/bcm/clk-raspberrypi.c

   256	
 > 257	unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
   258	{
   259		const struct raspberrypi_clk_data *data;
   260		struct raspberrypi_clk *rpi;
   261		struct clk_hw *hw;
   262		u32 max_rate;
   263		int ret;
   264	
   265		if (!clk)
   266			return 0;
   267	
   268		hw =  __clk_get_hw(clk);
   269		if (!hw)
   270			return 0;
   271	
   272		data = clk_hw_to_data(hw);
   273		rpi = data->rpi;
   274		ret = raspberrypi_clock_property(rpi->firmware, data,
   275						 RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
   276						 &max_rate);
   277		if (ret)
   278			return 0;
   279	
   280		return max_rate;
   281	}
   282	EXPORT_SYMBOL_GPL(rpi_firmware_clk_get_max_rate);
   283	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

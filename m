Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BF4C43334
	for <linux-clk@archiver.kernel.org>; Sat, 16 Jul 2022 04:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiGPEzD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 16 Jul 2022 00:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiGPEzD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Jul 2022 00:55:03 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D602188F25
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 21:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657947301; x=1689483301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4pJPGEi7Hn0AypK+V1Lo+r6a4HsrKmdzDkH/UfXow5A=;
  b=iJsQQsSvSqp2myD27pvOVZFtGL5ZRq4FZQsLkIjGTbENouHxZ29SRXWk
   uzGRCRUOQRDbHRr+DfPbUmXQLoSzLmfNsZAFewG6M/90lQlP8vixNaWOJ
   JP7J2nE09bIOrf6TTDXqbK4VoY8s0kS2yThVopS/hSt3C73QBnWmgvHmZ
   H7h7+a6Rq+ldspGnnAPhV2OqtRZIB8WEtjY5S4ZfFBzoDirVjsWSLKn09
   J//6JJr3IgPsknqrxN6nB//FTP+47t5E8QNqTYsBdqRxQDjnpUu7FKoNj
   stlg9pnXRCh0zeeVGayaLdBNv2Z41B29HFvYLsKeRzfmfUYKr3ZZDu78f
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="286683543"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="286683543"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 21:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="738892928"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2022 21:54:58 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCZpR-0001A2-Mj;
        Sat, 16 Jul 2022 04:54:57 +0000
Date:   Sat, 16 Jul 2022 12:54:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
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
Message-ID: <202207161221.vqfztQIZ-lkp@intel.com>
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
[also build test WARNING on drm-misc/drm-misc-next linus/master v5.19-rc6 next-20220715]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220711-232652
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arc-randconfig-r043-20220715 (https://download.01.org/0day-ci/archive/20220716/202207161221.vqfztQIZ-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/461ea72e08a9200c6874414e709885d73fe0cfb9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220711-232652
        git checkout 461ea72e08a9200c6874414e709885d73fe0cfb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/clk/bcm/ drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/bcm/clk-raspberrypi.c:257:15: warning: no previous prototype for 'rpi_firmware_clk_get_max_rate' [-Wmissing-prototypes]
     257 | unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

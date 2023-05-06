Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F1F0C77B75
	for <linux-clk@archiver.kernel.org>; Sat,  6 May 2023 00:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbjEFAih (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 20:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjEFAig (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 20:38:36 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AE14C19
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 17:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683333515; x=1714869515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q67dbC+ksSmf8OIkWxQVTbl2nalpUVBAq4JCZuwWNXk=;
  b=H2EipEzL+HLKCW7JIYB3HkDiACtLxyGXZMqQxfxYlLFyI2ssOdK7xcFP
   +8jRf+888RsuD3zvPvZggN0p0goSix7EED8/5GP04szMA+D4z+GoBoUwF
   YAQlvtT3IEE0GOXRWeN2krAnqhTqrQQPFkxTet9mGojBghPmyiRRx2t5/
   j7FyMuesEPa+E8aem9b0GOQbEhx58A7WWjDFHok6ILdKMpobUjbpPnQb/
   EB9lRGMutenuGT+zYKA+5e6slLSI8C5/ku4oics+C+c5LUs7RlzMsK7OF
   8geTjhqDPN1h6gJ4H4TGDqR9WpZbqYW6uZn98W+aIw9f7KaPY58RlSYkr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414870791"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="414870791"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 17:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="841975134"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="841975134"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 May 2023 17:38:32 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pv5wV-0000yv-1s;
        Sat, 06 May 2023 00:38:31 +0000
Date:   Sat, 6 May 2023 08:37:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Peng Fan <peng.fan@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4 28/68] clk: imx: scu: Add a determine_rate hook
Message-ID: <202305060825.el8VAQuQ-lkp@intel.com>
References: <20221018-clk-range-checks-fixes-v4-28-971d5077e7d2@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v4-28-971d5077e7d2@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 145e5cddfe8b4bf607510b2dcf630d95f4db420f]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
base:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
patch link:    https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v4-28-971d5077e7d2%40cerno.tech
patch subject: [PATCH v4 28/68] clk: imx: scu: Add a determine_rate hook
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230506/202305060825.el8VAQuQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0c9c183066c25a7519ff60578753e40bf622b982
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
        git checkout 0c9c183066c25a7519ff60578753e40bf622b982
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060825.el8VAQuQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/imx/clk-imx-scu.ko] undefined!
ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk_test.ko] undefined!
ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-cdce706.ko] undefined!
ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-lochnagar.ko] undefined!
ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-si5341.ko] undefined!
ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-versaclock5.ko] undefined!
ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-wm831x.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

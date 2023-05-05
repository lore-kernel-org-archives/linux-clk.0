Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0280EC77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 21:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjEEVAc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 17:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjEEVAb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 17:00:31 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C589FF
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683320430; x=1714856430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l0R2doc2268kKC+joemdtvLKaCJ+iHfybsYYuuu/YNA=;
  b=ZzjR31nf0tAMBlBX9IQObubbrEyhB5Iw2RPZ/Ye6W2iFCrNomDmRQ7Qq
   4s9YiRSC0u6tNCodNVdzzGdEzNBv/z4BP2PrJRCAcUu5Gfjvn+RScxxau
   DLnhuZUdWu7TIRS8mwMcaZX3jkJHrf65F0gPh8Qgh6r9PSBRvGSoUsUJ8
   z+LQYjk0P7Q5BlPwr4ffHtXCMfuoCYgyZI05pdm7sCvaYfBTV41xrkw3Z
   0I6o47AEr2Ht09Ki00OVFfRCuDI6KVff7mb1ltuk7Bx2SBJdhLqeAbqSz
   FjwFQnSHgNZeFkVJ7uv0pFVKsX3jLUDZyzAYKQicTgnGWrSAxRVFAMMZc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414843184"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="414843184"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 14:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="767266984"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="767266984"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 May 2023 14:00:27 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pv2XT-0000rR-0o;
        Fri, 05 May 2023 21:00:27 +0000
Date:   Sat, 6 May 2023 05:00:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v4 12/68] clk: cdce706: Add a determine_rate hook
Message-ID: <202305060426.mOiZv7Hn-lkp@intel.com>
References: <20221018-clk-range-checks-fixes-v4-12-971d5077e7d2@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v4-12-971d5077e7d2@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 145e5cddfe8b4bf607510b2dcf630d95f4db420f]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
base:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
patch link:    https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v4-12-971d5077e7d2%40cerno.tech
patch subject: [PATCH v4 12/68] clk: cdce706: Add a determine_rate hook
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230506/202305060426.mOiZv7Hn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/09a54ed3207dca37a9f0541411f1867aa38a750d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
        git checkout 09a54ed3207dca37a9f0541411f1867aa38a750d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060426.mOiZv7Hn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk_test.ko] undefined!
>> ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-cdce706.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

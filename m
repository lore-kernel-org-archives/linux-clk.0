Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CEDC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 21:25:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244920AbiEKVZ1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 17:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbiEKVZZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 17:25:25 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1889769289
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652304325; x=1683840325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1+a7DNiywUmPaaNlwD3yArXgVS80s2+Fd3PmJ/XuGic=;
  b=k+nLWTNeBiZcergohTAR4qqjTLaKrA5tAyQ2fo5BOlqb7uwhCsfn2V8a
   6XMTzhRhYTggMl/X3n9oGvsDKXd4nwM2RH+P5sj7UIO39nmw+4zjicgeU
   9mtAuCO//hDHo4auJ70pA/yQe9/cpvFC/sniYgUK3zt5o+bjXw7TP9cO+
   c9TwfXB4r7uxdoe3XPN1qqCKY2Oe0JAvn6an364TLG5Q68ZiWICHAJwwE
   e/Mb6b7cyS7PG1v2s97aGWvecLfQwEWUjncZrRqPnWTHAE+DmDY4fgEyk
   s+sRUcYiL+wqMnKED7Yrm4IQrZXX7WAnF18zdbpoY0iN+Jo4adoMmQTYL
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="267405467"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="267405467"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 14:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="636580599"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 May 2022 14:25:21 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1notph-000JbL-7D;
        Wed, 11 May 2022 21:25:21 +0000
Date:   Thu, 12 May 2022 05:25:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v3 22/28] clk: Stop forwarding clk_rate_requests to the
 parent
Message-ID: <202205120547.M8CYJHbN-lkp@intel.com>
References: <20220511144249.354775-23-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511144249.354775-23-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v5.18-rc6 next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220511-224533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: i386-randconfig-r006-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120547.M8CYJHbN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/32af2a918274a92da86089672d5d7adba63dc0cf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220511-224533
        git checkout 32af2a918274a92da86089672d5d7adba63dc0cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/clk/clk.c:1502:38: error: passing 'const struct clk_rate_request *' to parameter of type 'struct clk_rate_request *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           clk_core_forward_rate_req(hw->core, old_req,
                                               ^~~~~~~
   drivers/clk/clk.c:568:38: note: passing argument to parameter 'old_req' here
                             struct clk_rate_request * const old_req,
                                                             ^
   1 error generated.


vim +1502 drivers/clk/clk.c

  1481	
  1482	/**
  1483	 * clk_hw_forward_rate_request - Forwards a clk_rate_request to a clock's parent
  1484	 * @hw: the original clock that got the rate request
  1485	 * @old_req: the original clk_rate_request structure we want to forward
  1486	 * @parent: the clk we want to forward @old_req to
  1487	 * @req: the clk_rate_request structure we want to initialise
  1488	 * @parent_rate: The rate which is to be requested to @parent
  1489	 *
  1490	 * Initializes a clk_rate_request structure to submit to a clock parent
  1491	 * in __clk_determine_rate() or similar functions.
  1492	 */
  1493	void clk_hw_forward_rate_request(const struct clk_hw *hw,
  1494					 const struct clk_rate_request *old_req,
  1495					 const struct clk_hw *parent,
  1496					 struct clk_rate_request *req,
  1497					 unsigned long parent_rate)
  1498	{
  1499		if (WARN_ON(!hw || !old_req || !parent || !req))
  1500			return;
  1501	
> 1502		clk_core_forward_rate_req(hw->core, old_req,
  1503					  parent->core, req,
  1504					  parent_rate);
  1505	}
  1506	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAB1C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 19:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238976AbiEKTWs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 15:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346801AbiEKTWT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 15:22:19 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9125F26A
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 12:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652296933; x=1683832933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HXRsA1s2aIn0Js4ZB3qjJqIzZbWuBuR1RNRM83a/Dmc=;
  b=U8H/cYWPH9jzknd4FE7c3KShAUKSSSzC6Ef0G75jah0w5Xr3pVUVybCT
   fhwpBi6qfXuMRub+pXUiFdpQW1McEuQBOQFa5x7QHhvxgMfvWVOA59ffG
   25AtUiWnCY/lifdjflg5lKh6gdOPxdzelUQ5UkxqK/nwUKSaFesQJcdQr
   m5VN1puci3sYfeaz75J0SSPFJsencLUbyF3LujoCl1UHm3q79TNF4DOKM
   skHeGYHn7hghJzUtJspJjuR7X0780trX+T6X6P2dtB5NauE1fI+JiAo+T
   /tfr/9RwsWO0xCR+FpPIfVW3t9GvN6KOGONFnAC9PDpN/ACbZJwKj0hz2
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269463724"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="269463724"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 12:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="624085743"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 May 2022 12:22:09 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1noruT-000JTc-2s;
        Wed, 11 May 2022 19:22:09 +0000
Date:   Thu, 12 May 2022 03:21:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Jerome Brunet <jbrunet@baylibre.com>,
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
Message-ID: <202205120339.nHwf2vT1-lkp@intel.com>
References: <20220511144249.354775-23-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511144249.354775-23-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linus/master v5.18-rc6 next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220511-224533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20220512/202205120339.nHwf2vT1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/32af2a918274a92da86089672d5d7adba63dc0cf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220511-224533
        git checkout 32af2a918274a92da86089672d5d7adba63dc0cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/clk.c: In function 'clk_hw_forward_rate_request':
>> drivers/clk/clk.c:1502:45: warning: passing argument 2 of 'clk_core_forward_rate_req' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1502 |         clk_core_forward_rate_req(hw->core, old_req,
         |                                             ^~~~~~~
   drivers/clk/clk.c:568:59: note: expected 'struct clk_rate_request * const' but argument is of type 'const struct clk_rate_request *'
     568 |                           struct clk_rate_request * const old_req,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~


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

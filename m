Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9650AC43219
	for <linux-clk@archiver.kernel.org>; Sat, 14 May 2022 02:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiENC4S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 May 2022 22:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiENC4B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 May 2022 22:56:01 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342A22F8CDF
        for <linux-clk@vger.kernel.org>; Fri, 13 May 2022 19:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652494415; x=1684030415;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LVbYclOQu1uAfb3GHgEWIJN5LODGW/YNo7aksTYk4Rg=;
  b=QbBtQJJpc3JhJetVQS8KEqK7NcUWjzTWDClnKzqJU+NkXQRey3bc+nas
   vwrXv7TVV//oyYV2kYr882kuXWUSJAjW0E7xZosKTDS+ITVZoWpA3kf7i
   8vvv53dxCqCXORDzfaZwNe5bRE3MxXg0FUQd2hq+4CuQ8T9sFjlMJvXoK
   KHktcwWIsbQLfCqz0XNrt1z1VUJYDJs5OUms96V9wOYVi7vS0mmeb6g+F
   UtiZP6xXwTc01TfcCK/wkjvzd4LfBtgaCyooa1eBTFqnlyeNkG07STqWf
   oKUQ3/DBgS7srOaLTxPXOt9q4AnrlcAMNGLtci1Wd8c2JJmXkQVd9wSg4
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270583990"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="270583990"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 19:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="896461996"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 May 2022 19:13:31 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nphHe-000MJy-Q9;
        Sat, 14 May 2022 02:13:30 +0000
Date:   Sat, 14 May 2022 10:12:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 22/28] clk: Stop forwarding clk_rate_requests to the
 parent
Message-ID: <202205141043.hBe4IIkE-lkp@intel.com>
References: <20220512160412.1317123-23-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512160412.1317123-23-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v5.18-rc6]
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220513-001815
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-sama5_defconfig (https://download.01.org/0day-ci/archive/20220514/202205141043.hBe4IIkE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2034099e179a2af8cd5752935973b61236748c0c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220513-001815
        git checkout 2034099e179a2af8cd5752935973b61236748c0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/clk/at91/clk-generated.c: In function 'clk_generated_determine_rate':
>> drivers/clk/at91/clk-generated.c:192:49: error: passing argument 2 of 'clk_hw_forward_rate_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
     192 |                 clk_hw_forward_rate_request(hw, parent, req, &req_parent);
         |                                                 ^~~~~~
         |                                                 |
         |                                                 struct clk_hw *
   In file included from drivers/clk/at91/clk-generated.c:10:
   include/linux/clk-provider.h:69:65: note: expected 'const struct clk_rate_request *' but argument is of type 'struct clk_hw *'
      69 |                                  const struct clk_rate_request *old_req,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/clk/at91/clk-generated.c:192:57: error: passing argument 3 of 'clk_hw_forward_rate_request' from incompatible pointer type [-Werror=incompatible-pointer-types]
     192 |                 clk_hw_forward_rate_request(hw, parent, req, &req_parent);
         |                                                         ^~~
         |                                                         |
         |                                                         struct clk_rate_request *
   In file included from drivers/clk/at91/clk-generated.c:10:
   include/linux/clk-provider.h:70:55: note: expected 'const struct clk_hw *' but argument is of type 'struct clk_rate_request *'
      70 |                                  const struct clk_hw *parent,
         |                                  ~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> drivers/clk/at91/clk-generated.c:192:17: error: too few arguments to function 'clk_hw_forward_rate_request'
     192 |                 clk_hw_forward_rate_request(hw, parent, req, &req_parent);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/clk/at91/clk-generated.c:10:
   include/linux/clk-provider.h:68:6: note: declared here
      68 | void clk_hw_forward_rate_request(const struct clk_hw *core,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/clk_hw_forward_rate_request +192 drivers/clk/at91/clk-generated.c

   129	
   130	static int clk_generated_determine_rate(struct clk_hw *hw,
   131						struct clk_rate_request *req)
   132	{
   133		struct clk_generated *gck = to_clk_generated(hw);
   134		struct clk_hw *parent = NULL;
   135		long best_rate = -EINVAL;
   136		unsigned long min_rate, parent_rate;
   137		int best_diff = -1;
   138		int i;
   139		u32 div;
   140	
   141		/* do not look for a rate that is outside of our range */
   142		if (gck->range.max && req->rate > gck->range.max)
   143			req->rate = gck->range.max;
   144		if (gck->range.min && req->rate < gck->range.min)
   145			req->rate = gck->range.min;
   146	
   147		for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
   148			if (gck->chg_pid == i)
   149				continue;
   150	
   151			parent = clk_hw_get_parent_by_index(hw, i);
   152			if (!parent)
   153				continue;
   154	
   155			parent_rate = clk_hw_get_rate(parent);
   156			min_rate = DIV_ROUND_CLOSEST(parent_rate, GENERATED_MAX_DIV + 1);
   157			if (!parent_rate ||
   158			    (gck->range.max && min_rate > gck->range.max))
   159				continue;
   160	
   161			div = DIV_ROUND_CLOSEST(parent_rate, req->rate);
   162			if (div > GENERATED_MAX_DIV + 1)
   163				div = GENERATED_MAX_DIV + 1;
   164	
   165			clk_generated_best_diff(req, parent, parent_rate, div,
   166						&best_diff, &best_rate);
   167	
   168			if (!best_diff)
   169				break;
   170		}
   171	
   172		/*
   173		 * The audio_pll rate can be modified, unlike the five others clocks
   174		 * that should never be altered.
   175		 * The audio_pll can technically be used by multiple consumers. However,
   176		 * with the rate locking, the first consumer to enable to clock will be
   177		 * the one definitely setting the rate of the clock.
   178		 * Since audio IPs are most likely to request the same rate, we enforce
   179		 * that the only clks able to modify gck rate are those of audio IPs.
   180		 */
   181	
   182		if (gck->chg_pid < 0)
   183			goto end;
   184	
   185		parent = clk_hw_get_parent_by_index(hw, gck->chg_pid);
   186		if (!parent)
   187			goto end;
   188	
   189		for (div = 1; div < GENERATED_MAX_DIV + 2; div++) {
   190			struct clk_rate_request req_parent;
   191	
 > 192			clk_hw_forward_rate_request(hw, parent, req, &req_parent);
   193			req_parent.rate = req->rate * div;
   194			if (__clk_determine_rate(parent, &req_parent))
   195				continue;
   196			clk_generated_best_diff(req, parent, req_parent.rate, div,
   197						&best_diff, &best_rate);
   198	
   199			if (!best_diff)
   200				break;
   201		}
   202	
   203	end:
   204		pr_debug("GCLK: %s, best_rate = %ld, parent clk: %s @ %ld\n",
   205			 __func__, best_rate,
   206			 __clk_get_name((req->best_parent_hw)->clk),
   207			 req->best_parent_rate);
   208	
   209		if (best_rate < 0 || (gck->range.max && best_rate > gck->range.max))
   210			return -EINVAL;
   211	
   212		req->rate = best_rate;
   213		return 0;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

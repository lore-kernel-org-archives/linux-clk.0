Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101C0C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 15:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240693AbiCYPTI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 11:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376354AbiCYPSu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 11:18:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22337DEB82
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648221307; x=1679757307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EiC6FPIM1jpf2VjCdvZzXxcTxJtkLhL8k3r+ijs+1Kk=;
  b=GY87VfpNW0zr3gsl7nXfOcEmQHE6RByxbwubtxxmUQREY5WktiAPzACf
   uZWXJGgRxrDH9mVHtCK/lFVUInQG+amS7Pq0W8yq+2HxtT9aIJBevDrm4
   arqVxSbfPz/+143w16BsGrI4ATwVTy/17oVpwXvSwE6nXZfJ6pNlI4A6V
   7stEcrgugOfUL1RfLblK43518hWSkZDphXOgGwYor5liYrSphQ/o+5tPh
   GiINI7t/2uznpP+OeZjsBW5pdH20sve+Z2oEZ1YGXcyWtfblapmQ5xwsH
   FOSl3aiLTkbULZAjvT+N4ya/kYjGG5Pl9hTO9zqumRYs9fxvVAbWIhFAC
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="240807099"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="240807099"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 08:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="650267905"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Mar 2022 08:14:39 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nXleA-000MKe-Jf; Fri, 25 Mar 2022 15:14:38 +0000
Date:   Fri, 25 Mar 2022 23:13:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>, linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     kbuild-all@lists.01.org,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 3/3] clk: Drop the rate range on clk_put
Message-ID: <202203252333.iuCaJrqe-lkp@intel.com>
References: <20220325105822.1723827-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325105822.1723827-4-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on next-20220325]
[cannot apply to v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/clk-Some-Clock-Range-Fixes/20220325-190055
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-oxnas_v6_defconfig (https://download.01.org/0day-ci/archive/20220325/202203252333.iuCaJrqe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b7aab8e3d4794c4df1a43452696f95b4eee510f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Some-Clock-Range-Fixes/20220325-190055
        git checkout b7aab8e3d4794c4df1a43452696f95b4eee510f5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/clk.c:2346: warning: expecting prototype for clk_set_rate_range(). Prototype was for clk_set_rate_range_nolock() instead


vim +2346 drivers/clk/clk.c

55e9b8b7b806ec Jerome Brunet 2017-12-01  2334  
4dff95dc9477a3 Stephen Boyd  2015-04-30  2335  /**
4dff95dc9477a3 Stephen Boyd  2015-04-30  2336   * clk_set_rate_range - set a rate range for a clock source
4dff95dc9477a3 Stephen Boyd  2015-04-30  2337   * @clk: clock source
4dff95dc9477a3 Stephen Boyd  2015-04-30  2338   * @min: desired minimum clock rate in Hz, inclusive
4dff95dc9477a3 Stephen Boyd  2015-04-30  2339   * @max: desired maximum clock rate in Hz, inclusive
4dff95dc9477a3 Stephen Boyd  2015-04-30  2340   *
4dff95dc9477a3 Stephen Boyd  2015-04-30  2341   * Returns success (0) or negative errno.
4dff95dc9477a3 Stephen Boyd  2015-04-30  2342   */
b7aab8e3d4794c Maxime Ripard 2022-03-25  2343  static int clk_set_rate_range_nolock(struct clk *clk,
b7aab8e3d4794c Maxime Ripard 2022-03-25  2344  				     unsigned long min,
b7aab8e3d4794c Maxime Ripard 2022-03-25  2345  				     unsigned long max)
a093bde2b45a0a Ulf Hansson   2012-08-31 @2346  {
4dff95dc9477a3 Stephen Boyd  2015-04-30  2347  	int ret = 0;
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2348  	unsigned long old_min, old_max, rate;
4dff95dc9477a3 Stephen Boyd  2015-04-30  2349  
b7aab8e3d4794c Maxime Ripard 2022-03-25  2350  	lockdep_assert_held(&prepare_lock);
b7aab8e3d4794c Maxime Ripard 2022-03-25  2351  
4dff95dc9477a3 Stephen Boyd  2015-04-30  2352  	if (!clk)
4dff95dc9477a3 Stephen Boyd  2015-04-30  2353  		return 0;
4dff95dc9477a3 Stephen Boyd  2015-04-30  2354  
03813d9b7d4368 Maxime Ripard 2020-12-07  2355  	trace_clk_set_rate_range(clk->core, min, max);
03813d9b7d4368 Maxime Ripard 2020-12-07  2356  
4dff95dc9477a3 Stephen Boyd  2015-04-30  2357  	if (min > max) {
4dff95dc9477a3 Stephen Boyd  2015-04-30  2358  		pr_err("%s: clk %s dev %s con %s: invalid range [%lu, %lu]\n",
4dff95dc9477a3 Stephen Boyd  2015-04-30  2359  		       __func__, clk->core->name, clk->dev_id, clk->con_id,
4dff95dc9477a3 Stephen Boyd  2015-04-30  2360  		       min, max);
4dff95dc9477a3 Stephen Boyd  2015-04-30  2361  		return -EINVAL;
4dff95dc9477a3 Stephen Boyd  2015-04-30  2362  	}
a093bde2b45a0a Ulf Hansson   2012-08-31  2363  
55e9b8b7b806ec Jerome Brunet 2017-12-01  2364  	if (clk->exclusive_count)
55e9b8b7b806ec Jerome Brunet 2017-12-01  2365  		clk_core_rate_unprotect(clk->core);
55e9b8b7b806ec Jerome Brunet 2017-12-01  2366  
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2367  	/* Save the current values in case we need to rollback the change */
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2368  	old_min = clk->min_rate;
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2369  	old_max = clk->max_rate;
4dff95dc9477a3 Stephen Boyd  2015-04-30  2370  	clk->min_rate = min;
4dff95dc9477a3 Stephen Boyd  2015-04-30  2371  	clk->max_rate = max;
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2372  
10c46f2ea91420 Maxime Ripard 2022-02-25  2373  	if (!clk_core_check_boundaries(clk->core, min, max)) {
10c46f2ea91420 Maxime Ripard 2022-02-25  2374  		ret = -EINVAL;
10c46f2ea91420 Maxime Ripard 2022-02-25  2375  		goto out;
10c46f2ea91420 Maxime Ripard 2022-02-25  2376  	}
10c46f2ea91420 Maxime Ripard 2022-02-25  2377  
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2378  	/*
c80ac50cbb378a Maxime Ripard 2022-02-25  2379  	 * Since the boundaries have been changed, let's give the
c80ac50cbb378a Maxime Ripard 2022-02-25  2380  	 * opportunity to the provider to adjust the clock rate based on
c80ac50cbb378a Maxime Ripard 2022-02-25  2381  	 * the new boundaries.
c80ac50cbb378a Maxime Ripard 2022-02-25  2382  	 *
c80ac50cbb378a Maxime Ripard 2022-02-25  2383  	 * We also need to handle the case where the clock is currently
c80ac50cbb378a Maxime Ripard 2022-02-25  2384  	 * outside of the boundaries. Clamping the last requested rate
c80ac50cbb378a Maxime Ripard 2022-02-25  2385  	 * to the current minimum and maximum will also handle this.
c80ac50cbb378a Maxime Ripard 2022-02-25  2386  	 *
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2387  	 * FIXME:
c80ac50cbb378a Maxime Ripard 2022-02-25  2388  	 * There is a catch. It may fail for the usual reason (clock
c80ac50cbb378a Maxime Ripard 2022-02-25  2389  	 * broken, clock protected, etc) but also because:
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2390  	 * - round_rate() was not favorable and fell on the wrong
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2391  	 *   side of the boundary
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2392  	 * - the determine_rate() callback does not really check for
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2393  	 *   this corner case when determining the rate
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2394  	 */
a9b269310ad9ab Maxime Ripard 2022-02-25  2395  	rate = clamp(clk->core->req_rate, min, max);
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2396  	ret = clk_core_set_rate_nolock(clk->core, rate);
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2397  	if (ret) {
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2398  		/* rollback the changes */
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2399  		clk->min_rate = old_min;
6562fbcf3ad5ff Jerome Brunet 2017-12-01  2400  		clk->max_rate = old_max;
4dff95dc9477a3 Stephen Boyd  2015-04-30  2401  	}
a093bde2b45a0a Ulf Hansson   2012-08-31  2402  
10c46f2ea91420 Maxime Ripard 2022-02-25  2403  out:
55e9b8b7b806ec Jerome Brunet 2017-12-01  2404  	if (clk->exclusive_count)
55e9b8b7b806ec Jerome Brunet 2017-12-01  2405  		clk_core_rate_protect(clk->core);
a093bde2b45a0a Ulf Hansson   2012-08-31  2406  
b7aab8e3d4794c Maxime Ripard 2022-03-25  2407  	return ret;
b7aab8e3d4794c Maxime Ripard 2022-03-25  2408  }
b7aab8e3d4794c Maxime Ripard 2022-03-25  2409  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03052C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 20:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241594AbiEKUXY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 16:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238984AbiEKUXX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 16:23:23 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0B372E01
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652300602; x=1683836602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6AswqkWmXU5dYcrkV9n8nA2qHRT+5PvyPN57aXvTIU=;
  b=CbxRkgg13trWyOZkLE6CdmtEk1HogWZkdnTIkRMDqUORdwOWvRtv1pHs
   Fo9ceI9MGeTtp7EpAWH2/rx9dG6MdnhssjpQclE8iDu4EkRUfY21Df8lN
   yKDgYltLpkGEP5sugNAGRKAJ5/E3QL3LqBGaYpxOgi9LkpZREuiQcyD9Y
   6elFObP6n8G591HbWx0J3fgCn5mBwC78adJUmTPQD+1V4X+sWetJFWls9
   pJ3CYx6VNCjd3Y5qukq7Zq8G+JYMx2eEOvmPtqAXZAsubaPATOPtWU1Yk
   4j6sKTG2wQCiOqK2ZhKxvBF+k4ad/1PfxcDiuHiKVRL3ogb/HcW1JtXWy
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="267392092"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="267392092"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 13:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
   d="scan'208";a="572236452"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 May 2022 13:23:18 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nosrd-000JXS-W6;
        Wed, 11 May 2022 20:23:17 +0000
Date:   Thu, 12 May 2022 04:23:11 +0800
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
Message-ID: <202205120459.Wey9QKrW-lkp@intel.com>
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
[cannot apply to anholt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220511-224533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: x86_64-randconfig-s021-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120459.Wey9QKrW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/32af2a918274a92da86089672d5d7adba63dc0cf
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-More-clock-rate-fixes-and-tests/20220511-224533
        git checkout 32af2a918274a92da86089672d5d7adba63dc0cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/clk/clk.c:1502:45: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct clk_rate_request *const old_req @@     got struct clk_rate_request const *old_req @@
   drivers/clk/clk.c:1502:45: sparse:     expected struct clk_rate_request *const old_req
   drivers/clk/clk.c:1502:45: sparse:     got struct clk_rate_request const *old_req

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

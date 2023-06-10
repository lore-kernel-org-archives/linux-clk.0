Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FB4C7EE29
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jun 2023 04:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjFJEjR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jun 2023 00:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjFJEjQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jun 2023 00:39:16 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14193AAA
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 21:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686371955; x=1717907955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4xz4XkPwI0i5FFgpnID3pgqRuERUILkXUqai/JNiGdk=;
  b=RzOp+hbTWv+4aFL6kFToAGzIoBCAjTw24te2z1y+SZiEL9LKcLFZXDoW
   SecIGWfx/KetLofzOZtvyKuB1W3HooBLXkqcNGoybAR6H8a8BB0JQkIbJ
   F877s8bt0j87a1JYYzQJW4HDXXYt8yUJ2vUJvwXHvRjY1wsu92kp7tukn
   qk13UIJItZAgXJxWbc12f5U0OHrmmM4pHqQl0UclVNNgBcP2PLcvsKBF5
   SprhphXTz7EUvcBgDtvjo+H3wDHG/AFpJKsHaUm7rwHaKaz0j0PBGbUja
   HNHNx8qNRQg06SYmiADAiJpqLz5/Pm6AjFBZLV49DkGesneUD0R1lCs8r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338091978"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338091978"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 21:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823288974"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="823288974"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 21:39:14 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q7qNd-0009iy-2D;
        Sat, 10 Jun 2023 04:39:13 +0000
Date:   Sat, 10 Jun 2023 12:38:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     oe-kbuild-all@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [clk:clk-determine-rate 66/68]
 sound/soc/codecs/tlv320aic32x4-clk.c:219 clk_aic32x4_pll_determine_rate()
 warn: unsigned 'rate' is never less than zero.
Message-ID: <202306101217.08CRVGcK-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-determine-rate
head:   326cc42f9fdc3030676e949d5cea3ccc923fd1de
commit: 25d43ec352eaefbfaee0912d02b6f10ea606931f [66/68] ASoC: tlv320aic32x4: pll: Switch to determine_rate
config: x86_64-randconfig-m001-20230608 (https://download.01.org/0day-ci/archive/20230610/202306101217.08CRVGcK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101217.08CRVGcK-lkp@intel.com/

smatch warnings:
sound/soc/codecs/tlv320aic32x4-clk.c:219 clk_aic32x4_pll_determine_rate() warn: unsigned 'rate' is never less than zero.

vim +/rate +219 sound/soc/codecs/tlv320aic32x4-clk.c

   206	
   207	static int clk_aic32x4_pll_determine_rate(struct clk_hw *hw,
   208						  struct clk_rate_request *req)
   209	{
   210		struct clk_aic32x4_pll_muldiv settings;
   211		unsigned long rate;
   212		int ret;
   213	
   214		ret = clk_aic32x4_pll_calc_muldiv(&settings, req->rate, req->best_parent_rate);
   215		if (ret < 0)
   216			return -EINVAL;
   217	
   218		rate = clk_aic32x4_pll_calc_rate(&settings, req->best_parent_rate);
 > 219		if (rate < 0)
   220			return rate;
   221	
   222		req->rate = rate;
   223		return 0;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
